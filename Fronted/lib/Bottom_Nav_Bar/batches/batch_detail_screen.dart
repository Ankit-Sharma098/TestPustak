import 'package:flutter/material.dart';
import 'batch_model.dart';



class BatchDetailScreen extends StatelessWidget {
  final BatchModel batch;

  const BatchDetailScreen({super.key, required this.batch});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(batch.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                batch.image,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              batch.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text("By ${batch.teacher}",
                style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.orange),
                const SizedBox(width: 4),
                Text("${batch.rating} Rating"),
                const SizedBox(width: 16),
                Text("${batch.lessons} Lessons"),
              ],
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
              ),
              onPressed: () {},
              child: const Text("Enroll Now"),
            ),
          ],
        ),
      ),
    );
  }
}