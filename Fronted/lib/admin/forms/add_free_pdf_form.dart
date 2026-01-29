import 'package:flutter/cupertino.dart';

import 'common_form_widgets.dart';

class AddFreePdfForm extends StatelessWidget {
  const AddFreePdfForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminFormPage(
      title: 'Add Free PDF',
      showFilePicker: true,
      fields: const [
        AdminFieldConfig(label: 'PDF Title'),
      ],
      submitText: 'Add PDF',
    );
  }
}
