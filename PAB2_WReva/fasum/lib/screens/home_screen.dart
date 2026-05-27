import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fasum/l10n/app_localizations.dart';
import 'package:fasum/screens/add_post_screen.dart';
import 'package:fasum/screens/detail_screen.dart';
import 'package:fasum/screens/settings_screen.dart';
import 'package:fasum/screens/sign_in_screen.dart';
import 'package:fasum/utils/firestore_converters.dart';
import 'package:fasum/utils/l10n_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedCategory;

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    if (!mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => SignInScreen()),
      (route) => false, // Hapus semua route sebelumnya
    );
  }

  void _showCategoryFilter() async {
    final categories = localizedCategories(context);
    final result = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) {
        final l = AppLocalizations.of(sheetContext);
        return SafeArea(
          child: SizedBox(
            height: MediaQuery.of(sheetContext).size.height * 0.75,
            child: ListView(
              padding: const EdgeInsets.only(bottom: 24),
              children: [
                ListTile(
                  leading: const Icon(Icons.clear),
                  title: Text(l.allCategories),
                  onTap:
                      () => Navigator.pop(
                        context,
                        null,
                      ), // Null untuk memilih semua kategori
                ),
                const Divider(),
                ...categories.map(
                  (category) => ListTile(
                    title: Text(category),
                    trailing:
                        selectedCategory == category
                            ? Icon(
                              Icons.check,
                              color: Theme.of(context).colorScheme.primary,
                            )
                            : null,
                    onTap:
                        () => Navigator.pop(
                          context,
                          category,
                        ), // Kategori yang dipilih
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    if (result != null) {
      setState(() {
        selectedCategory =
            result; // Set kategori yang dipilih atau null untuk Semua Kategori
      });
    } else {
      // Jika result adalah null, berarti memilih Semua Kategori
      setState(() {
        selectedCategory =
            null; // Reset ke null untuk menampilkan semua kategori
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Fasum',
          style: TextStyle(
            color: Colors.green[600],
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: _showCategoryFilter,
            icon: const Icon(Icons.filter_list),
            tooltip: l.filterCategory,
          ),
          IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingsScreen(),
              ), // MaterialPageRoute
            );
          },
          icon: const Icon(Icons.settings),
          tooltip: AppLocalizations.of(context).settings,
          ),
          IconButton(
            onPressed: () {
              signOut();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
        },
        child: StreamBuilder(
          stream:
              FirebaseFirestore.instance
                  .collection('posts')
                  .orderBy('createdAt', descending: true)
                  .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    l.failedToLoadReports('${snapshot.error}'),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            final posts =
                snapshot.data!.docs.where((doc) {
                  final data = doc.data();
                  final category = firestoreText(data['category'], 'Lainnya');
                  return selectedCategory == null ||
                      selectedCategory == category;
                }).toList();

            if (posts.isEmpty) {
              return Center(
                child: Text(l.noReportsInThisCategory),
              );
            }

            return ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                try {
                  final data = posts[index].data();
                  final String? imgB64 = firestoreImageBase64(data['image']);
                  final String description = firestoreText(
                    data['description'],
                    '',
                  );
                  final String fullName = firestoreText(
                    data['fullName'],
                    l.anonymous,
                  );
                  final double latitude = firestoreDouble(data['latitude']);
                  final double longitude = firestoreDouble(data['longitude']);
                  final String category = firestoreText(
                    data['category'],
                    l.categoryLainnya,
                  );
                  final DateTime createdAt = createdAtFromFirestore(
                    data['createdAt'],
                  );
                  final String heroTag =
                      'fasum-image-${createdAt.millisecondsSinceEpoch}';

                  return InkWell(
                    onTap: () {
                      if (imgB64 == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(l.imageNotAvailable),
                          ),
                        );
                        return;
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => DetailScreen(
                                imageBase64: imgB64,
                                description: description,
                                createdAt: createdAt,
                                fullName: fullName,
                                latitude: latitude,
                                longitude: longitude,
                                category: category,
                                heroTag: heroTag,
                              ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 1,
                      color: Theme.of(context).colorScheme.surfaceContainerLow,
                      shadowColor: Theme.of(context).colorScheme.shadow,
                      margin: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (imgB64 != null)
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(10),
                              ),
                              child: Hero(
                                tag: heroTag,
                                child: Image.memory(
                                  base64Decode(imgB64),
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: 200,
                                ),
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      fullName,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      formatLocalizedTime(context, createdAt),
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      description,
                                      style: const TextStyle(fontSize: 16),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } catch (e, st) {
                  debugPrint('Baris post error: $e\n$st');
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(l.unableToDisplayReport),
                      subtitle: Text('$e'),
                    ),
                  );
                }
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => const AddPostScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}