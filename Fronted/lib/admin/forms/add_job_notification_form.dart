import 'package:flutter/material.dart';
import 'common_form_widgets.dart';

class AddJobNotificationForm extends StatelessWidget {
  const AddJobNotificationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminFormPage(
      title: 'Add Job Notification',

      // ❌ REMOVE const HERE
      fields: [
        AdminFieldConfig(label: 'Job Title'),
        AdminFieldConfig(label: 'Organization'),
        AdminFieldConfig(
          label: 'Eligibility',
          type: AdminFieldType.multiline,
        ),
        AdminFieldConfig(
          label: 'Last Date',
          type: AdminFieldType.date,
        ),
        AdminFieldConfig(
          label: 'Notification PDF',
          type: AdminFieldType.file,
        ),
      ],

      submitText: 'Add Job',
    );
  }
}
