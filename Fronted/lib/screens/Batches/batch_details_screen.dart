import 'package:flutter/material.dart';
import '../../model/batch_model.dart';
import 'batch_demo_screen.dart';

class BatchDetailScreen extends StatelessWidget {
  final Batch batch;
  const BatchDetailScreen({super.key, required this.batch});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final discountPercentage = ((batch.price - batch.discountedPrice) / batch.price * 100).round();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                batch.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                const Center(child: Icon(Icons.error, color: Colors.white)),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Text(batch.title, style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text('Created by ${batch.instructor}', style: theme.textTheme.titleMedium),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      '₹${batch.discountedPrice.toStringAsFixed(0)}',
                      style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      '₹${batch.price.toStringAsFixed(0)}',
                      style: theme.textTheme.titleMedium?.copyWith(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Chip(
                      label: Text('$discountPercentage% off', style: const TextStyle(fontWeight: FontWeight.bold)),
                      backgroundColor: Colors.green.withOpacity(0.15),
                      labelStyle: const TextStyle(color: Colors.green),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                ExpansionTile(
                  title: const Text('View Details', style: TextStyle(fontWeight: FontWeight.bold)),
                  childrenPadding: const EdgeInsets.all(16.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  children: [
                    Text(batch.description, style: theme.textTheme.bodyLarge?.copyWith(height: 1.5)),
                  ],
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BatchDemoScreen(batch: batch)));
                  },
                  icon: const Icon(Icons.play_circle_outline),
                  label: const Text('View Demo'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () => _showPaymentDialog(context),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          child: const Text('Buy Now'),
        ),
      ),
    );
  }

  void _showPaymentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Complete Your Purchase'),
          content: const Text('Our payment gateway is coming soon. Stay tuned!'),
          actions: [
            TextButton(
              child: const Text('Close'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}