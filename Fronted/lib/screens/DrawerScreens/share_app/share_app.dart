import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareScreen extends StatelessWidget {
  const ShareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Share App")),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            Share.share(
              "📚 Download TestPustak App now!\n"
                  "✅ Free PDFs + Paid Courses + Test Series\n\n"
                  "🔗 Link: https://example.com",
            );
          },
          icon: const Icon(Icons.share),
          label: const Text("Share Now"),
        ),
      ),
    );
  }
}
