import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),

      body: ListView(
        padding: const EdgeInsets.all(20),

        children: [
          notificationCard(
            icon: Icons.local_offer,
            title: 'Special Promo',
            subtitle: 'Diskon treatment hingga 50% minggu ini',
            color: Colors.orange,
          ),

          notificationCard(
            icon: Icons.access_time,
            title: 'Reminder Treatment',
            subtitle: 'Jangan lupa jadwal facial besok pukul 10:00',
            color: Colors.blue,
          ),

          notificationCard(
            icon: Icons.newspaper,
            title: 'Beauty Tips',
            subtitle: 'Gunakan sunscreen setiap pagi',
            color: Colors.green,
          ),

          notificationCard(
            icon: Icons.location_on,
            title: 'Clinic Information',
            subtitle: 'Beauty Link buka hingga jam 21:00 malam',
            color: Colors.red,
          ),
        ],
      ),
    );
  }

  Widget notificationCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {
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
            padding: const EdgeInsets.all(12),

            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(15),
            ),

            child: Icon(icon, color: color),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  title,

                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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
