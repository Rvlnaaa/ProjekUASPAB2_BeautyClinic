import 'package:flutter/material.dart';
import 'package:beauty_clinic_app/widgets/custom_button.dart';
import 'package:beauty_clinic_app/widgets/custom_textfield.dart';
import 'package:beauty_clinic_app/utils/app_colors.dart';
import 'login_page.dart';

import '../../services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const SizedBox(height: 40),

                Text(
                  'Register Account',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'Silahkan isi data terlebih dahulu',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),

                const SizedBox(height: 40),

                CustomTextField(
                  hintText: 'Masukkan Nama',
                  controller: nameController,
                ),

                const SizedBox(height: 20),

                CustomTextField(
                  hintText: 'Masukkan Email',
                  controller: emailController,
                ),

                const SizedBox(height: 20),

                CustomTextField(
                  hintText: 'Masukkan Password',
                  obscureText: true,
                  controller: passwordController,
                ),

                const SizedBox(height: 20),

                CustomTextField(
                  hintText: 'Konfirmasi Password',
                  obscureText: true,
                  controller: confirmPasswordController,
                ),

                const SizedBox(height: 30),

                CustomButton(
                  text: 'Daftar',

                  onPressed: () async {
                    if (passwordController.text !=
                        confirmPasswordController.text) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Password tidak cocok')),
                      );

                      return;
                    }

                    final success = await AuthService.register(
                      name: nameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                    );

                    if (await success) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Register berhasil')),
                      );

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Email sudah digunakan')),
                      );
                    }
                  },
                ),

                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    const Text('Sudah memiliki akun?'),

                    TextButton(
                      onPressed: () async {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },

                      child: Text(
                        'Masuk',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
