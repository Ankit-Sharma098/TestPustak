import 'package:flutter/material.dart';
import 'free_test_dummy_data.dart';
import 'free_test_banner_card.dart';
import 'test_list_screen.dart';

class FreeTestSeriesScreen extends StatelessWidget {
  const FreeTestSeriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Free Test Series')),
      body: ListView.builder(
        itemCount: freeTestSeries.length,
        itemBuilder: (context, index) {
          final test = freeTestSeries[index];

          return FreeTestBannerCard(
            test: test,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TestListScreen(
                    testId: test.id,
                    title: test.title,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}