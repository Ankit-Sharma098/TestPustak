import 'package:flutter/material.dart';
import 'common_form_widgets.dart';

class AddPaidPdfForm extends StatelessWidget {
  const AddPaidPdfForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminFormPage(
      title: 'Add Paid PDF',
      fields: [
        AdminFieldConfig(label: 'PDF Title'),
        AdminFieldConfig(
          label: 'Price',
          type: AdminFieldType.number,
        ),
        AdminFieldConfig(
          label: 'PDF File',
          type: AdminFieldType.file,
        ),
      ],
      submitText: 'Upload PDF',
    );
  }
}
