import 'package:fasum/helper/locale_provider.dart';
import 'package:fasum/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const List<Locale> languageLocales = [
    Locale('id'),
    Locale('en'),
    Locale('ar'),
    Locale('ko'),
    Locale('zh'),
  ];

  static String languageLabel(AppLocalizations loc, String languageCode) {
    switch (languageCode) {
      case 'en':
        return loc.english;
      case 'id':
        return loc.indonesian;
      case 'ar':
        return loc.arab;
      case 'ko':
        return loc.korea;
      case 'zh':
        return loc.mandarin;
      default:
        return loc.unknownLanguage;
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final provider = context.watch<LocaleProvider>();
    final selectedCode = provider.locale.languageCode;

    return Scaffold(
      appBar: AppBar(title: Text(loc.settings)),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              loc.language,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          ...languageLocales.map((locale) {
            final code = locale.languageCode;
            return RadioListTile<String>(
              title: Text(languageLabel(loc, code)),
              subtitle: Text(_nativeLanguageName(code)),
              value: code,
              groupValue: selectedCode,
              onChanged: (_) => provider.setLocale(locale),
            );
          }),
        ],
      ),
    );
  }

  /// Nama bahasa dalam bahasa aslinya (tetap terbaca di semua locale UI).
  static String _nativeLanguageName(String languageCode) {
    switch (languageCode) {
      case 'id':
        return 'Bahasa Indonesia';
      case 'en':
        return 'English';
      case 'ar':
        return 'العربية';
      case 'ko':
        return '한국어';
      case 'zh':
        return '中文';
      default:
        return languageCode;
    }
  }
}
