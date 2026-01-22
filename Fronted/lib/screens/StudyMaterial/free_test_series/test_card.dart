import 'package:flutter/material.dart';
import 'test_model.dart';

class TestCard extends StatelessWidget {
  final TestModel test;
  final VoidCallback onAttempt;

  const TestCard({
    super.key,
    required this.test,
    required this.onAttempt,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Test title
            Text(
              test.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // 🔹 Info row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _info(Icons.timer, '${test.duration}', 'Minutes'),
                _info(Icons.list, '${test.questions}', 'Questions'),
                _info(Icons.star, '${test.marks}', 'Marks'),

              ],
            ),

            const SizedBox(height: 14),

            // 🔹 Attempt button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1976D2),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: onAttempt,
              child: const Text(
                'Attempt',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Icon with light blue background (exact screenshot style)
  Widget _info(IconData icon, String value, String label) {
    return Row(
      children: [
        // 🔵 Icon with light blue background
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: const Color(0xFF2196F3).withOpacity(0.12),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 18,
            color: const Color(0xFF2196F3),
          ),
        ),

        const SizedBox(width: 8),

        // 🔢 Number + label (RIGHT SIDE of icon)
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Number (dark)
            Text(
              value,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),

            // Label (light black)
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ],
    );
  }
}