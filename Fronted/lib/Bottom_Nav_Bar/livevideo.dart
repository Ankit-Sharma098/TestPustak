import 'package:flutter/material.dart';

class LiveVideoScreen extends StatelessWidget {
  const LiveVideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Classes'),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          // 🔴 LIVE NOW
          const Text(
            'Live Now',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          _liveClassCard(
            title: 'UPSC Polity – Live Session',
            teacher: 'By Dr. Sharma',
            isLive: true,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Open Live Stream')),
              );
            },
          ),

          const SizedBox(height: 24),

          // 🟡 UPCOMING
          const Text(
            'Upcoming Live Classes',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          _liveClassCard(
            title: 'SSC Maths – Practice Session',
            teacher: 'By Amit Sir',
            isLive: false,
            onTap: () {},
          ),

          _liveClassCard(
            title: 'Current Affairs – Daily Analysis',
            teacher: 'By Renu Ma’am',
            isLive: false,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _liveClassCard({
    required String title,
    required String teacher,
    required bool isLive,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          Icons.play_circle_fill,
          color: isLive ? Colors.red : Colors.grey,
          size: 40,
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(teacher),
        trailing: isLive
            ? Container(
          padding:
          const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            'LIVE',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
            : const Icon(Icons.schedule),
      ),
    );
  }
}