import 'package:flutter/material.dart';
import 'all_test_series_tab.dart';
import 'my_test_series_tab.dart';

class PaidTestSeriesScreen extends StatelessWidget {
  const PaidTestSeriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Paid Test Series'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'All Test Series'),
              Tab(text: 'My Test Series'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AllTestSeriesTab(),
            MyTestSeriesTab(),
          ],
        ),
      ),
    );
  }
}