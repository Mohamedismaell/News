import 'package:flutter/material.dart';
import 'package:news_app/core/shared/presentation/widget/bottom_nav.dart';
import 'package:news_app/features/categories/presentation/screens/categories_screen.dart';
import 'package:news_app/features/home/presentation/screens/book_marks_screen.dart';
import 'package:news_app/features/home/presentation/screens/home_screen.dart';
import 'package:news_app/features/home/presentation/screens/profile_screen.dart';

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  // final pageController = PageController();
  int _currentIndex = 0;

  // void _onTabTap(int index) {
  //   if (!pageController.hasClients) return;
  //   final current = pageController.page?.round() ?? _currentIndex;
  //   final distance = (index - current).abs();
  //   if (distance >= 1) {
  //     int neighbor = index > _currentIndex ? index - 1 : index + 1;
  //     pageController.jumpToPage(neighbor);
  //   }
  //   pageController.animateToPage(
  //     index,
  //     duration: const Duration(milliseconds: 300),
  //     curve: Curves.easeOut,
  //   );
  // }

  @override
  void dispose() {
    // pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: IndexedStack(
            index: _currentIndex,
            children: [
              const HomeScreen(),
              const CategoriesScreen(),
              const BookMarksScreen(),
              const ProfileScreen(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
