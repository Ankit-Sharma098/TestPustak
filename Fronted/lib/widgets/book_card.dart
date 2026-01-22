import 'package:flutter/material.dart';
import '../model/book_model.dart';

class BookCard extends StatelessWidget {
  final BookModel book;

  const BookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // ✅ important
        children: [
          // ✅ Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              book.image,
              height: 140, // ✅ thoda kam
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 8),

          // ✅ Title
          Text(
            book.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),

          const SizedBox(height: 3),

          // ✅ Author
          Text(
            "By ${book.author}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.grey, fontSize: 11),
          ),

          const SizedBox(height: 5),

          // ✅ Rating + Price
          Row(
            children: [
              const Icon(Icons.star, size: 16, color: Colors.orange),
              const SizedBox(width: 4),
              Text("${book.rating}", style: const TextStyle(fontSize: 12)),
              const Spacer(),
              Text(
                "₹${book.price}",
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // ✅ Buttons (fix overflow)
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 34,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Buy", style: TextStyle(fontSize: 12)),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: SizedBox(
                  height: 34,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text("View", style: TextStyle(fontSize: 12)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
