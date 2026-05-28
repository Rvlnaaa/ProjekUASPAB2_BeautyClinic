import 'package:beauty_clinic_app/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import 'package:beauty_clinic_app/widgets/custom_button.dart';
import 'package:beauty_clinic_app/widgets/custom_textfield.dart';
import 'package:beauty_clinic_app/utils/app_colors.dart';
import 'package:beauty_clinic_app/screens/auth/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static String userName = '';
  static String userEmail = '';

  @override
  State<LoginPage> createState() =>
      _LoginPageState();
}

class _LoginPageState
    extends State<LoginPage> {

  final TextEditingController
      emailController =
      TextEditingController();

  final TextEditingController
      passwordController =
      TextEditingController();

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
          backgroundColor:
              AppColors.white,

          body: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.all(24),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment
                        .start,

                children: [

                  const SizedBox(
                    height: 40,
                  ),

                  Text(
                    isEnglish
                        ? 'Sign In App'
                        : 'Masuk Aplikasi',

                    style: TextStyle(
                      fontSize: 28,
                      fontWeight:
                          FontWeight.bold,
                      color:
                          AppColors.primary,
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  Text(
                    isEnglish
                        ? 'Welcome back! Please login first'
                        : 'Selamat datang!\nSilahkan login terlebih dahulu',

                    style:
                        const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(
                    height: 40,
                  ),

                  CustomTextField(
                    hintText: isEnglish
                        ? 'Enter Email'
                        : 'Masukkan Email',

                    controller:
                        emailController,
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  CustomTextField(
                    hintText: isEnglish
                        ? 'Enter Password'
                        : 'Masukkan Password',

                    obscureText: true,

                    controller:
                        passwordController,
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  CustomButton(
                    text: isEnglish
                        ? 'Login'
                        : 'Masuk',

                    onPressed: () {

                      LoginPage.userEmail =
                          emailController
                              .text;

                      LoginPage.userName =
                          emailController
                              .text
                              .split('@')[0];

                      Navigator.pushReplacement(
                        context,

                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  BottomNavbar(),
                        ),
                      );
                    },
                  ),

                  const Spacer(),

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .center,

                    children: [

                      Text(
                        isEnglish
                            ? 'Don\'t have an account?'
                            : 'Belum memiliki akun?',
                      ),

                      TextButton(
                        onPressed: () {

                          Navigator.push(
                            context,

                            MaterialPageRoute(
                              builder:
                                  (context) =>
                                      RegisterPage(),
                            ),
                          );
                        },

                        child: Text(
                          isEnglish
                              ? 'Register'
                              : 'Daftar',

                          style:
                              TextStyle(
                            color:
                                AppColors
                                    .primary,

                            fontWeight:
                                FontWeight
                                    .bold,
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
      },
    );
  }
}