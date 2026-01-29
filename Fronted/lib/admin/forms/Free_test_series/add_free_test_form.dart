import 'package:flutter/material.dart';
import '../common_form_widgets.dart';

class AddFreeTestForm extends StatelessWidget {
  const AddFreeTestForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminFormPage(
      title: 'Add Test',
      fields: const [
        AdminFieldConfig(
          label: 'Test Title',
        ),
        AdminFieldConfig(
          label: 'Total Questions',
          type: AdminFieldType.number,
        ),
        AdminFieldConfig(
          label: 'Total Marks',
          type: AdminFieldType.number,
        ),
      ],
      submitText: 'Add Test',
    );
  }
}
