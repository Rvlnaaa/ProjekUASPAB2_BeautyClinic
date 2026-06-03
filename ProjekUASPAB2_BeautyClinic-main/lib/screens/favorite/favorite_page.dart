import 'package:flutter/material.dart';

import '../../models/dummy_clinic.dart';
import '../home/clinic_detail_page.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final favoriteClinics = dummyClinic
        .where(
          (clinic) => clinic.isFavorite,
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Klinik Favorit',
        ),
      ),

      body: favoriteClinics.isEmpty
          ? const Center(
              child: Text(
                'Belum ada klinik favorit',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(20),

              itemCount: favoriteClinics.length,

              itemBuilder: (
                context,
                index,
              ) {
                final clinic =
                    favoriteClinics[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            ClinicDetailPage(
                          clinic: clinic,
                        ),
                      ),
                    );
                  },

                  child: favoriteCard(
                    clinic: clinic,
                  ),
                );
              },
            ),
    );
  }

  Widget favoriteCard({
    required dynamic clinic,
  }) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 18,
      ),

      padding: const EdgeInsets.all(
        18,
      ),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(
          20,
        ),

        boxShadow: [
          BoxShadow(
            color: Colors.grey
                .withOpacity(0.08),

            blurRadius: 10,
          ),
        ],
      ),

      child: Row(
        children: [
          ClipRRect(
            borderRadius:
                BorderRadius.circular(
              15,
            ),

            child: Image.asset(
              clinic.image,

              width: 70,
              height: 70,

              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(
            width: 18,
          ),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment
                      .start,

              children: [
                Text(
                  clinic.name,

                  style:
                      const TextStyle(
                    fontSize: 18,

                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                const SizedBox(
                  height: 6,
                ),

                Text(
                  clinic.address,

                  style: TextStyle(
                    fontSize: 14,

                    color: Colors
                        .grey.shade600,
                  ),
                ),
              ],
            ),
          ),

          IconButton(
            onPressed: () {
              setState(() {
                clinic.isFavorite =
                    false;
              });
            },

            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}