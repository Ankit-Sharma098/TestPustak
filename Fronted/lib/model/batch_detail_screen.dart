import 'package:flutter/material.dart';
import '../../model/batch_model.dart';

class BatchDetailScreen extends StatelessWidget {
  final Batch batch;

  const BatchDetailScreen({super.key, required this.batch});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Batch Details"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                batch.imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 200,
                    color: Colors.grey.shade200,
                    child: const Center(
                      child: Icon(Icons.image_not_supported, size: 40),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 14),

            Text(
              batch.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              "Instructor: ${batch.instructor}",
              style: const TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                const Icon(Icons.star, color: Colors.orange, size: 18),
                const SizedBox(width: 4),
                Text("${batch.rating}"),
                const SizedBox(width: 14),
                const Icon(Icons.play_circle_outline, size: 18),
                const SizedBox(width: 4),
                Text("${batch.lessonCount} Lessons"),
              ],
            ),

            const SizedBox(height: 16),

            const Text(
              "About this Batch",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              batch.description,
              style: const TextStyle(fontSize: 14, height: 1.4),
            ),

            const SizedBox(height: 18),

            Row(
              children: [
                Text(
                  "₹${batch.discountedPrice.toStringAsFixed(0)}",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  "₹${batch.price.toStringAsFixed(0)}",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Proceed to payment: ${batch.title}"),
                    ),
                  );
                },
                child: const Text("Buy Now"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
