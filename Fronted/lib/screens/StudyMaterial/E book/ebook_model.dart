class EbookModel {
  final String id;
  final String title;
  final String imagePath; // ✅ asset image path
  final String description;

  EbookModel({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.description,
  });
}