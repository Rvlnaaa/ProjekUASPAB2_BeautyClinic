import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Treatment'),
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),

        children: [

          favoriteCard(
            title: 'Anti Facial Acne',
            subtitle:
                'Treatment untuk kulit berjerawat',
          ),

          favoriteCard(
            title: 'Skin Brightening',
            subtitle:
                'Mencerahkan kulit wajah kusam',
          ),

          favoriteCard(
            title: 'Glow Facial',
            subtitle:
                'Membuat wajah glowing alami',
          ),
        ],
      ),
    );
  }

  Widget favoriteCard({
    required String title,
    required String subtitle,
  }) {

    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),

        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 10,
          ),
        ],
      ),

      child: Row(
        children: [

          Container(
            width: 65,
            height: 65,

            decoration: BoxDecoration(
              color: Colors.amber.shade100,
              borderRadius:
                  BorderRadius.circular(18),
            ),

            child: const Icon(
              Icons.favorite,
              color: Colors.red,
              size: 32,
            ),
          ),

          const SizedBox(width: 18),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                Text(
                  title,

                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  subtitle,

                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}