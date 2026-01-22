import 'package:flutter/material.dart';

class FreePdfsScreen extends StatelessWidget {
  const FreePdfsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Free PDFs'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      // ✅ IMAGE FILLS BODY (BELOW APPBAR ONLY)
      body: SizedBox.expand(
        child: Image.asset(
          'assets/images/NoContent.png',
          fit: BoxFit.cover, // fills remaining screen area
        ),
      ),
    );
  }
}