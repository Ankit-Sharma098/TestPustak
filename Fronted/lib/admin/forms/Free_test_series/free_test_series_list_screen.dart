import 'package:flutter/material.dart';

class FreeTestSeriesListScreen extends StatelessWidget {
  const FreeTestSeriesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Free Test Series')),
      body: const Center(
        child: Text('No test series added yet'),
      ),
    );
  }
}
