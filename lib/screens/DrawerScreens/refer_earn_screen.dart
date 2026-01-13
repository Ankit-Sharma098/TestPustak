import 'package:flutter/material.dart';

class ReferAndEarnScreen extends StatelessWidget {
  const ReferAndEarnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Refer & Earn'),
      ),
      body: const Center(
        child: Text('Refer your friends and earn rewards!'),
      ),
    );
  }
}
