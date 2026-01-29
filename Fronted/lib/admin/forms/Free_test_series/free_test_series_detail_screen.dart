import 'package:flutter/material.dart';

class FreeTestSeriesDetailScreen extends StatelessWidget {
  const FreeTestSeriesDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test Series Details')),
      body: const Center(
        child: Text('Tests will appear here'),
      ),
    );
  }
}
