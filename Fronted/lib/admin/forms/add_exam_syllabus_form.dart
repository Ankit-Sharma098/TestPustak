import 'package:flutter/material.dart';
import 'common_form_widgets.dart';

class AddExamSyllabusForm extends StatelessWidget {
  const AddExamSyllabusForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminFormPage(
      title: 'Add Exam Syllabus',
      fields: [
        AdminFieldConfig(label: 'Exam Name'),
        AdminFieldConfig(
          label: 'Subject-wise Description',
          type: AdminFieldType.multiline,
        ),
      ],
      submitText: 'Save Syllabus',
    );
  }
}
