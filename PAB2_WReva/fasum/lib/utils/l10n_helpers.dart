import 'package:fasum/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

List<String> localizedCategories(BuildContext context) {
  final l = AppLocalizations.of(context);
  return [
    l.categoryJalanRusak,
    l.categoryMarkaPudar,
    l.categoryLampuMati,
    l.categoryTrotoarRusak,
    l.categoryRambuRusak,
    l.categoryJembatanRusak,
    l.categorySampahMenumpuk,
    l.categorySaluranTersumbat,
    l.categorySungaiTercemar,
    l.categorySampahSungai,
    l.categoryPohonTumbang,
    l.categoryTamanRusak,
    l.categoryFasilitasRusak,
    l.categoryPipaBocor,
    l.categoryVandalisme,
    l.categoryBanjir,
    l.categoryLainnya,
  ];
}

String formatLocalizedTime(BuildContext context, DateTime dateTime) {
  final l = AppLocalizations.of(context);
  final now = DateTime.now();
  final diff = now.difference(dateTime);

  if (diff.inSeconds < 60) {
    return l.secondsAgo(diff.inSeconds);
  }
  if (diff.inMinutes < 60) {
    return l.minutesAgo(diff.inMinutes);
  }
  if (diff.inHours < 24) {
    return l.hoursAgo(diff.inHours);
  }
  if (diff.inHours < 48) {
    return l.oneDayAgo;
  }
  return DateFormat('dd/MM/yyyy').format(dateTime);
}

String authErrorMessage(BuildContext context, String code) {
  final l = AppLocalizations.of(context);
  switch (code) {
    case 'user-not-found':
      return l.noUserFound;
    case 'wrong-password':
      return l.wrongPassword;
    case 'weak-password':
      return l.weakPassword;
    case 'email-already-in-use':
      return l.emailAlreadyInUse;
    case 'invalid-email':
      return l.invalidEmail;
    default:
      return l.genericError;
  }
}
