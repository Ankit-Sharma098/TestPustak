import 'package:flutter/material.dart';

import 'common_form_widgets.dart';

class AddDailyCurrentAffairsForm extends StatelessWidget {
  const AddDailyCurrentAffairsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminFormPage(
      title: 'Add Daily Current Affairs',

      // ❌ REMOVE const HERE
      fields: [
        AdminFieldConfig(
          label: 'Title',
        ),
        AdminFieldConfig(
          label: 'Content',
          type: AdminFieldType.multiline,
        ),
        AdminFieldConfig(
          label: 'Image',
          type: AdminFieldType.file,
        ),
      ],

      submitText: 'Publish',
    );
  }
}
