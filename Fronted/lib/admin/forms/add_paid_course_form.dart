import 'package:flutter/material.dart';
import 'common_form_widgets.dart';

class AddPaidCourseForm extends StatelessWidget {
  const AddPaidCourseForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminFormPage(
      title: 'Add Paid Course',
      fields: [
        AdminFieldConfig(
          label: 'Course Image',
          type: AdminFieldType.file,
        ),
        AdminFieldConfig(label: 'Course Title'),
        AdminFieldConfig(
          label: 'Description (100–500 words)',
          type: AdminFieldType.multiline,
        ),
        AdminFieldConfig(
          label: 'Full Price',
          type: AdminFieldType.number,
        ),
        AdminFieldConfig(
          label: 'Discounted Price',
          type: AdminFieldType.number,
        ),
      ],
      submitText: 'Add Course',
    );
  }
}
