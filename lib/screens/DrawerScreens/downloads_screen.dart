import 'package:flutter/material.dart';
import '../../widgets/empty_state_widget.dart';

class DownloadsScreen extends StatefulWidget {
  const DownloadsScreen({super.key});

  @override
  State<DownloadsScreen> createState() => _DownloadsScreenState();
}

class _DownloadsScreenState extends State<DownloadsScreen> {
  bool _isLoading = true;
  bool _hasDownloads = false;

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
          _hasDownloads = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Downloads'),
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

    if (!_hasDownloads) {
      return const EmptyStateWidget(
        icon: Icons.cloud_off,
        message: 'You have no downloaded content yet.',
      );
    }

    // If there were downloads, you would build your list here, for example:
    return ListView.builder(
      itemCount: 0, // Replace with actual download list
      itemBuilder: (context, index) {
        return const ListTile();
      },
    );
  }
}
