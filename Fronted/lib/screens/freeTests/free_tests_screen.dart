import 'package:flutter/material.dart';
import '../../model/test_model.dart';
import '../../model/test_model.dart';
import '../FreeTests/test_detail_screen.dart'; // Path for the new detail screen

class FreeTestsScreen extends StatelessWidget {
  const FreeTestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Free_pdf.dart Test Series'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: dummyTests.length,
        itemBuilder: (context, index) {
          final test = dummyTests[index];
          return _buildTestCard(context, test);
        },
      ),
    );
  }

  // Reusable card widget for a test item.
  Widget _buildTestCard(BuildContext context, TestModel test) {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TestDetailScreen(test: test),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150,
              width: double.infinity,
              child: Image.asset(
                test.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Center(
                    child: Icon(Icons.image_not_supported,
                        color: Colors.grey, size: 50)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    test.title,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Chip(
                    label: Text(test.category),
                    backgroundColor:
                    Theme.of(context).primaryColor.withOpacity(0.1),
                    labelStyle:
                    TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}