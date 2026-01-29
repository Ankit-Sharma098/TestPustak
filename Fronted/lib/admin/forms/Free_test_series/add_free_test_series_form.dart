import 'package:flutter/material.dart';
import '../common_form_widgets.dart';

class AddFreeTestSeriesForm extends StatelessWidget {
  const AddFreeTestSeriesForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminFormPage(
      title: 'Add Free Test Series',
      fields: [
        AdminFieldConfig(
          label: 'Test Series Name',
        ),
        AdminFieldConfig(
          label: 'Upload Cover Image',
          type: AdminFieldType.file,
        ),
        AdminFieldConfig(
          label: 'Description',
          type: AdminFieldType.multiline,
        ),
      ],
      submitText: 'Create Test Series',
    );
  }
}
