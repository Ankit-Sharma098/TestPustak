import 'package:flutter/material.dart';

import 'Paid_Course.dart';

class CourseDemoScreen extends StatelessWidget {
  final String courseName;
  final String imagePath;
  final String discountPrice;
  final String originalPrice;
  final String offerText;

  const CourseDemoScreen({
    super.key,
    required this.courseName,
    required this.imagePath,
    required this.discountPrice,
    required this.originalPrice,
    required this.offerText,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Course Demo"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ Course Image
            Image.asset(
              imagePath,
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 220,
                  color: Colors.grey.shade300,
                  child: const Center(child: Icon(Icons.image_not_supported)),
                );
              },
            ),

            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ✅ Title
                  Text(
                    courseName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // ✅ Price Row
                  Row(
                    children: [
                      Text(
                        discountPrice,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        originalPrice,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        offerText,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // ✅ Demo Video Preview Box
                  Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.play_circle_fill,
                        size: 70,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "✅ Demo Lecture Preview",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "इस demo में आपको पता चलेगा कि हमारी teaching style कैसी है और कैसे हम आपको exam में selection तक ले जाते हैं।",
                    style: TextStyle(fontSize: 14, height: 1.4),
                  ),

                  const SizedBox(height: 18),

                  // ✅ Demo Topics
                  const Text(
                    "📌 Demo Topics Included",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 8),

                  _demoPoint("Best Strategy to Crack Exam in 30 Days"),
                  _demoPoint("Important Topics & Weightage समझो"),
                  _demoPoint("Daily Practice Plan + Mock Test Approach"),
                  _demoPoint("Short Tricks & Time Management"),
                  _demoPoint("Most Expected Questions (2026)"),

                  const SizedBox(height: 18),

                  // ✅ Student Reviews
                  const Text(
                    "⭐ Student Reviews",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 10),

                  _reviewCard("Rahul Kumar", "बहुत बढ़िया course है, concept clear हो गया ✅"),
                  _reviewCard("Priya Singh", "Mock tests और notes बहुत helpful लगे 🔥"),
                  _reviewCard("Aman Verma", "इस price में इतनी quality best है ⭐⭐⭐⭐⭐"),

                  const SizedBox(height: 18),

                  // ✅ Why buy section
                  const Text(
                    "🎯 Why You Should Join This Course?",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 10),

                  _demoPoint("Complete Syllabus + Smart Short Notes"),
                  _demoPoint("PDF + Practice Sets + Mock Tests"),
                  _demoPoint("Recorded + Live Support"),
                  _demoPoint("Daily Doubt Solving & Mentorship"),
                  _demoPoint("Selection-focused strategy"),

                  const SizedBox(height: 20),

                  // ✅ Hindi Motivation Line
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.orange.shade200),
                    ),
                    child: const Text(
                      "🔥 अगर आपको demo पसंद आया तो देर मत करो — अभी Buy Now करके अपनी तैयारी को next level पर ले जाओ!",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),

                  // ✅ Buy Now Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) {
                            return BuyNowBottomSheet(
                              courseName: courseName,
                              price: discountPrice,
                            );
                          },
                        );
                      },
                      child: const Text(
                        "Buy Now",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _demoPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, size: 18, color: Colors.green),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _reviewCard(String name, String review) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            review,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
