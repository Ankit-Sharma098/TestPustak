import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../../Bottom_Nav_Bar/chat.dart';
import '../../Bottom_Nav_Bar/featured_books.dart';
import '../../Bottom_Nav_Bar/livevideo.dart';
import '../../Bottom_Nav_Bar/batches/popular_batches_screen.dart';
import '../Notification/notification_screen.dart';
import '../StudyMaterial/All_exam_syllabus/all_exam_syllabus.dart';
import '../StudyMaterial/E book/ebook_screen.dart';
import '../StudyMaterial/Paid course/Paid_Course.dart';
import '../StudyMaterial/daily_current_affairs/Daily_current_affairs.dart';
import '../StudyMaterial/daily_quiz/daily_quiz.dart';
import '../StudyMaterial/free_pdf/Free_pdf.dart';
import '../StudyMaterial/free_test_series/Free_test_series.dart';
import '../StudyMaterial/free_youtube_class/free_youtube_classes.dart';
import '../StudyMaterial/job_notification/job_notification.dart';
import '../StudyMaterial/paid_pdfs/paid_pdfs.dart';
import '../StudyMaterial/paid_test_series/paid_test_series_screen.dart';
import '../StudyMaterial/previous_year_paper/previous_year_paper.dart';
import 'call/group_call_home_screen.dart';
import 'drawer_menu.dart';


class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController(viewportFraction: 0.9, initialPage: 0);

  int _currentPage = 0;
  Timer? _timer;
  int _selectedBottomIndex = 0;

  final List<String> _bannerImages = [
    'assets/images/ssc_gd.jpg',
    'assets/images/gv_exam.jpg',
    'assets/images/g1.jpg',
  ];

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
      if (mounted) setState(() {});
    });

    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (!mounted) return;

      if (_currentPage < _bannerImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenu(),
      appBar: AppBar(
        title: Image.asset(
          'assets/images/testpustak.jpg',
          height: 32,
          errorBuilder: (context, error, stackTrace) {
            return const Text(
              'TestPustak',
              style: TextStyle(fontWeight: FontWeight.bold),
            );
          },
        ),
        actions: [
          // ✅ Voice Call Icon (पहले)
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const GroupCallHomeScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationScreen(),
                ),
              );
            },
          ),
        ], // ✅ actions close
      ), // ✅ AppBar close


      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),

            // ✅ Banner Carousel
            SizedBox(
              height: 190,
              child: PageView.builder(
                controller: _pageController,
                itemCount: _bannerImages.length,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (context, index) {
                  double scale = 1.0;
                  if (_pageController.position.haveDimensions) {
                    double page = _pageController.page ?? 0.0;
                    scale = max(0.85, 1 - (page - index).abs() * 0.3);
                  }

                  return Transform.scale(
                    scale: scale,
                    child: _buildBannerSlide(
                      imagePath: _bannerImages[index],
                      title: "Prepare for Government Exams",
                      subtitle: "UPSC • SSC • Banking • Railway",
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 12),
            _buildPageIndicator(),
            const SizedBox(height: 24),

            // ✅ Home Grid Menu
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.95,
                children: [
                  _HomeGridItem(Icons.school, 'Paid\nCourse', onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const PaidCoursesScreen()),
                    );
                  }),

                  _HomeGridItem(Icons.menu_book, 'E-Books',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const EBooksScreen(),
                          ),
                        );
                      }),
                  _HomeGridItem(
                    Icons.picture_as_pdf,
                    'Free PDFs',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const FreePdfsScreen(),
                        ),
                      );
                    },
                  ),

                  _HomeGridItem(Icons.assignment, 'Paid Test\nSeries', onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PaidTestSeriesScreen(),
                      ),
                    );
                  }),

                  _HomeGridItem(Icons.fact_check, 'Free Test\nSeries', onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const FreeTestSeriesScreen(),
                      ),
                    );
                  }),
                  _HomeGridItem(
                    Icons.description,
                    'Paid PDFs',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const PaidPdfsScreen(),
                        ),
                      );
                    },
                  ),

                  _HomeGridItem(
                    Icons.public,
                    'Daily Current\nAffairs',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const DailyCurrentAffairsScreen(),
                        ),
                      );
                    },
                  ),

                  _HomeGridItem(
                    Icons.quiz,
                    'Daily Quiz',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const DailyQuizScreen(),
                        ),
                      );
                    },
                  ),

                  _HomeGridItem(
                    Icons.library_books,
                    'Previous Year\nPaper',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const PreviousYearPaperScreen(),
                        ),
                      );
                    },
                  ),

                  _HomeGridItem(
                    Icons.campaign,
                    'Job\nNotification',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const JobNotificationScreen(),
                        ),
                      );
                    },
                  ),

                  _HomeGridItem(
                    Icons.play_circle_fill,
                    'Free Youtube\nClasses',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const FreeYoutubeClassesScreen(),
                        ),
                      );
                    },
                  ),

                  _HomeGridItem(
                    Icons.list_alt,
                    'All Exam\nSyllabus',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const AllExamSyllabusScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),

      // ✅ Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedBottomIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _selectedBottomIndex = index;
          });

          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const PopularBatchesScreen()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const FeaturedBooksScreen()),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const LiveVideoScreen()),
            );
          } else if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ChatScreen()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.groups_outlined), label: 'Batches'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book_outlined), label: 'Books'),
          BottomNavigationBarItem(icon: Icon(Icons.play_circle_outline), label: 'Live'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_outlined), label: 'Chat'),
        ],
      ),
    );
  }

  Widget _buildBannerSlide({
    required String imagePath,
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(color: Colors.grey),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  stops: const [0.0, 0.7],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      shadows: [Shadow(blurRadius: 10, color: Colors.black54)],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 14,
                      shadows: const [Shadow(blurRadius: 8, color: Colors.black54)],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_bannerImages.length, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          height: 8.0,
          width: _currentPage == index ? 24.0 : 8.0,
          decoration: BoxDecoration(
            color: _currentPage == index ? Theme.of(context).primaryColor : Colors.grey.shade400,
            borderRadius: BorderRadius.circular(12),
          ),
        );
      }),
    );
  }
}

// ✅ GRID ITEM WIDGET
class _HomeGridItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _HomeGridItem(this.icon, this.title, {required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 42, color: Theme.of(context).primaryColor),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}



