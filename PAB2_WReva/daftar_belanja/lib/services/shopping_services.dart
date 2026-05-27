import 'package:firebase_database/firebase_database.dart';

class ShoppingService {

  final DatabaseReference _database =
      FirebaseDatabase.instance.ref().child('shopping_list');


  Stream<Map<String, String>> getShoppingList() {
    return _database.onValue.map((event) {
      final Map<String, String> items = {};

      DataSnapshot snapshot = event.snapshot;

      if (snapshot.value != null) {
        Map<dynamic, dynamic> value =
            snapshot.value as Map<dynamic, dynamic>;

        value.forEach((key, value) {
          items[key] = value['nama'] as String;
        });
      }

      return items;
    });
  }


  Future<void> addItem(String nama) async {
    await _database.push().set({
      "nama": nama,
    });
  }

}