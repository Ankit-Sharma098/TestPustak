import 'package:flutter/material.dart';
import 'package:my_app/model/batch_model.dart';
import 'package:my_app/providers/purchase_provider.dart';
import 'package:my_app/services/payment_service.dart';
import 'package:provider/provider.dart';
import 'batch_demo_screen.dart';

class BatchDetailScreen extends StatefulWidget {
  final Batch batch;
  const BatchDetailScreen({super.key, required this.batch});

  @override
  State<BatchDetailScreen> createState() => _BatchDetailScreenState();
}

class _BatchDetailScreenState extends State<BatchDetailScreen> {
  // FIXED: Service is now initialized without context.
  late final PaymentService _paymentService;

  @override
  void initState() {
    super.initState();
    _paymentService = PaymentService();
  }

  @override
  void dispose() {
    _paymentService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final discountPercentage = ((widget.batch.price - widget.batch.discountedPrice) /
            widget.batch.price *
            100)
        .round();

    final isPurchased =
        context.watch<PurchaseProvider>().isPurchased(widget.batch.id);

    return Scaffold(
      appBar: AppBar(title: Text(widget.batch.title)),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(widget.batch.title,
                      style: theme.textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text('Created by ${widget.batch.instructor}',
                      style: theme.textTheme.titleMedium),
                  // ... (rest of your details UI)
                ],
              ),
            ),
          ),
          // --- Bottom 'Buy Now' Button ---
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              // FIXED: Pass the context when calling openCheckout.
              onPressed: isPurchased
                  ? null
                  : () => _paymentService.openCheckout(widget.batch, context),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold),
                backgroundColor:
                    isPurchased ? Colors.grey : theme.primaryColor,
              ),
              child: Text(isPurchased ? 'Already Purchased' : 'Buy Now'),
            ),
          ),
        ],
      ),
    );
  }
}

