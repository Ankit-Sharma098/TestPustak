import 'package:flutter/material.dart';
import '../../model/test_model.dart';

class TestDetailScreen extends StatelessWidget {
  final TestModel test;

  const TestDetailScreen({super.key, required this.test});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(test.title)),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Details section
            _buildInfoRow(context, Icons.timer_outlined, 'Duration', '${test.durationInMinutes} mins'),
            const SizedBox(height: 16),
            _buildInfoRow(context, Icons.help_outline, 'Questions', '${test.questionCount} Questions'),
            const Spacer(),
            // Start button
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Coming Soon!'),
                    content: const Text('The test engine is under development.'),
                    actions: [TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('OK'))],
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Start Test', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Theme.of(context).primaryColor, size: 28),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 2),
            Text(value, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}