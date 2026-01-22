import 'package:flutter/material.dart';
import 'group_voice_call_screen.dart';

class GroupCallHomeScreen extends StatelessWidget {
  const GroupCallHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Group Voice Call"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // ✅ Top Icon
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.indigo.shade50,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.groups_rounded,
                size: 60,
                color: Colors.indigo,
              ),
            ),

            const SizedBox(height: 18),

            // ✅ Heading
            const Text(
              "Join Group Voice Call 📞",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            // ✅ Description text
            const Text(
              "अब आप अपने Batch के साथ Group Voice Call में जुड़ सकते हैं।\n"
                  "Live discussion करें और doubts clear करें ✅",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),

            const SizedBox(height: 30),

            // ✅ Start Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const GroupVoiceCallScreen(
                        callId: "testpustak_room_01",
                        userId: "ankit01",
                        userName: "Ankit Sharma",
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.call),
                label: const Text(
                  "Start / Join Call",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 14),

            // ✅ Note box
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green.shade200),
              ),
              child: const Row(
                children: [
                  Icon(Icons.info_outline, color: Colors.green),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Same Room ID में जितने भी students join करेंगे, सब एक ही call में connect होंगे ✅",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
