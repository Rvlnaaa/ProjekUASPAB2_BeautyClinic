import 'package:flutter/material.dart';

import 'news_detail_page.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Beauty News')),

      body: ListView(
        padding: const EdgeInsets.all(20),

        children: [
          newsCard(
            context,
            title: 'Tips Merawat Wajah',
            subtitle: 'Cara menjaga kulit tetap sehat dan glowing.',
          ),

          const SizedBox(height: 20),

          newsCard(
            context,
            title: 'Treatment Facial Modern',
            subtitle: 'Mengenal teknologi facial terbaru tahun ini.',
          ),

          const SizedBox(height: 20),

          newsCard(
            context,
            title: 'Skincare Untuk Kulit Sensitif',
            subtitle: 'Rekomendasi skincare aman untuk kulit sensitif.',
          ),
        ],
      ),
    );
  }

  Widget newsCard(
    BuildContext context, {
    required String title,
    required String subtitle,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                NewsDetailPage(title: title, description: subtitle),
          ),
        );
      },

      child: Container(
        padding: const EdgeInsets.all(15),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),

          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 10),
          ],
        ),

        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,

              decoration: BoxDecoration(
                color: Colors.amber.shade100,
                borderRadius: BorderRadius.circular(15),
              ),

              child: const Icon(Icons.article, size: 40, color: Colors.amber),
            ),

            const SizedBox(width: 15),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    title,

                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(subtitle, style: TextStyle(color: Colors.grey.shade600)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
