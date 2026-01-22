import 'package:flutter/material.dart';
import '../../model/batch_model.dart';
import '../screens/Batches/batch_detail_screen.dart';

class BatchListScreen extends StatelessWidget {
  const BatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Popular Batches"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: sampleBatches.length,
        itemBuilder: (context, index) {
          final batch = sampleBatches[index];

          return Card(
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ✅ Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      batch.imageUrl,
                      height: 160,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 160,
                          color: Colors.grey.shade200,
                          child: const Center(
                            child: Icon(Icons.image_not_supported, size: 40),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 10),

                  // ✅ Title
                  Text(
                    batch.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  // ✅ Instructor
                  Text(
                    "Instructor: ${batch.instructor}",
                    style: const TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 8),

                  // ✅ Rating & Lessons
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

                  const SizedBox(height: 10),

                  // ✅ Price section
                  Row(
                    children: [
                      Text(
                        "₹${batch.discountedPrice.toStringAsFixed(0)}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(width: 10),
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

                  const SizedBox(height: 12),

                  // ✅ Buttons
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BatchDetailScreen(batch: batch),
                              ),
                            );
                          },
                          child: const Text("View Details"),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Buying: ${batch.title}"),
                              ),
                            );
                          },
                          child: const Text("Buy Now"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
