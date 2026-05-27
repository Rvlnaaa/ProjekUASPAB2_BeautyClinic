import 'package:flutter/material.dart';
import 'package:beauty_clinic_app/utils/app_colors.dart';
import 'package:beauty_clinic_app/widgets/custom_button.dart';
import 'package:beauty_clinic_app/widgets/custom_textfield.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),

          child: SingleChildScrollView(
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

                const CustomTextField(hintText: 'Masukkan Nama'),

                const SizedBox(height: 20),

                const CustomTextField(hintText: 'Masukkan Email'),

                const SizedBox(height: 20),

                const CustomTextField(
                  hintText: 'Masukkan Password',
                  obscureText: true,
                ),

                const SizedBox(height: 20),

                const CustomTextField(
                  hintText: 'Konfirmasi Password',
                  obscureText: true,
                ),

                const SizedBox(height: 30),

                CustomButton(text: 'Daftar', onPressed: () {}),

                const SizedBox(height: 40),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    const Text('Sudah memiliki akun?'),

                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
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
