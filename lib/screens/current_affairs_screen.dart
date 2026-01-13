import 'package:flutter/material.dart';

class CurrentAffairsScreen extends StatelessWidget {
  const CurrentAffairsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Current Affairs'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.newspaper),
              title: Text('Affair ${index + 1}'),
              subtitle: const Text('Affair description'),
            ),
          );
        },
      ),
    );
  }
}