import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

class AuthService {
  static UserModel? currentUser;

  /// REGISTER
  static Future<bool> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final prefs =
        await SharedPreferences.getInstance();

    final users =
        prefs.getStringList('users') ?? [];

    final existingUser = users.any((user) {
      final decoded = jsonDecode(user);

      return decoded['email'] == email;
    });

    if (existingUser) {
      return false;
    }

    final newUser = {
      'name': name,
      'email': email,
      'password': password,
    };

    users.add(jsonEncode(newUser));

    await prefs.setStringList('users', users);

    return true;
  }

  /// LOGIN
  static Future<bool> login({
    required String email,
    required String password,
  }) async {
    final prefs =
        await SharedPreferences.getInstance();

    final users =
        prefs.getStringList('users') ?? [];

    try {
      final user = users.firstWhere((user) {
        final decoded = jsonDecode(user);

        return decoded['email'] == email &&
            decoded['password'] == password;
      });

      final decoded = jsonDecode(user);

      currentUser = UserModel(
        name: decoded['name'],
        email: decoded['email'],
        password: decoded['password'],
      );

      await prefs.setBool('isLoggedIn', true);

      return true;
    } catch (e) {
      return false;
    }
  }

  /// LOGOUT
  static Future<void> logout() async {
    final prefs =
        await SharedPreferences.getInstance();

    await prefs.setBool('isLoggedIn', false);

    currentUser = null;
  }

  /// CHECK LOGIN
  static Future<bool> isLoggedIn() async {
    final prefs =
        await SharedPreferences.getInstance();

    return prefs.getBool('isLoggedIn') ?? false;
  }
}