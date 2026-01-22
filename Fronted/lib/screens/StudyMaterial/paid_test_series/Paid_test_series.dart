class PaidTestSeries {
  final String id;
  final String title;
  final String image;
  final int price;
  bool isPurchased;

  PaidTestSeries({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    this.isPurchased = false,
  });
}

final List<PaidTestSeries> paidTestSeriesList = [
  PaidTestSeries(
    id: 'ssc_gd',
    title: 'SSC GD Test Series',
    image: 'assets/images/ssc_gd.jpg',
    price: 199,
    isPurchased: false,
  ),
  PaidTestSeries(
    id: 'railway',
    title: 'Railway Group D Test Series',
    image: 'assets/images/gv_exam.jpg',
    price: 149,
    isPurchased: true,
  ),
];