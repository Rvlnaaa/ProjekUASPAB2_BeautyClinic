import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
import 'package:beauty_clinic_app/utils/app_colors.dart';
import 'package:beauty_clinic_app/widgets/custom_button.dart';
import 'package:beauty_clinic_app/widgets/custom_textfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() =>
      _RegisterPageState();
}

class _RegisterPageState
    extends State<RegisterPage> {

  /// CONTROLLER
  final TextEditingController
      usernameController =
      TextEditingController();

  final TextEditingController
      emailController =
      TextEditingController();

  final TextEditingController
      passwordController =
      TextEditingController();

Future<void> register() async {

  /// AMBIL INPUT
  String username =
      usernameController.text.trim();

  String email =
      emailController.text
          .trim()
          .toLowerCase();

  String password =
      passwordController.text.trim();

  /// VALIDASI KOSONG
  if (username.isEmpty ||
      email.isEmpty ||
      password.isEmpty) {

    _showDialog(
      "Peringatan",
      "Semua data wajib diisi.",
    );

    return;
  }

  /// VALIDASI PASSWORD
  if (password.length < 8) {

    _showDialog(
      "Peringatan",
      "Password minimal harus 8 karakter.",
    );

    return;
  }

  /// AMBIL DATA STORAGE
  SharedPreferences prefs =
      await SharedPreferences
          .getInstance();

  /// AMBIL EMAIL YANG SUDAH TERSIMPAN
  String savedEmail =
      prefs.getString("email") ?? "";

  /// CEK EMAIL SUDAH DIGUNAKAN
  if (savedEmail
      .toLowerCase() ==
      email.toLowerCase()) {

    _showDialog(
      "Peringatan",
      "Akun gmail sudah digunakan.",
    );

    return;
  }

  /// SIMPAN DATA BARU
  await prefs.setString(
      "username", username);

  await prefs.setString(
      "email", email);

  await prefs.setString(
      "password", password);

  /// BERHASIL
  _showDialog(
    "Berhasil",
    "Registrasi berhasil.",
  );

  Future.delayed(
    const Duration(seconds: 1),
        () {

           Navigator.pop(context);

      Navigator.pop(context);
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

    return ValueListenableBuilder<String>(
  valueListenable: languageNotifier,

     builder: (
  context,
  String language,
  child,
)
          {

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

              /// OVERLAY
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
                      /// TITLE
Text(
  language == 'id'
    ? 'DAFTAR'
    : language == 'en'
        ? 'REGISTER'
        : '登録',

  textAlign: TextAlign.center,

  style: const TextStyle(
    fontSize: 42,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 2,
  ),
),

const SizedBox(height: 10),

Text(
  language == 'id'
    ? 'Buat Akun Anda'
    : language == 'en'
        ? 'Create Your Account'
        : 'アカウントを作成',

  textAlign: TextAlign.center,

  style: const TextStyle(
    fontSize: 25,
    color: Colors.white70,
    fontWeight: FontWeight.w400,
  ),
),

const SizedBox(height: 5),

Text(
  language == 'id'
      ? 'Silahkan daftar terlebih dahulu'
      : language == 'en'
          ? 'Register first to continue'
          : 'まず登録してください',

  textAlign: TextAlign.center,

  style: const TextStyle(
    fontSize: 20,
    color: Colors.white60,
  ),
),

const SizedBox(height: 50),

                      const SizedBox(
                        height: 50,
                      ),

                      /// USERNAME
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
                          controller:
                          usernameController,

                          hintText:
                          language == 'id'
    ? 'Masukkan Username'
    : language == 'en'
        ? 'Enter Username'
        : 'ユーザー名を入力',
                        ),
                      ),

                      const SizedBox(
                        height: 20,
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
                          controller:
                          emailController,

                          hintText:
    language == 'id'
        ? 'Masukkan Email'
        : language == 'en'
            ? 'Enter Email'
            : 'メールを入力',
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
                          controller:
                          passwordController,

                          hintText:
    language == 'id'
        ? 'Masukkan Password'
        : language == 'en'
            ? 'Enter Password'
            : 'パスワードを入力',

                          obscureText:
                          true,
                        ),
                      ),

                      const SizedBox(
                        height: 35,
                      ),

                      /// BUTTON
                      SizedBox(
                        width: 200,

                        child:
                        CustomButton(
                          text: language == 'id'
    ? 'DAFTAR'
    : language == 'en'
        ? 'REGISTER'
        : '登録',

                          onPressed:
                          register,
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      /// LOGIN
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment
                            .center,

                        children: [

                          Text(
                            language == 'id'
    ? 'Sudah memiliki akun?'
    : language == 'en'
        ? 'Already have an account?'
        : 'すでにアカウントをお持ちですか？',

                            style:
                            const TextStyle(
                              color: Colors
                                  .white,
                            ),
                          ),

                          TextButton(
                            onPressed:
                                () {

                              Navigator.pop(
                                  context);
                            },

                            child: Text(
                              language == 'id'
    ? 'Masuk'
    : language == 'en'
        ? 'Login'
        : 'ログイン',

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