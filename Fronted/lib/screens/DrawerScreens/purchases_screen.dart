import 'package:flutter/material.dart';
import '../../widgets/empty_state_widget.dart';

class PurchasesScreen extends StatefulWidget {
  const PurchasesScreen({super.key});

  @override
  State<PurchasesScreen> createState() => _PurchasesScreenState();
}

class _PurchasesScreenState extends State<PurchasesScreen> {
  bool _isLoading = true;
  bool _hasPurchases = false;

  @override
  void initState() {
    super.initState();
    // Simulate a network call
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
          // To test the empty state, we keep this false.
          // In a real app, you would update this based on the API response.
          _hasPurchases = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Purchases'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (!_hasPurchases) {
      return const EmptyStateWidget(
        icon: Icons.remove_shopping_cart_outlined, // FIXED: Replaced invalid icon
        message: 'You have not made any purchases yet.',
      );
    }

    // If there were purchases, you would build your list here
    return ListView.builder(
      itemCount: 0, // Replace with actual purchase list
      itemBuilder: (context, index) {
        return const ListTile();
      },
    );
  }
}
