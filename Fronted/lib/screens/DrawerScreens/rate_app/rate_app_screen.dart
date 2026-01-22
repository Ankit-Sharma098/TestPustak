import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RateAppScreen extends StatefulWidget {
  const RateAppScreen({super.key});

  @override
  State<RateAppScreen> createState() => _RateAppScreenState();
}

class _RateAppScreenState extends State<RateAppScreen> {
  int selectedStars = 0;

  // ✅ CHANGE THIS WITH YOUR REAL PACKAGE NAME
  final String packageName = "com.example.testpustak";

  Future<void> _openPlayStore() async {
    // ✅ Play Store link (works on all devices)
    final Uri url = Uri.parse(
      "https://play.google.com/store/apps/details?id=$packageName",
    );

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Could not open Play Store")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rate App")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade50,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Icon(Icons.star_rate_rounded,
                      size: 60, color: Colors.orange),
                  const SizedBox(height: 8),
                  const Text(
                    "Rate TestPustak",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "If you like our app, please rate us on Play Store 😊",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54),
                  ),
                  const SizedBox(height: 16),

                  // ⭐ Star select
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      final star = index + 1;
                      return IconButton(
                        onPressed: () {
                          setState(() => selectedStars = star);
                        },
                        icon: Icon(
                          selectedStars >= star
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.orange,
                          size: 34,
                        ),
                      );
                    }),
                  ),

                  Text(
                    selectedStars == 0
                        ? "Tap stars to select rating"
                        : "You selected $selectedStars Star ⭐",
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ✅ Button -> Play Store open
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.open_in_new),
                label: const Text("Rate on Play Store"),
                onPressed: _openPlayStore,
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Maybe Later"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
