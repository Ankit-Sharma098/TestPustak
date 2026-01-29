import 'package:flutter/material.dart';
import 'common_form_widgets.dart';

class AddEbookForm extends StatelessWidget {
  const AddEbookForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminFormPage(
      title: 'Add E-Book',
      fields: [
        AdminFieldConfig(
          label: 'Book Title',
        ),
        AdminFieldConfig(
          label: 'Author Name',
        ),
        AdminFieldConfig(
          label: 'Upload Book PDF',
          type: AdminFieldType.file,
        ),
      ],
      submitText: 'Add E-Book',
    );
  }
}
