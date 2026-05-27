import 'package:flutter/material.dart';
import '../treatment/treatment_detail_page.dart';
import 'search_page.dart';
import 'notification_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationPage(),
                ),
              );
            },

            icon: const Icon(Icons.notifications, color: Colors.black),
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                /// SEARCH BAR
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchPage(),
                      ),
                    );
                  },

                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),

                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15),
                    ),

                    child: const Row(
                      children: [
                        Icon(Icons.search, color: Colors.grey),

                        SizedBox(width: 10),

                        Text(
                          'Search',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                /// TITLE
                const Text(
                  'Beauty Clinic',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 20),

                /// PROMO CARD
                Container(
                  height: 150,
                  width: double.infinity,

                  decoration: BoxDecoration(
                    color: const Color(0xFFB89B3C),
                    borderRadius: BorderRadius.circular(25),
                  ),

                  child: const Center(
                    child: Text(
                      'Special Day Promo',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                /// CATEGORY TITLE
                const Text(
                  'Treatment Category',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 20),

                /// CATEGORY ROW
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TreatmentDetailPage(
                              title: 'Facial Treatment',
                              description:
                                  'Perawatan facial untuk membersihkan dan menyehatkan kulit wajah.',
                            ),
                          ),
                        );
                      },

                      child: categoryItem(Icons.face, 'Facial'),
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TreatmentDetailPage(
                              title: 'Therapy Treatment',
                              description:
                                  'Therapy treatment membantu relaksasi dan kesehatan kulit.',
                            ),
                          ),
                        );
                      },

                      child: categoryItem(Icons.spa, 'Therapy'),
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TreatmentDetailPage(
                              title: 'Glow Treatment',
                              description:
                                  'Glow treatment membantu wajah tampak lebih cerah dan glowing.',
                            ),
                          ),
                        );
                      },

                      child: categoryItem(Icons.auto_awesome, 'Glow'),
                    ),
                  ],
                ),

                const SizedBox(height: 35),

                /// POPULAR TITLE
                const Text(
                  'Popular Treatment',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 20),

                /// TREATMENT CARD
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TreatmentDetailPage(
                          title: 'Anti Facial Acne',
                          description:
                              'Treatment wajah terbaik untuk mengatasi jerawat dan menjaga kesehatan kulit.',
                        ),
                      ),
                    );
                  },

                  child: treatmentCard(
                    title: 'Anti Facial Acne',
                    subtitle: 'Treatment wajah terbaik untuk kulit sehat',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// CATEGORY ITEM
  Widget categoryItem(IconData icon, String title) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(18),

          decoration: const BoxDecoration(
            color: Color(0xFFF5F0E1),
            shape: BoxShape.circle,
          ),

          child: Icon(icon, color: const Color(0xFFB89B3C), size: 30),
        ),

        const SizedBox(height: 10),

        Text(title),
      ],
    );
  }

  /// TREATMENT CARD
  Widget treatmentCard({required String title, required String subtitle}) {
    return Container(
      padding: const EdgeInsets.all(15),

      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,

            decoration: BoxDecoration(
              color: const Color(0xFFF5F0E1),
              borderRadius: BorderRadius.circular(15),
            ),

            child: const Icon(Icons.image, color: Color(0xFFB89B3C)),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  title,

                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 5),

                Text(subtitle, style: TextStyle(color: Colors.grey.shade600)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
