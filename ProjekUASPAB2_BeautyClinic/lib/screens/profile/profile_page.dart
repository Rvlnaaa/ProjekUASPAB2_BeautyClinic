import 'package:beauty_clinic_app/screens/auth/login_page.dart';
import 'package:beauty_clinic_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'edit_profile_page.dart';
import '../history/history_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            const SizedBox(height: 20),

            const CircleAvatar(
              radius: 55,
              backgroundColor: Colors.amber,
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),

            const SizedBox(height: 20),

            const Text(
              'Wewen',

              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Text(
              'wewen@gmail.com',

              style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
            ),

            const SizedBox(height: 40),

            profileMenu(
              icon: Icons.edit,
              title: 'Edit Profile',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditProfilePage(),
                  ),
                );
              },
            ),

            profileMenu(
              icon: Icons.history,
              title: 'Riwayat Treatment',

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HistoryPage()),
                );
              },
            ),

            profileMenu(icon: Icons.favorite, title: 'Favorite Treatment'),

            profileMenu(icon: Icons.settings, title: 'Pengaturan'),

            profileMenu(
              icon: Icons.logout,
              title: 'Logout',
              color: Colors.red,

              onTap: () {
                AuthService.logout();

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget profileMenu({
    required IconData icon,
    required String title,
    Color color = Colors.black,
    VoidCallback? onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),

        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.08), blurRadius: 10),
        ],
      ),

      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: color),

        title: Text(
          title,

          style: TextStyle(color: color, fontWeight: FontWeight.w500),
        ),

        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
      ),
    );
  }
}
