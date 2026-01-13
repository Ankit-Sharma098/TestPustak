class TestModel {
  final String id;
  final String title;
  final String category;
  final String imageUrl;
  final int durationInMinutes;
  final int questionCount;

  TestModel({
    required this.id,
    required this.title,
    required this.category,
    required this.imageUrl,
    required this.durationInMinutes,
    required this.questionCount,
  });
}

// Dummy data for demonstration purposes.
final List<TestModel> dummyTests = [
  TestModel(
    id: 't1',
    title: 'SSC CGL Tier 1 Full Test',
    category: 'SSC Exams',
    imageUrl: 'assets/images/test_banner1.jpg',
    durationInMinutes: 60,
    questionCount: 100,
  ),
  TestModel(
    id: 't2',
    title: 'UPSC Prelims CSAT Mock',
    category: 'UPSC CSE',
    imageUrl: 'assets/images/test_banner2.jpg',
    durationInMinutes: 120,
    questionCount: 80,
  ),
  TestModel(
    id: 't3',
    title: 'Banking PO Reasoning Test',
    category: 'Banking',
    imageUrl: 'assets/images/test_banner3.jpg',
    durationInMinutes: 45,
    questionCount: 50,
  ),
];