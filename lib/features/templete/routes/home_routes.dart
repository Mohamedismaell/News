import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routes/app_routes.dart';
import 'package:news_app/features/templete/presentation/cubit/news/news_cubit.dart';
import 'package:news_app/features/templete/presentation/model/news_detail_args.dart';
import 'package:news_app/features/templete/presentation/screens/post_details.dart';
import '../../../core/di/service_locator.dart';
import '../presentation/screens/book_marks_screen.dart';
import '../presentation/screens/categories_screen.dart';
import '../presentation/screens/category_screen.dart';
import '../presentation/screens/home_screen.dart';

class HomeRoutes {
  static List<RouteBase> routes = [
    ShellRoute(
      builder: (context, state, child) {
        final index =
            _indexFromLocation(state.matchedLocation);
        return BlocProvider.value(
          value: sl<NewsCubit>()..init(),
          child: Scaffold(
            body: child,
            bottomNavigationBar: NavigationBar(
              indicatorColor: Colors.transparent,
              selectedIndex: index,
              onDestinationSelected: (index) {
                switch (index) {
                  case 0:
                    context.go(AppRoutes.home);
                    break;
                  case 1:
                    context.go(AppRoutes.category);
                    break;
                  case 2:
                    context.go(AppRoutes.bookmarks);
                    break;
                }
              },
              destinations: [
                NavigationDestination(
                    icon: Icon(
                      Icons.home,
                    ),
                    label: ''),
                NavigationDestination(
                    icon: Icon(
                      Icons.grid_view_outlined,
                    ),
                    label: ''),
                NavigationDestination(
                    icon: Icon(
                      Icons.bookmark_outline_sharp,
                    ),
                    label: ''),
              ],
            ),
          ),
        );
      },
      routes: [
        GoRoute(
          path: AppRoutes.home,
          builder: (_, __) => const HomeScreen(),
        ),
        GoRoute(
          path: AppRoutes.category,
          builder: (_, __) => const CategoriesScreen(),
        ),
        GoRoute(
          path: AppRoutes.bookmarks,
          builder: (_, __) => const BookMarksScreen(),
        ),
      ],
    ),
    GoRoute(
        path: AppRoutes.newsDetails,
        builder: (context, state) {
          final argu = state.extra as NewsDetailsArgs;

          return PostDetails(
              category: argu.category, post: argu.post);
        }),
    GoRoute(
        path: AppRoutes.categoryScreen,
        builder: (context, state) {
          final category = state.extra as String;

          return CategoryScreen(
            category: category,
          );
        }),
  ];
}

int _indexFromLocation(String location) {
  if (location.startsWith(AppRoutes.category)) return 1;
  if (location.startsWith(AppRoutes.bookmarks)) return 2;
  return 0;
}
