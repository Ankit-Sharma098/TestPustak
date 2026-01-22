import 'package:flutter/material.dart';
import 'ebook_model.dart';

class EbookDetailScreen extends StatelessWidget {
  final EbookModel ebook;

  const EbookDetailScreen({super.key, required this.ebook});

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
          "E-Book Details",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(
                  ebook.imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 180,
                  errorBuilder: (_, __, ___) => Container(
                    height: 180,
                    width: double.infinity,
                    color: const Color(0xffEEE6F7),
                    child: const Center(
                      child: Icon(Icons.image, size: 45, color: Colors.grey),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),

              Text(
                ebook.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                ebook.description,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff4A2DBA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Open PDF feature coming soon ✅"),
                      ),
                    );
                  },
                  icon: const Icon(Icons.picture_as_pdf, color: Colors.white),
                  label: const Text(
                    "Open PDF",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}