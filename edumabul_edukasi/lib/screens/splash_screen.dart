import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'register_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _pages = [
    {
      'title': 'Kenali bullying\nsejak dini',
      'bgColor': AppColors.primaryDark,
      'cardBg': AppColors.primaryDark,
      'description': 'Bullying bisa lewat kata-kata, tindakan fisik, atau pesan di dunia maya. Mengenalinya adalah langkah pertama untuk menghentikannya.',
      'tags': ['Verbal', 'Fisik', 'Siber'],
      'icon': Icons.chat_bubble_rounded,
    },
    {
      'title': 'Berani bersuara',
      'bgColor': Colors.white,
      'cardBg': AppColors.primaryYellow,
      'description': 'Kamu tidak sendirian. Ceritakan pada guru atau orang yang kamu percaya, dan dampingi temanmu yang sedang kesulitan.',
      'tags': ['Ceritakan ke guru', 'Dampingi teman', 'Kamu berharga'],
      'icon': Icons.campaign_rounded,
    },
    {
      'title': 'Sekolah aman dimulai\ndari kita',
      'bgColor': Colors.white,
      'cardBg': AppColors.accentLight,
      'description': 'Selesaikan tugas edukasi, kumpulkan kartu Duta Anti-Bullying, dan tebarkan empati setiap hari.',
      'tags': ['Kartu Duta', 'Tugas edukasi', 'Empati'],
      'icon': Icons.shield_rounded,
    },
  ];

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => RegisterScreen()),
      );
    }
  }

  void _prevPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar (Lewati)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                  child: Text(
                    'Lewati',
                    style: TextStyle(
                      color: AppColors.primaryDark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            // Slider Content
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _currentPage = index);
                },
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  final data = _pages[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          data['title'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryDark,
                          ),
                        ),
                        SizedBox(height: 30),
                        // Illustration Container
                        Container(
                          width: double.infinity,
                          height: 250,
                          decoration: BoxDecoration(
                            color: data['cardBg'],
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CircleAvatar(
                                radius: 45,
                                backgroundColor: Colors.white24,
                                child: Icon(
                                  data['icon'],
                                  size: 50,
                                  color: index == 0
                                      ? AppColors.primaryYellow
                                      : AppColors.primaryDark,
                                ),
                              ),
                              // Floating Badges
                              Positioned(
                                top: 40,
                                left: 20,
                                child: _buildBadge(data['tags'][0]),
                              ),
                              Positioned(
                                top: 90,
                                right: 20,
                                child: _buildBadge(data['tags'][1]),
                              ),
                              Positioned(
                                bottom: 40,
                                left: 30,
                                child: _buildBadge(data['tags'][2]),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        Text(
                          data['description'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.textDark,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Bottom Control Bar
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Indicators
                  Row(
                    children: List.generate(
                      _pages.length,
                      (index) => AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        margin: EdgeInsets.only(right: 6),
                        width: _currentPage == index ? 24 : 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? AppColors.primaryDark
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),

                  // Navigation Buttons
                  Row(
                    children: [
                      if (_currentPage > 0)
                        TextButton(
                          onPressed: _prevPage,
                          child: Text(
                            'Kembali',
                            style: TextStyle(color: AppColors.primaryDark),
                          ),
                        ),
                      ElevatedButton(
                        onPressed: _nextPage,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryDark,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              _currentPage == _pages.length - 1
                                  ? 'Mulai'
                                  : 'Lanjut',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 16,
                            ),
                          ],
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

  Widget _buildBadge(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryDark,
        ),
      ),
    );
  }
}
