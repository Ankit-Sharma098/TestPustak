import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentSuccessScreen extends StatelessWidget {
  final PaymentSuccessResponse response;
  const PaymentSuccessScreen({super.key, required this.response});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Successful'),
        automaticallyImplyLeading: false, // Prevents back button
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 100,
              ),
              const SizedBox(height: 24),
              const Text(
                'Course Purchased!',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Text(
                'Your payment was successful. You can now access your course.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
              ),
              const SizedBox(height: 12),
              Text(
                'Payment ID: ${response.paymentId}',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Pop until we get to the root (Home Screen)
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: const Text('Go to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
