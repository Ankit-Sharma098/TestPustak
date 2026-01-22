import 'package:flutter/material.dart';
import 'course_details_screen.dart';
import 'course_demo_screen.dart';


class PaidCoursesScreen extends StatelessWidget {
  const PaidCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> courses = [
      {
        "name": "SSC GD Complete Course",
        "image": "assets/images/gv_exam.jpg",
        "discountPrice": "₹299",
        "originalPrice": "₹4999",
        "off": "94% OFF",
      },
      {
        "name": "UPSC Foundation Batch",
        "image": "assets/images/gv_exam.jpg",
        "discountPrice": "₹499",
        "originalPrice": "₹8999",
        "off": "94% OFF",
      },
      {
        "name": "Banking Complete तैयारी",
        "image": "assets/images/gv_exam.jpg",
        "discountPrice": "₹399",
        "originalPrice": "₹6999",
        "off": "94% OFF",
      },
      {
        "name": "Railway Group D Course",
        "image": "assets/images/gv_exam.jpg",
        "discountPrice": "₹199",
        "originalPrice": "₹3999",
        "off": "94% OFF",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Paid Courses"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(14),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return _CourseCard(
            courseName: course["name"],
            imagePath: course["image"],
            discountedPrice: course["discountPrice"],
            originalPrice: course["originalPrice"],
            offerText: course["off"],
          );
        },
      ),
    );
  }
}

class _CourseCard extends StatelessWidget {
  final String courseName;
  final String imagePath;
  final String discountedPrice;
  final String originalPrice;
  final String offerText;

  const _CourseCard({
    required this.courseName,
    required this.imagePath,
    required this.discountedPrice,
    required this.originalPrice,
    required this.offerText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ✅ Image
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(14),
              topRight: Radius.circular(14),
            ),
            child: Image.asset(
              imagePath,
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 160,
                  width: double.infinity,
                  color: Colors.grey.shade300,
                  child: const Center(child: Icon(Icons.image_not_supported)),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ✅ Course Name
                Text(
                  courseName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 10), // ✅ 40 की जगह 10

                // ✅ Price row
                Row(
                  children: [
                    Text(
                      discountedPrice,
                      style: const TextStyle(
                        fontSize: 16,
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

                const SizedBox(height: 14),

                // ✅ Buttons
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => CourseDetailsScreen(
                                courseName: courseName,
                                imagePath: imagePath,
                                discountPrice: discountedPrice,
                                originalPrice: originalPrice,
                                offerText: offerText,
                              ),
                            ),
                          );
                        },
                        child: const Text("View Details"),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => CourseDemoScreen(
                                courseName: courseName,
                                imagePath: imagePath,
                                discountPrice: discountedPrice,
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

                const SizedBox(height: 10),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) {
                          return BuyNowBottomSheet(
                            courseName: courseName,
                            price: discountedPrice,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//buy now

class BuyNowBottomSheet extends StatefulWidget {
  final String courseName;
  final String price;

  const BuyNowBottomSheet({
    super.key,
    required this.courseName,
    required this.price,
  });

  @override
  State<BuyNowBottomSheet> createState() => _BuyNowBottomSheetState();
}

class _BuyNowBottomSheetState extends State<BuyNowBottomSheet> {
  final TextEditingController _couponController = TextEditingController();

  @override
  void dispose() {
    _couponController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 14,
        right: 14,
        bottom: MediaQuery.of(context).viewInsets.bottom + 14,
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ top handle
            Center(
              child: Container(
                height: 5,
                width: 45,
                margin: const EdgeInsets.only(bottom: 14),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            // ✅ Heading
            const Text(
              "Complete Payment",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            // ✅ Course Name
            Text(
              widget.courseName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 6),

            // ✅ Price
            Text(
              "Price: ${widget.price}",
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 16),

            // ✅ Coupon Field
            TextField(
              controller: _couponController,
              decoration: InputDecoration(
                hintText: "Apply Coupon (e.g. SAVE50)",
                prefixIcon: const Icon(Icons.discount),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 14),

            // ✅ Apply Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.indigo),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Coupon Applied: ${_couponController.text}")),
                  );
                },
                child: const Text(
                  "Apply Coupon",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 14),

            // ✅ Payment Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Pay Online Selected ✅")),
                      );
                    },
                    icon: const Icon(Icons.payment),
                    label: const Text("Pay Online"),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("QR Payment Selected ✅")),
                      );
                    },
                    icon: const Icon(Icons.qr_code), // ✅ QR Logo
                    label: const Text("QR Payment"),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
