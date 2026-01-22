import 'package:flutter/material.dart';

class AllExamSyllabusScreen extends StatelessWidget {
  const AllExamSyllabusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Exam Syllabus'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      // ✅ IMAGE FILLS BODY (BELOW APPBAR ONLY)
      body: SizedBox.expand(
        child: Image.asset(
          'assets/images/NoContent.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}