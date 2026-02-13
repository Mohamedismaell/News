import 'package:go_router/go_router.dart';
import 'package:news_app/core/shared/presentation/shell/tabs_shell.dart';
import 'package:news_app/core/shared/routes/app_routes.dart';
import 'package:news_app/features/profile/presentation/screens/profile_screen.dart';

class ProfileRoutes {
  static List<RouteBase> routes = [
    ShellRoute(
      builder: (context, state, child) {
        return HomeShell();
      },
      routes: [
        GoRoute(
          path: AppRoutes.profile,
          builder: (_, __) => const ProfileScreen(),
        ),
      ],
    ),
  ];
}
