import 'package:go_router/go_router.dart';
import 'package:news_app/core/shared/routes/app_routes.dart';
import 'package:news_app/features/home/presentation/screens/search_screen.dart';

import '../presentation/screens/home_screen.dart';

class HomeRoutes {
  static GoRoute tabRoute = GoRoute(
    path: AppRoutes.home,
    builder: (_, __) => const HomeScreen(),
  );

  static List<RouteBase> extraRoutes = [
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
