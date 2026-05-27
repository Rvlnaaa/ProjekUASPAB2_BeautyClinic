import 'package:flutter/material.dart';
import 'package:beauty_clinic_app/widgets/custom_button.dart';
import 'package:beauty_clinic_app/widgets/custom_textfield.dart';
import 'package:beauty_clinic_app/utils/app_colors.dart';
import 'package:beauty_clinic_app/screens/auth/register_page.dart';
import 'package:beauty_clinic_app/widgets/bottom_navbar.dart';

import '../../services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const SizedBox(height: 40),

              Text(
                'Sign In Apps',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Selamat datang!\nSilahkan login terlebih dahulu',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),

              const SizedBox(height: 40),

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

              const SizedBox(height: 30),

              CustomButton(
                text: 'Masuk',

                onPressed: () async {
                  final success = await AuthService.login(
                    email: emailController.text,
                    password: passwordController.text,
                  );

                  if (await success) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BottomNavbar(),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Email atau password salah'),
                      ),
                    );
                  }
                },
              ),

              const Spacer(),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  const Text('Belum memiliki akun?'),

                  TextButton(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        ),
                      );
                    },

                    child: Text(
                      'Daftar',
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
    );
  }
}
