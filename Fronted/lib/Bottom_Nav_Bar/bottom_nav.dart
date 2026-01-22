import 'package:flutter/material.dart';
import 'batches/batches_screen.dart';
import 'batches/popular_batches_screen.dart';
import 'featured_books.dart';
import 'livevideo.dart';
import 'chat.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedBottomIndex = 0;

  final List<Widget> _pages = const [
    Center(child: Text("Home Screen")),
    PopularBatchesScreen(), // ✅ yaha change
    FeaturedBooksScreen(),
    LiveVideoScreen(),
    ChatScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedBottomIndex],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedBottomIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _selectedBottomIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups_outlined),
            label: 'Batches',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            label: 'Books',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outline),
            label: 'Live',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_outlined),
            label: 'Chat',
          ),
        ],
      ),
    );
  }
}