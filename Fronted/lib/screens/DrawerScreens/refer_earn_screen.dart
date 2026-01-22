import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReferAndEarnScreen extends StatelessWidget {
  const ReferAndEarnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const String referCode = "TESTPUSTAK50";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Refer & Earn"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ Top Banner Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.shade700,
                    Colors.blue.shade400,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(Icons.card_giftcard, color: Colors.white, size: 40),
                  SizedBox(height: 10),
                  Text(
                    "दोस्तों को Refer करो और Bonus पाओ 🎁",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "जब आपका दोस्त App install करके Paid Course खरीदता है,\nतो आपको Bonus मिलेगा ✅",
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // ✅ Steps Card
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "कैसे मिलेगा Bonus?",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12),

                    _StepRow(
                      icon: Icons.share,
                      title: "Step 1",
                      subtitle: "अपने दोस्तों को App का link शेयर करो",
                    ),
                    SizedBox(height: 10),
                    _StepRow(
                      icon: Icons.person_add_alt_1,
                      title: "Step 2",
                      subtitle: "दोस्त आपका Refer Code डालकर Sign up करे",
                    ),
                    SizedBox(height: 10),
                    _StepRow(
                      icon: Icons.workspace_premium,
                      title: "Step 3",
                      subtitle: "आपको Bonus / Reward automatically मिल जाएगा 🎉",
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 18),

            // ✅ Refer Code Box
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "आपका Refer Code",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade300),
                        color: Colors.grey.shade100,
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.confirmation_number_outlined),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              referCode,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.copy),
                            onPressed: () {
                              Clipboard.setData(const ClipboardData(text: referCode));
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("✅ Refer Code Copy हो गया!"),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),

                    // ✅ Bonus Text in Hindi
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.green.shade50,
                        border: Border.all(color: Colors.green.shade200),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.account_balance_wallet, color: Colors.green),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              "🎁 हर Successful Refer पर आपको Bonus मिलेगा\n(Rewards आपके Wallet में add होंगे ✅)",
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            // ✅ Bottom Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Share feature coming soon ✅"),
                        ),
                      );
                    },
                    icon: const Icon(Icons.share),
                    label: const Text("Share Now"),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                    label: const Text("Back"),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ✅ Step Row Widget
class _StepRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _StepRow({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 18,
          backgroundColor: Colors.blue.shade50,
          child: Icon(icon, color: Colors.blue),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
