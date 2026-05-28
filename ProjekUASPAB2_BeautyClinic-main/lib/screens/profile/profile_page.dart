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

  Future<void> pickImage() async {

    final pickedImage =
        await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedImage != null) {

      setState(() {
        profileImage = File(
          pickedImage.path,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return ValueListenableBuilder(
      valueListenable: isEnglishNotifier,

      builder: (
        context,
        bool isEnglish,
        child,
      ) {

        return Scaffold(
          appBar: AppBar(
            title: Text(
              isEnglish
                  ? 'Profile'
                  : 'Profil',
            ),
          ),

          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),

            child: Column(
              children: [

                const SizedBox(height: 20),

                GestureDetector(
                  onTap: pickImage,

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

                  title: isEnglish
                      ? 'Edit Profile'
                      : 'Edit Profil',

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

                  title: isEnglish
                      ? 'Treatment History'
                      : 'Riwayat Treatment',

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

                  title: isEnglish
                      ? 'Favorite Treatment'
                      : 'Treatment Favorit',

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

                  title: isEnglish
                      ? 'Settings'
                      : 'Pengaturan',

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

                  title: isEnglish
                      ? 'Logout'
                      : 'Keluar',

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