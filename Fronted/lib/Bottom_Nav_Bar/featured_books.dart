import 'package:flutter/material.dart';
import '../../model/book_model.dart';
import '../../widgets/book_card.dart';

class FeaturedBooksScreen extends StatelessWidget {
  const FeaturedBooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Featured Books'),
      ),
      body: Column(
        children: [
          // ✅ Banner UI
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.deepPurple.shade50,
            ),
            child: Row(
              children: [
                const Icon(Icons.menu_book, size: 40, color: Colors.deepPurple),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "Explore Featured Books\nfor your Exams 📚",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.deepPurple.shade700,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ✅ Books Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: sampleBooks.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.62,
              ),
              itemBuilder: (context, index) {
                return BookCard(book: sampleBooks[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
