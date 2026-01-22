import 'free_test_model.dart';
import 'test_model.dart';

final List<FreeTestModel> freeTestSeries = [
  FreeTestModel(
    id: 'bihar_police',
    title: 'Bihar Police Free',
    image: 'assets/images/bihar_police.jpg',
  ),
  FreeTestModel(
    id: 'current_affairs',
    title: 'Current Affairs 2025',
    image: 'assets/images/p1.jpg',
  ),
  FreeTestModel(
    id: 'ssc_gd',
    title: 'SSC GD Free Online Test',
    image: 'assets/images/p2.jpg',
  ),
];

final Map<String, List<TestModel>> testData = {
  'bihar_police': [
    TestModel(name: 'TEST-1', duration: 90, questions: 100, marks: 100),
    TestModel(name: 'TEST-2', duration: 90, questions: 100, marks: 100),
  ],
  'current_affairs': [
    TestModel(name: 'TEST-1', duration: 60, questions: 50, marks: 50),
  ],
  'ssc_gd': [
    TestModel(name: 'TEST-1', duration: 90, questions: 100, marks: 100),
    TestModel(name: 'TEST-2', duration: 90, questions: 100, marks: 100),
  ],
};