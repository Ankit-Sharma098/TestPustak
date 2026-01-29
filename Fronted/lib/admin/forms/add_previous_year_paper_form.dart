import 'package:flutter/material.dart';
import 'common_form_widgets.dart';

class AddPreviousYearPaperForm extends StatelessWidget {
  const AddPreviousYearPaperForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminFormPage(
      title: 'Add Previous Year Paper',
      fields: [
        AdminFieldConfig(label: 'Exam Name'),
        AdminFieldConfig(label: 'Year'),
        AdminFieldConfig(
          label: 'Question Paper PDF',
          type: AdminFieldType.file,
        ),
      ],
      submitText: 'Upload Paper',
    );
  }
}
