import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchController = TextEditingController();

  final List<Map<String, String>> treatments = [
    {'title': 'Anti Facial Acne', 'subtitle': 'Treatment kulit berjerawat'},
    {'title': 'Skin Brightening', 'subtitle': 'Mencerahkan kulit wajah'},
    {'title': 'Glow Facial', 'subtitle': 'Membuat wajah glowing'},
    {'title': 'Facial Therapy', 'subtitle': 'Relaksasi dan perawatan'},
    {'title': 'Laser Treatment', 'subtitle': 'Perawatan teknologi laser'},
  ];

  List<Map<String, String>> filteredTreatments = [];

  @override
  void initState() {
    super.initState();
    filteredTreatments = treatments;
  }

  void searchTreatment(String query) {
    final List<Map<String, String>> results = treatments.where((treatment) {
      final title = treatment['title']!.toLowerCase();

      return title.contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredTreatments = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Treatment')),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            TextField(
              controller: searchController,
              onChanged: searchTreatment,

              decoration: InputDecoration(
                hintText: 'Cari treatment...',
                prefixIcon: const Icon(Icons.search),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: filteredTreatments.length,
                itemBuilder: (context, index) {
                  final treatment = filteredTreatments[index];

                  return treatmentCard(
                    title: treatment['title']!,
                    subtitle: treatment['subtitle']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget treatmentCard({required String title, required String subtitle}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),

        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.08), blurRadius: 10),
        ],
      ),

      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,

            decoration: BoxDecoration(
              color: Colors.amber.shade100,
              borderRadius: BorderRadius.circular(15),
            ),

            child: const Icon(Icons.spa, color: Colors.amber),
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

                Text(subtitle, style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
