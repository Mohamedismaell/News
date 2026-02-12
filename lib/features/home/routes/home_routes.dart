import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/enums/news_category.dart';
import 'package:news_app/core/shared/routes/app_routes.dart';
import 'package:news_app/core/shared/shell/tabs_shell.dart';
import 'package:news_app/features/home/presentation/cubit/news/category_news_cubit.dart';
import 'package:news_app/features/home/presentation/screens/profile_screen.dart';
import 'package:news_app/features/home/presentation/screens/search_screen.dart';

import '../presentation/screens/book_marks_screen.dart';
import '../presentation/screens/category_screen.dart';
import '../presentation/screens/home_screen.dart';

class HomeRoutes {
  static List<RouteBase> routes = [
    ShellRoute(
      builder: (context, state, child) {
        return HomeShell();
      },
      routes: [
        GoRoute(
          path: AppRoutes.home,
          builder: (_, __) => const HomeScreen(),
        ),
        GoRoute(
          path: AppRoutes.bookmarks,
          builder: (_, __) => const BookMarksScreen(),
        ),
        GoRoute(
          path: AppRoutes.profile,
          builder: (_, __) => const ProfileScreen(),
        ),
      ],
    ),
    GoRoute(
      name: 'search',
      path: AppRoutes.search,
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>?;
        return SearchScreen(
          heroTag: extra?['heroTag'] ?? '',
        );
      },
    ),
  ];
}
