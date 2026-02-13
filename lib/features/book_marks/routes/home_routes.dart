import 'package:go_router/go_router.dart';
import 'package:news_app/core/shared/presentation/shell/tabs_shell.dart';
import 'package:news_app/core/shared/routes/app_routes.dart';
import 'package:news_app/features/book_marks/presentation/screens/book_marks_screen.dart';

class BookMarksRoutes {
  static List<RouteBase> routes = [
    ShellRoute(
      builder: (context, state, child) {
        return HomeShell();
      },
      routes: [
        GoRoute(
          path: AppRoutes.bookmarks,
          builder: (_, __) => const BookMarksScreen(),
        ),
      ],
    ),
  ];
}
