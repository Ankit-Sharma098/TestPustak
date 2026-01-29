class FreeTestSeries {
  final String id;
  final String title;
  final String imageUrl; // local / placeholder for now
  final String? syllabusPdf;

  FreeTestSeries({
    required this.id,
    required this.title,
    required this.imageUrl,
    this.syllabusPdf,
  });
}

