import 'package:flutter/material.dart';
import 'package:my_app/admin/section/section_constants.dart';
import 'admin_section_router.dart';

class AdminSectionScreen extends StatelessWidget {
  final AdminSectionConfig section;

  const AdminSectionScreen({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(section.title),
      ),

      // EMPTY STATE
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.inbox, size: 64, color: Colors.grey),
            SizedBox(height: 12),
            Text(
              'No content added yet',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),

      // ➕ ADD BUTTON
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AdminSectionRouter.openAddForm(
            context,
            section.sectionKey,
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
