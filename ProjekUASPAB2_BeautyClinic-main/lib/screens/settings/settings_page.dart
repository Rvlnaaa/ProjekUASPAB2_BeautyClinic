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

  String selectedLanguage =
      'Indonesia';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEnglishNotifier.value
              ? 'Settings'
              : 'Pengaturan',
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
                isEnglishNotifier.value
                    ? 'Dark Mode'
                    : 'Mode Gelap',
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
                isEnglishNotifier.value
                    ? 'Language'
                    : 'Bahasa',
              ),

              subtitle:
                  Text(selectedLanguage),

              trailing: DropdownButton<String>(
                value: selectedLanguage,

                underline:
                    const SizedBox(),

                items: const [

                  DropdownMenuItem(
                    value: 'Indonesia',
                    child: Text(
                      'Indonesia',
                    ),
                  ),

                  DropdownMenuItem(
                    value: 'English',
                    child: Text(
                      'English',
                    ),
                  ),
                ],

                onChanged: (value) {

                  setState(() {
                    selectedLanguage =
                        value!;
                  });

                  isEnglishNotifier.value =
                      value == 'English';
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}