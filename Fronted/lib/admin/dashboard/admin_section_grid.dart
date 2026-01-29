import 'package:flutter/material.dart';
import '../section/admin_section_card.dart';
import '../section/admin_section_screen.dart';
import '../section/section_constants.dart';


class AdminSectionGrid extends StatelessWidget {
  const AdminSectionGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true, // 🔥 REQUIRED
      physics: const NeverScrollableScrollPhysics(),
      itemCount: adminSections.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.95,
      ),
      itemBuilder: (context, index) {
        final section = adminSections[index];

        return AdminSectionCard(
          section: section,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => AdminSectionScreen(section: section),
              ),
            );
          },
        );
      },
    );
  }
}
