import 'package:flutter/material.dart';
import 'ebook_data.dart';
import 'ebook_detail_screen.dart';
import 'ebook_model.dart';

class EBooksScreen extends StatelessWidget {
  const EBooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F2FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "E-Books",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(14),
        itemCount: ebooksData.length,
        itemBuilder: (context, index) {
          final ebook = ebooksData[index];
          return _ebookCard(context, ebook);
        },
      ),
    );
  }

  Widget _ebookCard(BuildContext context, EbookModel ebook) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ✅ image from asset
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(14),
              topRight: Radius.circular(14),
            ),
            child: AspectRatio(
              aspectRatio: 16 / 7,
              child: Image.asset(
                ebook.imagePath,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: const Color(0xffEEE6F7),
                  child: const Center(
                    child: Icon(Icons.image, size: 44, color: Colors.grey),
                  ),
                ),
              ),
            ),
          ),

          // title
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 0),
            child: Text(
              ebook.title,
              style: const TextStyle(
                fontSize: 14.5,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const SizedBox(height: 12),

          // view button
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
            child: SizedBox(
              width: double.infinity,
              height: 44,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff4A2DBA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => EbookDetailScreen(ebook: ebook),
                    ),
                  );
                },
                child: const Text(
                  "View",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}