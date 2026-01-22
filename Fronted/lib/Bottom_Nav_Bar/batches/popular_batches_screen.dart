import 'package:flutter/material.dart';
import 'dummy_batches.dart';
import 'batch_list_card.dart';

class PopularBatchesScreen extends StatelessWidget {
  const PopularBatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Popular Batches")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: popularBatches.length,
        itemBuilder: (context, index) {
          return BatchListCard(batch: popularBatches[index]);
        },
      ),
    );
  }
}