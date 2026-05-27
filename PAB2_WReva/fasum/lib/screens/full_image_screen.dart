import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class FullscreenImageScreen extends StatelessWidget {
  final String imageBase64;

  const FullscreenImageScreen({
    super.key, 
    required this.imageBase64,
  });

  @override
  Widget build(BuildContext context) {
    Uint8List? bytes;
    try {
      bytes = imageBase64.isEmpty ? null : base64Decode(imageBase64);
    } catch (_) {
      bytes = null;
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child:
              bytes == null
                  ? const Icon(Icons.broken_image, color: Colors.white54, size: 64)
                  : InteractiveViewer(
                    child: Image.memory(
                      bytes,
                      fit: BoxFit.contain,
                    ),
                  ),
        ),
      ),
    );
  }
}