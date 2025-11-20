import 'package:go_router/go_router.dart';
import 'package:news_app/core/routes/app_routes.dart';
import '../presentation/screens/book_marks_screen.dart';
import '../presentation/screens/categories_screen.dart';
import '../presentation/screens/home_screen.dart';

class HomeRoutes {
  static List<RouteBase> routes = [
    GoRoute(
        path: AppRoutes.home,
        name: 'Home',
        builder: (context, state) => HomeScreen()),
    GoRoute(
        path: AppRoutes.category,
        name: 'categories',
        builder: (context, state) => CategoryScreen()),
    GoRoute(
        path: AppRoutes.bookmarks,
        name: 'bookmarks',
        builder: (context, state) => BookMarksScreen()),
  ];
}
