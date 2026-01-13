import 'package:flutter/material.dart';
import '../DrawerScreens/downloads_screen.dart';
import '../DrawerScreens/purchases_screen.dart';
import '../DrawerScreens/refer_earn_screen.dart';
import '../DrawerScreens/profile_screen.dart';
import '../Auth/login_screen.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    // Using NavigationDrawer for a modern Material 3 look.
    return NavigationDrawer(
      onDestinationSelected: (index) {
        // Pop drawer first to avoid seeing it during the transition
        Navigator.pop(context);
        _handleNavigation(context, index);
      },
      children: [
        _buildDrawerHeader(context),
        const NavigationDrawerDestination(
          icon: Icon(Icons.home_outlined),
          label: Text('Home'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.person_outline),
          label: Text('Profile'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.download_for_offline_outlined),
          label: Text('Downloads'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.shopping_bag_outlined),
          label: Text('My Purchases'),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 28),
          child: Divider(),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.people_outline),
          label: Text('Refer & Earn'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.star_border_outlined),
          label: Text('Rate App'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.share_outlined),
          label: Text('Share App'),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 28),
          child: Divider(),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.logout),
          label: Text('Logout'),
        ),
      ],
    );
  }

  // A modern, simpler header for the NavigationDrawer.
  Widget _buildDrawerHeader(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(28, 20, 16, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 32,
            child: Text("JD", style: TextStyle(fontSize: 24)),
          ),
          SizedBox(height: 12),
          Text(
            "Ajay Singh",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            "bireenainfo@gmail.com",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  // Centralized navigation logic for the drawer.
  void _handleNavigation(BuildContext context, int index) {
    // This mapping corresponds to the order of NavigationDrawerDestination widgets.
    switch (index) {
      case 0: // Home
      // Home is the current screen, so do nothing.
        break;
      case 1: // Profile
        Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
        break;
      case 2: // Downloads
        Navigator.push(context, MaterialPageRoute(builder: (_) => const DownloadsScreen()));
        break;
      case 3: // Purchases
        Navigator.push(context, MaterialPageRoute(builder: (_) => const PurchasesScreen()));
        break;
      case 4: // Refer & Earn
        Navigator.push(context, MaterialPageRoute(builder: (_) => const ReferAndEarnScreen()));
        break;
      case 5: // Rate App
        _showDialog(context, 'Rate App', 'If you enjoy our app, please take a moment to rate it!');
        break;
      case 6: // Share App
        _showDialog(context, 'Share App', 'Share this app with your friends to help them prepare!');
        break;
      case 7: // Logout
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
              (Route<dynamic> route) => false,
        );
        break;
    }
  }

  void _showDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}
