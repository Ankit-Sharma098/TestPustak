import 'package:flutter/material.dart';
import '../model/batch_model.dart';
import '../screens/Batches/batch_detail_screen.dart'; // FIXED: Corrected import path

class BatchCard extends StatelessWidget {
  final Batch batch;

  const BatchCard({super.key, required this.batch});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 4,
      child: InkWell(
        onTap: () {
          // FIXED: Navigate to the correct screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BatchDetailScreen(batch: batch),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 120,
              width: double.infinity,
              child: Image.asset(
                batch.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Center(child: Icon(Icons.image_not_supported, color: Colors.grey)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    batch.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'By ${batch.instructor}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                          const SizedBox(width: 4),
                          Text(batch.rating.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Text('${batch.lessonCount} Lessons', style: Theme.of(context).textTheme.bodySmall),
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
