import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/theme/app_theme.dart';
import 'package:news_app/features/templete/presentation/screens/book_marks_screen.dart';
import 'package:news_app/features/templete/presentation/screens/category_screen.dart';
import 'package:news_app/features/templete/presentation/screens/home_screen.dart';
import '../../../../core/theme/app_colors.dart';
import '../cubit/navigation_route/navigation_cubit.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          final navCubit = context.read<NavigationCubit>();
          final pages = [
            HomeScreen(),
            CategoryScreen(),
            BookMarksScreen(),
          ];
          return Scaffold(
            body: IndexedStack(
              index: state.currentIndex,
              children: pages,
            ),
            backgroundColor: context.colors.surface,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.currentIndex,
              onTap: navCubit.changeTab,
              type: BottomNavigationBarType.fixed,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined, size: 35),
                  activeIcon: Icon(
                    Icons.home_outlined,
                    size: 35,
                    color: AppColors.purpleDarker,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.window_rounded,
                    size: 35,
                  ),
                  activeIcon: Icon(
                    Icons.window_rounded,
                    size: 35,
                    color: AppColors.purpleDarker,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.bookmark_outline,
                    size: 35,
                  ),
                  activeIcon: Icon(
                    Icons.bookmark_outline,
                    size: 35,
                    color: AppColors.purpleDarker,
                  ),
                  label: '',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
