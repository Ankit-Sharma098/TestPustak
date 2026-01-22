import 'package:flutter/material.dart';

import 'Paid_Course.dart';
import 'course_demo_screen.dart';

class CourseDetailsScreen extends StatelessWidget {
  final String courseName;
  final String imagePath;
  final String discountPrice;
  final String originalPrice;
  final String offerText;

  const CourseDetailsScreen({
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
        title: Text(courseName),
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
                  width: double.infinity,
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

                  const SizedBox(height: 18),

                  // ✅ Headings + Details
                  const Text(
                    "📌 Course Overview",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "इस course में आपको Government Exam की complete तैयारी कराई जाएगी। इसमें वीडियो lectures, PDFs, mock tests और daily practice sessions शामिल होंगे।",
                    style: TextStyle(fontSize: 14, height: 1.4),
                  ),

                  const SizedBox(height: 16),

                  const Text(
                    "✅ What You Will Learn",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "• Complete syllabus coverage\n"
                        "• Topic-wise practice questions\n"
                        "• Full length mock tests\n"
                        "• Short tricks & important notes\n"
                        "• Daily doubt solving support",
                    style: TextStyle(fontSize: 14, height: 1.4),
                  ),

                  const SizedBox(height: 16),

                  const Text(
                    "🎯 Course Features",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "• Lifetime access\n"
                        "• Recorded + Live classes\n"
                        "• Weekly test series\n"
                        "• Detailed performance report\n"
                        "• PDF Notes & Short Notes",
                    style: TextStyle(fontSize: 14, height: 1.4),
                  ),

                  const SizedBox(height: 20),

                  // ✅ Hindi motivating line above buy now
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.green.shade200),
                    ),
                    child: const Text(
                      "🔥 अभी Buy Now पर क्लिक करके अपनी तैयारी शुरू कर दो — ये Offer limited time के लिए है!",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),

                  // ✅ Buttons Buy Now + View Demo
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
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
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CourseDemoScreen(
                                  courseName: courseName,
                                  imagePath: imagePath,
                                  discountPrice: discountPrice,
                                  originalPrice: originalPrice,
                                  offerText: offerText,
                                ),
                              ),
                            );
                          },

                          child: const Text("View Demo"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


