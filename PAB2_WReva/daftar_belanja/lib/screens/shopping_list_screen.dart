import 'package:daftar_belanja/services/shopping_services.dart';
import 'package:daftar_belanja/services/shopping_services.dart';
import 'package:flutter/material.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({super.key});

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {

  final TextEditingController _controller = TextEditingController();
  final ShoppingService _shoppingService = ShoppingService();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Belanja"),
      ),
      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: "Nama Barang",
                border: OutlineInputBorder(),
              ),
            ),
          ),

          ElevatedButton(
            onPressed: () {
              String item = _controller.text;
              if (item.isNotEmpty) {
                _shoppingService.addItem(item);
                _controller.clear();
              }
            },
            child: const Text("Tambah"),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: StreamBuilder<Map<String,String>>(
              stream: _shoppingService.getShoppingList(),
              builder: (context, snapshot) {

                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final items = snapshot.data!;

                return ListView(
                  children: items.entries.map((entry) {
                    return ListTile(
                      title: Text(entry.value),
                    );
                  }).toList(),
                );
              },
            ),
          )

        ],
      ),
    );
  }
}