import 'package:flutter/material.dart';
import '../../model/batch_model.dart';

class BatchDemoScreen extends StatelessWidget {
  final Batch batch;
  const BatchDemoScreen({super.key, required this.batch});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo: ${batch.title}'),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: 220,
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade800),
          ),
          child: const Center(
            child: Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 60,
            ),
          ),
        ),
      ),
    );
  }
}