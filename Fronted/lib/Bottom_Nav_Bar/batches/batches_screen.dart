import 'package:flutter/material.dart';
import 'batches_banner.dart';
import 'popular_batches_section.dart';
import 'popular_batches_screen.dart';
import 'dummy_batches.dart';
import 'batch_list_card.dart';

class BatchesScreen extends StatelessWidget {
  const BatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Batches")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BatchesBanner(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Popular Batches",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const PopularBatchesScreen(),
                        ),
                      );
                    },
                    child: const Text("View All"),
                  ),
                ],
              ),
            ),

            const PopularBatchesSection(),

            const Padding(
              padding: EdgeInsets.all(16),
              child: Text("All Batches",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: allBatches.length,
              itemBuilder: (context, index) {
                return BatchListCard(batch: allBatches[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}