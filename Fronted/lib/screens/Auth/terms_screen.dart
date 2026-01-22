import 'package:flutter/material.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms & Conditions'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Text(
            '''
Welcome to Test Pustak.

1. User must provide correct information.
2. Account security is user responsibility.
3. Content is for educational purpose only.
4. Sharing account details is prohibited.
5. Company may update terms anytime.

By registering, you agree to all terms above.
            ''',
            style: const TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }
}
