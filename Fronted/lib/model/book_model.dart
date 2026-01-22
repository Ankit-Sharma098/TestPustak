class BookModel {
  final String title;
  final String author;
  final String image;
  final double rating;
  final double price;

  BookModel({
    required this.title,
    required this.author,
    required this.image,
    required this.rating,
    required this.price,
  });
}

// ✅ Dummy Data
final List<BookModel> sampleBooks = [
  BookModel(
    title: "UPSC GS Complete Guide",
    author: "Vision IAS",
    image: "assets/images/img.png",
    rating: 4.5,
    price: 299,
  ),
  BookModel(
    title: "SSC Maths Mastery",
    author: "Rakesh Yadav",
    image: "assets/images/img_1.png",
    rating: 4.3,
    price: 199,
  ),
];
