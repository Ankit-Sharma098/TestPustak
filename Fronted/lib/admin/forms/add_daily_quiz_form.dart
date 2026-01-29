import 'package:flutter/material.dart';
import 'common_form_widgets.dart';

class AddDailyQuizForm extends StatelessWidget {
  const AddDailyQuizForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminFormPage(
      title: 'Add Daily Quiz',
      fields: [
        AdminFieldConfig(label: 'Question'),
        AdminFieldConfig(label: 'Option A'),
        AdminFieldConfig(label: 'Option B'),
        AdminFieldConfig(label: 'Option C'),
        AdminFieldConfig(label: 'Option D'),
        AdminFieldConfig(label: 'Correct Answer'),
      ],
      submitText: 'Add Question',
    );
  }
}
