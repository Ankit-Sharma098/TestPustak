import 'package:flutter/material.dart';
import 'admin_section_grid.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false, // 🚫 removes hamburger

        title: Row(
          children: [
            Image.asset(
              'assets/images/testpustak.jpg',
              height: 26,
            ),
            const SizedBox(width: 8),
            const Text(
              'Admin',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),

        actions: [
          // 👥 USER COUNT
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Center(
              child: Text(
                'Users: 2,431',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),

          // 🔔 Notification
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),

      body: const SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: AdminSectionGrid(),
      ),
    );
  }
}
