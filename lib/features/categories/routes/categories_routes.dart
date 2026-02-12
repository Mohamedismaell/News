import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/enums/news_category.dart';
import 'package:news_app/core/shared/routes/app_routes.dart';
import 'package:news_app/core/shared/shell/tabs_shell.dart';
import 'package:news_app/features/categories/presentation/screens/categories_screen.dart';
import 'package:news_app/features/home/presentation/cubit/news/category_news_cubit.dart';
import 'package:news_app/features/home/presentation/screens/category_screen.dart';

class CategoriesRoutes {
  static List<RouteBase> routes = [
    ShellRoute(
      builder: (context, state, child) {
        return HomeShell();
      },
      routes: [
        GoRoute(
          path: AppRoutes.categories,
          builder: (_, __) => const CategoriesScreen(),
        ),
      ],
    ),
    GoRoute(
        path: AppRoutes.categoryScreen,
        builder: (context, state) {
          //Todo: Edit cateogry passing type here.
          final category = state.extra as NewsCategory;
          context.read<CategoryNewsCubit>().callNewsCategory(category.value);

          return CategoryScreen(category: category);
        })
  ];
}
