import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/enums/news_category.dart';
import 'package:news_app/core/shared/injection/service_locator.dart';
import 'package:news_app/core/shared/routes/app_routes.dart';
import 'package:news_app/features/categories/presentation/screens/categories_screen.dart';
import 'package:news_app/core/shared/presentation/manager/news/category_news_cubit.dart';
import 'package:news_app/features/categories/presentation/screens/category_screen.dart';

class CategoriesRoutes {
  static GoRoute tabRoute = GoRoute(
    path: AppRoutes.categories,
    builder: (_, __) => const CategoriesScreen(),
  );

  static List<RouteBase> extraRoutes = [
    GoRoute(
      path: AppRoutes.categoryScreen,
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>?;
        final category = extra?['category'] as NewsCategory?;
        return BlocProvider(
          create: (context) =>
              sl<CategoryNewsCubit>()..callNewsCategory(category?.value ?? ''),
          child: CategoryScreen(category: category),
        );
      },
    ),
  ];
}
