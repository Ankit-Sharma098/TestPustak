import 'package:flutter/material.dart';

class FreeTestsScreen extends StatelessWidget {
  const FreeTestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Free Tests'),
      ),
      body: const Center(
        child: Text('Free tests will be listed here soon!'),
      ),
    );
  }
}
