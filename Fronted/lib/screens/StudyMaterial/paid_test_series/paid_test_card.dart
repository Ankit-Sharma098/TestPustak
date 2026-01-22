import 'package:flutter/material.dart';
import 'paid_test_dummy_data.dart';

class PaidTestCard extends StatelessWidget {
  final PaidTestSeries test;
  final VoidCallback onPrimaryAction;
  final VoidCallback? onSecondaryAction;
  final String primaryText;
  final String? secondaryText;

  const PaidTestCard({
    super.key,
    required this.test,
    required this.onPrimaryAction,
    this.onSecondaryAction,
    required this.primaryText,
    this.secondaryText,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ IMAGE ADDED HERE (LEFT SIDE)
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                test.image,              // 🔥 IMAGE PATH FROM MODEL
                width: 100,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 60,
                    height: 60,
                    color: Colors.grey.shade300,
                    child: const Icon(Icons.image),
                  );
                },
              ),
            ),

            const SizedBox(width: 12),

            // ✅ RIGHT CONTENT (SAME AS TEST SERIES)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    test.title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    '₹${test.price}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1976D2),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 6,
                          ),
                        ),
                        onPressed: onPrimaryAction,
                        child: Text(primaryText),
                      ),

                      if (secondaryText != null) ...[
                        const SizedBox(width: 8),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                          ),
                          onPressed: onSecondaryAction,
                          child: Text(secondaryText!),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}