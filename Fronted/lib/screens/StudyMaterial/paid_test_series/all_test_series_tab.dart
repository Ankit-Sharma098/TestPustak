import 'package:flutter/material.dart';
import 'paid_test_dummy_data.dart';
import 'paid_test_card.dart';

class AllTestSeriesTab extends StatelessWidget {
  const AllTestSeriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: paidTestSeriesList.length,
      itemBuilder: (context, index) {
        final test = paidTestSeriesList[index];

        return PaidTestCard(
          test: test,
          primaryText: 'Buy Now',
          secondaryText: 'View Details',

          // ✅ BUY NOW → EarthKik-style bottom sheet
          onPrimaryAction: () {
            _showBuyNowSheet(context, test);
          },

          // ✅ VIEW DETAILS (later screen)
          onSecondaryAction: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Viewing details of ${test.title}')),
            );
          },
        );
      },
    );
  }

  // 🔥 EARTHKIK-STYLE BUY NOW BOTTOM SHEET
  void _showBuyNowSheet(BuildContext context, PaidTestSeries test) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔵 Drag handle
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),

              // 🧾 Title
              Text(
                test.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              // 💰 Price
              Text(
                '₹${test.price}',
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF1976D2),
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 16),

              // ✅ What user gets
              const Text(
                'What you get',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              _featureRow('Full-length mock tests'),
              _featureRow('Detailed solutions'),
              _featureRow('Performance analysis'),
              _featureRow('Validity as per exam'),

              const SizedBox(height: 20),

              // 🔘 Proceed to Pay
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1976D2),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    // PAYMENT GATEWAY WILL COME HERE
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Proceed to Pay',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // 🔹 Feature row helper
  Widget _featureRow(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 18),
          const SizedBox(width: 8),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}