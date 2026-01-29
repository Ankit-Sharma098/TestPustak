import 'package:flutter/material.dart';

class AddNotificationForm extends StatelessWidget {
  const AddNotificationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Notification'),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _Field(label: 'Notification Title'),
          _Field(label: 'Short Message', maxLines: 3),
          _Field(label: 'Optional Redirect Link'),
          SizedBox(height: 20),
          _SubmitButton(text: 'Send Notification'),
        ],
      ),
    );
  }
}

/* ------------------ COMMON WIDGETS ------------------ */

class _Field extends StatelessWidget {
  final String label;
  final int maxLines;

  const _Field({
    required this.label,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  final String text;

  const _SubmitButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // backend logic later
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Notification submitted')),
          );
        },
        child: Text(text),
      ),
    );
  }
}
