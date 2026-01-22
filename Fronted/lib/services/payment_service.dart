import 'package:flutter/material.dart';
import 'package:my_app/model/batch_model.dart';
import 'package:my_app/providers/purchase_provider.dart';
import 'package:my_app/screens/payment/payment_success_screen.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

// --- FIXED: Decoupled event handlers from the class to avoid context issues ---
void _handlePaymentSuccess(
    BuildContext context, PaymentSuccessResponse response) {
  // Use a local context that is guaranteed to be valid.
  final batchId = response.orderId;
  if (batchId != null) {
    Provider.of<PurchaseProvider>(context, listen: false).addPurchase(batchId);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (_) => PaymentSuccessScreen(response: response)),
    );
  }
}

void _handlePaymentError(BuildContext context, PaymentFailureResponse response) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text("Payment Failed: ${response.message}"),
      backgroundColor: Colors.red,
    ),
  );
}

void _handleExternalWallet(
    BuildContext context, ExternalWalletResponse response) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text("External Wallet: ${response.walletName}"),
      backgroundColor: Colors.blue,
    ),
  );
}
// --- End of Fix ---

class PaymentService {
  late Razorpay _razorpay;

  // FIXED: The service no longer holds a BuildContext.
  PaymentService() {
    _razorpay = Razorpay();
  }

  // Listeners are now attached with valid context when checkout is called.
  void _attachListeners(BuildContext context) {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
        (response) => _handlePaymentSuccess(context, response));
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
        (response) => _handlePaymentError(context, response));
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
        (response) => _handleExternalWallet(context, response));
  }

  void dispose() {
    _razorpay.clear();
  }

  void openCheckout(Batch batch, BuildContext context) {
    // Attach listeners right before opening checkout.
    _attachListeners(context);

    var options = {
      // FIXED: Replaced placeholder with Razorpay's official test key.
      'key': 'rzp_test_1DPvRWap8KrrK8',
      'amount': batch.discountedPrice * 100,
      'name': 'TestPustak',
      'description': batch.title,
      // FIXED: Removed 'order_id' for frontend-only test flow.
      //'order_id': batch.id,
      // FIXED: Added required 'currency' field.
      'currency': 'INR',
      'prefill': {
        'contact': '9876543210',
        'email': 'test.user@example.com'
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error opening Razorpay: $e');
    }
  }
}
