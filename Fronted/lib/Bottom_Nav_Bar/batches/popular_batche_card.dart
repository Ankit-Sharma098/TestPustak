import 'package:flutter/material.dart';
import 'batch_model.dart';
import '../../screens/Batches/batch_detail_screen.dart';

class PopularBatchCard extends StatelessWidget {
  final BatchModel batch;

  const PopularBatchCard({super.key, required this.batch});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      margin: const EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              batch.image,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(batch.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text("By ${batch.teacher}",
                    style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 4),
                Text("${batch.lessons} Lessons • ⭐ ${batch.rating}"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}