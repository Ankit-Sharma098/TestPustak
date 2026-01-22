import 'package:flutter/material.dart';
import 'package:my_app/screens/DrawerScreens/share_app/share_app.dart';

class ShareAppScreen extends StatelessWidget {
  const ShareAppScreen({super.key});

  get ShareAppHelper => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Share App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "TestPustak App Share करें ✅",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "दोस्तों को App शेयर करो ताकि वो भी Course, PDFs और Test Series का फायदा उठा सकें।",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  ShareAppHelper.shareApp(context);
                },
                icon: const Icon(Icons.share),
                label: const Text("Share Now"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
