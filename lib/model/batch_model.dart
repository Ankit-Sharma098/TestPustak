class Batch {
  final String id; // FIXED: Added unique identifier
  final String title;
  final String instructor;
  final String imageUrl;
  final int lessonCount;
  final double rating;
  final double price;
  final double discountedPrice;
  final String description;

  Batch({
    required this.id,
    required this.title,
    required this.instructor,
    required this.imageUrl,
    required this.lessonCount,
    required this.rating,
    required this.price,
    required this.discountedPrice,
    required this.description,
  });
}

// Dummy Data
final List<Batch> sampleBatches = [
  Batch(
    id: 'b1',
    title: 'Complete Flutter Development Bootcamp',
    instructor: 'Angela Yu',
    imageUrl: 'assets/images/flutter_bootcamp.jpg',
    lessonCount: 35,
    rating: 4.8,
    price: 3999,
    discountedPrice: 499,
    description: 'Join the most comprehensive Flutter course! With over 30 hours of content, you will learn everything from the basics of Dart to advanced concepts like state management and Firebase integration. This course is perfect for beginners and experienced developers alike.',
  ),
  Batch(
    id: 'b2',
    title: 'UPSC 2025: GS Foundation Course',
    instructor: 'Mrunal Patel',
    imageUrl: 'assets/images/upsc_foundation.jpg',
    lessonCount: 250,
    rating: 4.9,
    price: 79999,
    discountedPrice: 49999,
    description: 'A complete General Studies foundation course for UPSC CSE 2025 aspirants. This batch covers all subjects for Prelims and Mains including Polity, History, Geography, Economy, and more. Includes mentorship and doubt-clearing sessions.',
  ),
  Batch(
    id: 'b3',
    title: 'Digital Marketing Pro Course',
    instructor: 'Neil Patel',
    imageUrl: 'assets/images/digital_marketing.jpg',
    lessonCount: 50,
    rating: 4.7,
    price: 9999,
    discountedPrice: 999,
    description: 'Become a certified Digital Marketing professional. This course covers SEO, SEM, Social Media Marketing, Content Marketing, and Email Marketing. Includes live projects and case studies to give you hands-on experience.',
  ),
];
