import 'package:flutter/material.dart';

/// ===============================
/// FORM FIELD TYPES
/// ===============================
enum AdminFieldType {
  text,
  number,
  multiline, file, date,
}

/// ===============================
/// FIELD CONFIG MODEL
/// ===============================
class AdminFieldConfig {
  final String label;
  final AdminFieldType type;
  final int maxLines;

  const AdminFieldConfig({
    required this.label,
    this.type = AdminFieldType.text,
    this.maxLines = 1,
  });
}

/// ===============================
/// MAIN FORM PAGE (USED BY ALL FORMS)
/// ===============================
class AdminFormPage extends StatelessWidget {
  final String title;
  final List<AdminFieldConfig> fields;
  final bool showFilePicker;
  final String submitText;

  const AdminFormPage({
    super.key,
    required this.title,
    required this.fields,
    this.showFilePicker = false,
    this.submitText = 'Submit',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (showFilePicker)
            FilePickerBox(
              label: 'Select File',
              onTap: () {
                // later: open file manager
              },
            ),

          for (final field in fields)
            AdminTextField(config: field),

          const SizedBox(height: 20),

          SubmitButton(
            text: submitText,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Form submitted')),
              );
            },
          ),
        ],
      ),
    );
  }
}

/// ===============================
/// TEXT FIELD WIDGET
/// ===============================
class AdminTextField extends StatelessWidget {
  final AdminFieldConfig config;

  const AdminTextField({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    TextInputType keyboardType;

    switch (config.type) {
      case AdminFieldType.number:
        keyboardType = TextInputType.number;
        break;
      default:
        keyboardType = TextInputType.text;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        keyboardType: keyboardType,
        maxLines:
        config.type == AdminFieldType.multiline ? config.maxLines : 1,
        decoration: InputDecoration(
          labelText: config.label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

/// ===============================
/// FILE PICKER UI (NO DEPENDENCY)
/// ===============================
class FilePickerBox extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const FilePickerBox({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.upload_file, size: 32),
              const SizedBox(height: 8),
              Text(label),
            ],
          ),
        ),
      ),
    );
  }
}

/// ===============================
/// SUBMIT BUTTON (FIXES ALL ERRORS)
/// ===============================
class SubmitButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SubmitButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
