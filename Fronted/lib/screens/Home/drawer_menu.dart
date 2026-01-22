import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../DrawerScreens/downloads_screen.dart';
import '../DrawerScreens/purchases_screen.dart';
import '../DrawerScreens/rate_app/rate_app_screen.dart';
import '../DrawerScreens/refer_earn_screen.dart';
import '../DrawerScreens/profile_screen.dart';
import '../Auth/login_screen.dart';
import '../DrawerScreens/share_app/share_app_screen.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  // ✅ WhatsApp open (Owner number)
  Future<void> _openWhatsApp() async {
    const String phoneNumber = "919304942225"; // ✅ your number
    const String message = "Hello! I need help."; // optional

    final Uri url = Uri.parse(
      "https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}",
    );

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw "Could not open WhatsApp";
    }
  }

  // ✅ Facebook open (Owner page/profile)
  Future<void> _openFacebook() async {
    const String fbPageUrl =
        "https://www.facebook.com/yourpage"; // ✅ your page link

    final Uri url = Uri.parse(fbPageUrl);

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw "Could not open Facebook";
    }
  }

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      onDestinationSelected: (index) {
        Navigator.pop(context);
        _handleNavigation(context, index);
      },
      children: [
        _buildDrawerHeader(),

        // ✅ MENU ITEMS
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

        // ✅ FOLLOW US SECTION
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 28),
          child: Divider(),
        ),
        const SizedBox(height: 12),
        const Center(
          child: Text(
            "Follow us",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 12),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: _openFacebook,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.08),
                  shape: BoxShape.circle,
                ),
                child: const FaIcon(
                  FontAwesomeIcons.facebookF,
                  color: Colors.blue,
                  size: 28,
                ),
              ),
            ),
            const SizedBox(width: 18),
            InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: _openWhatsApp,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.08),
                  shape: BoxShape.circle,
                ),
                child: const FaIcon(
                  FontAwesomeIcons.whatsapp,
                  color: Colors.green,
                  size: 30,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 22),
      ],
    );
  }

  // ✅ DRAWER HEADER
  Widget _buildDrawerHeader() {
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
            "Ankit Sharma",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            "Ankitshr@gmail.com",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  // ✅ DRAWER NAVIGATION LOGIC
  void _handleNavigation(BuildContext context, int index) {
    switch (index) {
      case 0: // Home
        break;

      case 1: // Profile
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ProfileScreen()),
        );
        break;

      case 2: // Downloads
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const DownloadsScreen()),
        );
        break;

      case 3: // Purchases
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const PurchasesScreen()),
        );
        break;

      case 4: // Refer & Earn
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ReferAndEarnScreen()),
        );
        break;

      case 5: // Rate App
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const RateAppScreen()),
        );
        break;

      case 6: // Share App
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ShareAppScreen()),
        );
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