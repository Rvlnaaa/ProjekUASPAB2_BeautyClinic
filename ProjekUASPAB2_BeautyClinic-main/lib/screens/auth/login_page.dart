import 'package:beauty_clinic_app/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  /// LOGIN FUNCTION
  Future<void> login() async {

    String inputEmail =
        emailController.text
            .trim()
            .toLowerCase();

    String inputPassword =
        passwordController.text.trim();

    /// VALIDASI KOSONG
    if (inputEmail.isEmpty ||
        inputPassword.isEmpty) {

      _showDialog(
        "Peringatan",
        "Semua data wajib diisi.",
      );

      return;
    }

    /// AMBIL STORAGE
    SharedPreferences prefs =
        await SharedPreferences
            .getInstance();

    /// AMBIL DATA TERSIMPAN
    String savedEmail =
        (prefs.getString("email") ?? "")
            .toLowerCase();

    String savedPassword =
        prefs.getString("password") ?? "";

    /// EMAIL TIDAK TERDAFTAR
if (savedEmail.isEmpty) {

  _showDialog(
    "Peringatan",
    "Email belum terdaftar.",
  );

  return;
}

/// EMAIL SALAH
if (inputEmail.toLowerCase() !=
    savedEmail.toLowerCase()) {

  _showDialog(
    "Peringatan",
    "Email tidak terdaftar.",
  );

  return;
}

/// PASSWORD SALAH
if (inputPassword.trim() !=
    savedPassword.trim()) {

  _showDialog(
    "Peringatan",
    "Password salah.",
  );

  return;
}

    /// DATA USER
    LoginPage.userEmail =
        inputEmail;

    LoginPage.userName =
        inputEmail.split('@')[0];

    /// LOGIN BERHASIL
    _showDialog(
      "Berhasil",
      "Login berhasil.",
    );

    Future.delayed(
      const Duration(seconds: 1),
          () {

        Navigator.pop(context);

        /// MASUK HOME / DASHBOARD
        Navigator.pushReplacement(
          context,

          MaterialPageRoute(
            builder: (context) =>
                BottomNavbar(),
          ),
        );
      },
    );
  }

  /// DIALOG
  void _showDialog(
      String title,
      String message,
      ) {

    showDialog(
      context: context,

      builder: (context) {

        return AlertDialog(
          backgroundColor:
              Colors.white,

          shape:
              RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(
                    12),
          ),

          title: Text(
            title,

            style: const TextStyle(
              fontWeight:
                  FontWeight.bold,
            ),
          ),

          content: Text(message),

          actions: [

            TextButton(
              onPressed: () =>
                  Navigator.pop(context),

              child: const Text(
                "OK",
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return ValueListenableBuilder(
      valueListenable:
          isEnglishNotifier,

      builder: (
        context,
        bool isEnglish,
        child,
      ) {

        return Scaffold(

          body: Stack(
            children: [

              /// BACKGROUND IMAGE
              Container(
                decoration:
                    const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/klinik.jpg',
                    ),

                    fit: BoxFit.cover,
                  ),
                ),
              ),

              /// OVERLAY GELAP
              Container(
                color: Colors.white
                    .withOpacity(0.10),
              ),

              SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets
                          .symmetric(
                    horizontal: 30,
                  ),

                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .center,

                    children: [

                      /// TITLE
                     Text(
  isEnglish
      ? 'LOGIN'
      : 'MASUK',

  style: const TextStyle(
    fontSize: 42,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 2,
  ),
),

const SizedBox(height: 10),

Text(
  isEnglish
      ? 'Welcome Back!'
      : 'Selamat Datang!',

  textAlign: TextAlign.center,

  style: const TextStyle(
    fontSize: 25,
    color: Colors.white70,
    fontWeight: FontWeight.w400,
  ),
),

const SizedBox(height: 5),

Text(
  isEnglish
      ? 'Please login to continue'
      : 'Silahkan login untuk melanjutkan',

  textAlign: TextAlign.center,

  style: const TextStyle(
    fontSize: 20,
    color: Colors.white60,
  ),
),

                      const SizedBox(
                        height: 50,
                      ),

                      /// EMAIL
                      Container(
                        decoration:
                            BoxDecoration(
                          color: Colors
                              .white
                              .withOpacity(
                                  0.85),

                          borderRadius:
                              BorderRadius
                                  .circular(
                                      15),
                        ),

                        child:
                            CustomTextField(
                          hintText:
                              isEnglish
                                  ? 'Enter Email'
                                  : 'Masukkan Email',

                          controller:
                              emailController,
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      /// PASSWORD
                      Container(
                        decoration:
                            BoxDecoration(
                          color: Colors
                              .white
                              .withOpacity(
                                  0.85),

                          borderRadius:
                              BorderRadius
                                  .circular(
                                      15),
                        ),

                        child:
                            CustomTextField(
                          hintText:
                              isEnglish
                                  ? 'Enter Password'
                                  : 'Masukkan Password',

                          obscureText:
                              true,

                          controller:
                              passwordController,
                        ),
                      ),

                      const SizedBox(
                        height: 35,
                      ),

                      /// BUTTON LOGIN
                      SizedBox(
                        width: 200,

                        child:
                            CustomButton(
                          text: isEnglish
                              ? 'LOGIN'
                              : 'MASUK',

                          onPressed:
                              login,
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      /// REGISTER
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .center,

                        children: [

                          Text(
                            isEnglish
                                ? 'Don\'t have an account?'
                                : 'Belum memiliki akun?',

                            style:
                                const TextStyle(
                              color:
                                  Colors.white,
                            ),
                          ),

                          TextButton(
                            onPressed:
                                () {

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
            ],
          ),
        );
      },
    );
  }
}