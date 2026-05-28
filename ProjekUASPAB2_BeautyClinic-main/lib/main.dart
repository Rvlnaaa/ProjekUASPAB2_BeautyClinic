import 'package:flutter/material.dart';
import 'utils/app_theme.dart';
import 'screens/splash/splash_page.dart';

ValueNotifier<ThemeMode> themeNotifier =
    ValueNotifier(ThemeMode.light);

ValueNotifier<bool> isEnglishNotifier =
    ValueNotifier(false);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return ValueListenableBuilder(
      valueListenable: themeNotifier,

      builder: (
        context,
        ThemeMode currentMode,
        child,
      ) {

        return MaterialApp(
          debugShowCheckedModeBanner: false,

          theme: ThemeData.light(),

          darkTheme: ThemeData.dark(),

          themeMode: currentMode,

          home: const SplashPage(),
        );
      },
    );
  }
}