import 'package:flutter/material.dart';

import '../../main.dart';
import 'package:beauty_clinic_app/utils/app_colors.dart';
import 'package:beauty_clinic_app/widgets/custom_button.dart';
import 'package:beauty_clinic_app/widgets/custom_textfield.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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

              child: SingleChildScrollView(
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
                          ? 'Register Account'
                          : 'Daftar Akun',

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
                          ? 'Please fill in the data first'
                          : 'Silahkan isi data terlebih dahulu',

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
                          ? 'Enter Name'
                          : 'Masukkan Nama',
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    CustomTextField(
                      hintText: isEnglish
                          ? 'Enter Email'
                          : 'Masukkan Email',
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    CustomTextField(
                      hintText: isEnglish
                          ? 'Enter Password'
                          : 'Masukkan Password',

                      obscureText: true,
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    CustomTextField(
                      hintText: isEnglish
                          ? 'Confirm Password'
                          : 'Konfirmasi Password',

                      obscureText: true,
                    ),

                    const SizedBox(
                      height: 30,
                    ),

                    CustomButton(
                      text: isEnglish
                          ? 'Register'
                          : 'Daftar',

                      onPressed: () {},
                    ),

                    const SizedBox(
                      height: 40,
                    ),

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .center,

                      children: [

                        Text(
                          isEnglish
                              ? 'Already have an account?'
                              : 'Sudah memiliki akun?',
                        ),

                        TextButton(
                          onPressed: () {

                            Navigator.pop(
                                context);
                          },

                          child: Text(
                            isEnglish
                                ? 'Login'
                                : 'Masuk',

                            style: TextStyle(
                              color:
                                  AppColors.primary,

                              fontWeight:
                                  FontWeight.bold,
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
      },
    );
  }
}