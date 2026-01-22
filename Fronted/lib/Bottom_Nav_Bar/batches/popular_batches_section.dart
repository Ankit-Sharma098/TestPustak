import 'package:flutter/material.dart';
import 'package:my_app/Bottom_Nav_Bar/batches/popular_batche_card.dart';
import 'dummy_batches.dart';

class PopularBatchesSection extends StatelessWidget {
  const PopularBatchesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: popularBatches.length,
        itemBuilder: (context, index) {
          return PopularBatchCard(batch: popularBatches[index]);
        },
      ),
    );
  }
}