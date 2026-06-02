import 'package:flutter/material.dart';
import '../../main.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() =>
      _SettingsPageState();
}

class _SettingsPageState
    extends State<SettingsPage> {

  bool isDarkMode = false;

  String selectedLanguage = 'id';

  @override
  Widget build(BuildContext context) {

    return ValueListenableBuilder<String>(
      valueListenable: languageNotifier,

      builder: (
        context,
        String language,
        child,
      ) {

        return Scaffold(
          appBar: AppBar(
            title: Text(
              language == 'id'
                  ? 'Pengaturan'
                  : language == 'en'
                      ? 'Settings'
                      : '設定',
            ),
          ),

          body: ListView(
            padding: const EdgeInsets.all(20),

            children: [

              Container(
                padding: const EdgeInsets.all(15),

                margin: const EdgeInsets.only(
                  bottom: 20,
                ),

                decoration: BoxDecoration(
                  color:
                      Theme.of(context).cardColor,

                  borderRadius:
                      BorderRadius.circular(20),
                ),

                child: SwitchListTile(
                  value: isDarkMode,

                  onChanged: (value) {

                    setState(() {
                      isDarkMode = value;
                    });

                    themeNotifier.value =
                        value
                            ? ThemeMode.dark
                            : ThemeMode.light;
                  },

                  secondary:
                      const Icon(Icons.dark_mode),

                  title: Text(
                    language == 'id'
                        ? 'Mode Gelap'
                        : language == 'en'
                            ? 'Dark Mode'
                            : 'ダークモード',
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.all(15),

                decoration: BoxDecoration(
                  color:
                      Theme.of(context).cardColor,

                  borderRadius:
                      BorderRadius.circular(20),
                ),

                child: ListTile(
                  leading:
                      const Icon(Icons.language),

                  title: Text(
                    language == 'id'
                        ? 'Bahasa'
                        : language == 'en'
                            ? 'Language'
                            : '言語',
                  ),

                  subtitle: Text(
                    selectedLanguage == 'id'
                        ? 'Indonesia'
                        : selectedLanguage == 'en'
                            ? 'English'
                            : '日本語',
                  ),

                  trailing:
                      DropdownButton<String>(
                    value: selectedLanguage,

                    underline:
                        const SizedBox(),

                    items: const [

                      DropdownMenuItem(
                        value: 'id',
                        child: Text(
                          'Indonesia',
                        ),
                      ),

                      DropdownMenuItem(
                        value: 'en',
                        child: Text(
                          'English',
                        ),
                      ),

                      DropdownMenuItem(
                        value: 'jp',
                        child: Text(
                          '日本語',
                        ),
                      ),
                    ],

                    onChanged: (value) {

                      setState(() {
                        selectedLanguage =
                            value!;
                      });

                      languageNotifier.value =
                          value!;
                    },
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