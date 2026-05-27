import 'package:flutter/material.dart';

class TreatmentDetailPage extends StatelessWidget {
  final String title;
  final String description;

  const TreatmentDetailPage({
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
              // IMAGE / BANNER
              Container(
                height: 220,
                width: double.infinity,

                decoration: BoxDecoration(
                  color: Colors.amber.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),

                child: const Icon(Icons.spa, size: 80, color: Colors.white),
              ),

              const SizedBox(height: 25),

              // TITLE
              Text(
                title,

                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              // DESCRIPTION
              Text(
                description,

                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade700,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 25),

              const SizedBox(height: 30),

              // BENEFIT TITLE
              const Text(
                'Manfaat Treatment',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              benefitItem('Mengurangi jerawat dan bekas noda'),
              benefitItem('Membersihkan pori-pori wajah'),
              benefitItem('Membantu mencerahkan kulit'),
              benefitItem('Membuat kulit lebih sehat'),

              const SizedBox(height: 30),

              // LOCATION
              const Text(
                'Lokasi Clinic',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              Container(
                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.red, size: 35),

                    const SizedBox(width: 15),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: const [
                          Text(
                            'Beauty Link Clinic',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),

                          SizedBox(height: 5),

                          Text('Jl. Sudirman No. 12, Palembang'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // BUTTON MAPS
              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton.icon(
                  onPressed: () {},

                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),

                  icon: const Icon(Icons.map),

                  label: const Text(
                    'Buka Google Maps',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // BUTTON WHATSAPP
              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton.icon(
                  onPressed: () {},

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),

                  icon: const Icon(Icons.chat),

                  label: const Text(
                    'Hubungi Admin',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget benefitItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),

      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.green),

          const SizedBox(width: 10),

          Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}
