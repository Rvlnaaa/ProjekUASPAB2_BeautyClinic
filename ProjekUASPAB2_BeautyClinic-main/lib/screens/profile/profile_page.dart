import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../main.dart';
import '../auth/login_page.dart';
import '../favorite/favorite_page.dart';
import '../history/history_page.dart';
import '../settings/settings_page.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() =>
      _ProfilePageState();
}

class _ProfilePageState
    extends State<ProfilePage> {

  File? profileImage;

  Future<void> pickImage(
  ImageSource source,
) async {

  final pickedImage =
      await ImagePicker().pickImage(
    source: source,
  );

  if (pickedImage != null) {

    setState(() {
      profileImage = File(
        pickedImage.path,
      );
    });
  }
}

void showImagePicker() {

  showModalBottomSheet(
    context: context,

    builder: (context) {

      return SafeArea(
        child: Wrap(
          children: [

            ListTile(
              leading: const Icon(
                Icons.camera_alt,
              ),

              title: const Text(
                'Ambil dari Kamera',
              ),

              onTap: () {

                Navigator.pop(context);

                pickImage(
                  ImageSource.camera,
                );
              },
            ),

            ListTile(
              leading: const Icon(
                Icons.photo_library,
              ),

              title: const Text(
                'Pilih dari Galeri',
              ),

              onTap: () {

                Navigator.pop(context);

                pickImage(
                  ImageSource.gallery,
                );
              },
            ),
          ],
        ),
      );
    },
  );
}
  @override
  Widget build(BuildContext context) {

   return ValueListenableBuilder<String>(
  valueListenable: languageNotifier,

  builder: (
    context,
    String language,
    child,
  ) {

  return Scaffold(

          appBar: AppBar(
  title: Text(
    language == 'id'
        ? 'Profil'
        : language == 'en'
            ? 'Profile'
            : 'プロフィール',
  ),
),

          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),

            child: Column(
              children: [

                const SizedBox(height: 20),

                GestureDetector(
                  onTap: showImagePicker,

                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor:
                        Colors.amber,

                    backgroundImage:
                        profileImage != null
                            ? Image.network(
                                profileImage!
                                    .path,
                                fit:
                                    BoxFit.cover,
                              ).image
                            : null,

                    child:
                        profileImage == null
                            ? const Icon(
                                Icons.person,
                                size: 60,
                                color:
                                    Colors.white,
                              )
                            : null,
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  LoginPage.userName
                          .isEmpty
                      ? 'Leonica User'
                      : LoginPage.userName,

                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  LoginPage.userEmail
                          .isEmpty
                      ? 'user@gmail.com'
                      : LoginPage.userEmail,

                  style: TextStyle(
                    fontSize: 16,
                    color: Colors
                        .grey.shade600,
                  ),
                ),

                const SizedBox(height: 40),

                profileMenu(
                  icon: Icons.edit,

                  title: language == 'id'
    ? 'Edit Profil'
    : language == 'en'
        ? 'Edit Profile'
        : 'プロフィール編集',

                  onTap: () {

                    Navigator.push(
                      context,

                      MaterialPageRoute(
                        builder:
                            (context) =>
                                const EditProfilePage(),
                      ),
                    ).then((_) {
                      setState(() {});
                    });
                  },
                ),

                profileMenu(
                  icon: Icons.history,

                  title: language == 'id'
    ? 'Riwayat Treatment'
    : language == 'en'
        ? 'Treatment History'
        : '施術履歴',

                  onTap: () {

                    Navigator.push(
                      context,

                      MaterialPageRoute(
                        builder:
                            (context) =>
                                const HistoryPage(),
                      ),
                    );
                  },
                ),

                profileMenu(
                  icon: Icons.favorite,

                  title: language == 'id'
    ? 'Treatment Favorit'
    : language == 'en'
        ? 'Favorite Treatment'
        : 'お気に入り施術',

                  onTap: () {

                    Navigator.push(
                      context,

                      MaterialPageRoute(
                        builder:
                            (context) =>
                                const FavoritePage(),
                      ),
                    );
                  },
                ),

                profileMenu(
                  icon: Icons.settings,

              title: language == 'id'
    ? 'Pengaturan'
    : language == 'en'
        ? 'Settings'
        : '設定',

                  onTap: () {

                    Navigator.push(
                      context,

                      MaterialPageRoute(
                        builder:
                            (context) =>
                                const SettingsPage(),
                      ),
                    );
                  },
                ),

                profileMenu(
                  icon: Icons.logout,
                  color: Colors.red,

                  title: language == 'id'
    ? 'Keluar'
    : language == 'en'
        ? 'Logout'
        : 'ログアウト',

                  onTap: () {

                    Navigator.pushReplacement(
                      context,

                      MaterialPageRoute(
                        builder:
                            (context) =>
                                const LoginPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget profileMenu({
    required IconData icon,
    required String title,
    Color color = Colors.black,
    VoidCallback? onTap,
  }) {

    return Container(
      margin:
          const EdgeInsets.only(
        bottom: 15,
      ),

      decoration: BoxDecoration(
        color:
            Theme.of(context).cardColor,

        borderRadius:
            BorderRadius.circular(18),

        boxShadow: [
          BoxShadow(
            color: Colors.grey
                .withOpacity(0.08),
            blurRadius: 10,
          ),
        ],
      ),

      child: ListTile(
        onTap: onTap,

        leading: Icon(
          icon,
          color: color,
        ),

        title: Text(
          title,

          style: TextStyle(
            color: color,
            fontWeight:
                FontWeight.w500,
          ),
        ),

        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 18,
        ),
      ),
    );
  }
    }