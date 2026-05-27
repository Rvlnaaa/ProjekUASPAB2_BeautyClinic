import 'package:flutter/material.dart';

class NewsDetailPage extends StatelessWidget {
  final String title;
  final String description;

  const NewsDetailPage({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Container(
                height: 220,
                width: double.infinity,

                decoration: BoxDecoration(
                  color: Colors.amber.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),

                child: const Icon(Icons.article, size: 80, color: Colors.amber),
              ),

              const SizedBox(height: 25),

              Text(
                title,

                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Text(
                '$description\n\n'
                'Perawatan kulit wajah sangat penting untuk menjaga kesehatan dan kecantikan kulit. '
                'Dengan treatment yang tepat dan penggunaan skincare yang sesuai, kulit dapat menjadi lebih sehat, bersih, dan glowing.',

                style: TextStyle(
                  fontSize: 16,
                  height: 1.7,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
