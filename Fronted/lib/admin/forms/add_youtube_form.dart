import 'package:flutter/material.dart';
import 'common_form_widgets.dart';

class AddYoutubeForm extends StatelessWidget {
  const AddYoutubeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminFormPage(
      title: 'Add YouTube Video',
      fields: [
        AdminFieldConfig(label: 'Video Title'),
        AdminFieldConfig(label: 'YouTube URL'),
      ],
      submitText: 'Add Video',
    );
  }
}
