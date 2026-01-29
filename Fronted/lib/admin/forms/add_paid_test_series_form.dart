import 'package:flutter/material.dart';
import 'common_form_widgets.dart';

class AddPaidTestSeriesForm extends StatelessWidget {
  const AddPaidTestSeriesForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminFormPage(
      title: 'Add Paid Test Series',
      fields: [
        AdminFieldConfig(label: 'Test Series Name'),
        AdminFieldConfig(
          label: 'Cover Image',
          type: AdminFieldType.file,
        ),
        AdminFieldConfig(
          label: 'Price',
          type: AdminFieldType.number,
        ),
      ],
      submitText: 'Create Test Series',
    );
  }
}
