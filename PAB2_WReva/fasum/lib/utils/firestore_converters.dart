import 'package:cloud_firestore/cloud_firestore.dart';

/// Firestore may store [Timestamp], ISO [String], or legacy int millis.
DateTime createdAtFromFirestore(dynamic value) {
  if (value is Timestamp) return value.toDate();
  if (value is String && value.isNotEmpty) {
    return DateTime.tryParse(value) ?? DateTime.now();
  }
  if (value is int) return DateTime.fromMillisecondsSinceEpoch(value);
  return DateTime.now();
}

/// Avoid implicit `dynamic` → [String] casts ([Text], [base64Decode] require [String]).
String firestoreText(dynamic value, [String fallback = '']) {
  if (value == null) return fallback;
  if (value is String) return value;
  if (value is Timestamp) return fallback;
  if (value is num || value is bool) return value.toString();
  return fallback;
}

String? firestoreImageBase64(dynamic value) {
  if (value is String && value.isNotEmpty) return value;
  return null;
}

double firestoreDouble(dynamic value, [double fallback = 0]) {
  if (value is num) return value.toDouble();
  return fallback;
}
