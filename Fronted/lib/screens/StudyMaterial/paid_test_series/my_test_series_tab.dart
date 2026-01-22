import 'package:flutter/material.dart';
import 'paid_test_dummy_data.dart';
import 'paid_test_card.dart';

class MyTestSeriesTab extends StatelessWidget {
  const MyTestSeriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    final purchasedTests =
    paidTestSeriesList.where((e) => e.isPurchased).toList();

    if (purchasedTests.isEmpty) {
      return const Center(
        child: Text(
          'No Content Available',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      itemCount: purchasedTests.length,
      itemBuilder: (context, index) {
        final test = purchasedTests[index];

        return PaidTestCard(
          test: test,
          primaryText: 'Start',
          onPrimaryAction: () {
            // open test list
          },
        );
      },
    );
  }
}