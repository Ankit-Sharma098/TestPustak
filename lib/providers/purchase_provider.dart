import 'package:flutter/material.dart';

class PurchaseProvider extends ChangeNotifier {
  // A set to store the IDs of purchased batches.
  // Using a Set for efficient lookups.
  final Set<String> _purchasedBatchIds = {};

  Set<String> get purchasedBatchIds => _purchasedBatchIds;

  bool isPurchased(String batchId) {
    return _purchasedBatchIds.contains(batchId);
  }

  void addPurchase(String batchId) {
    _purchasedBatchIds.add(batchId);
    // Notify listeners so the UI can update (e.g., disable 'Buy Now' button).
    notifyListeners();
  }
}