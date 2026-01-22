import 'package:flutter/material.dart';
import 'free_test_dummy_data.dart';
import 'test_card.dart';

class TestListScreen extends StatelessWidget {
  final String testId;
  final String title;

  const TestListScreen({
    super.key,
    required this.testId,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final tests = testData[testId] ?? [];

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
        itemCount: tests.length,
        itemBuilder: (context, index) {
          return TestCard(
            test: tests[index],
            onAttempt: () {
              // NEXT: Question screen
            },
          );
        },
      ),
    );
  }
}