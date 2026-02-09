import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/injection/service_locator.dart';
import 'package:news_app/core/navigaiton/tabs_shell.dart';
import 'package:news_app/core/params/news_category_params.dart';
import 'package:news_app/core/routes/app_routes.dart';
import 'package:news_app/core/enums/news_category.dart';
import 'package:news_app/features/get_news/domain/usecases/get_specific_post_usecase.dart';
import 'package:news_app/features/get_news/presentation/cubit/news/news_cubit.dart';
import 'package:news_app/features/get_news/presentation/cubit/post_/post_details_cubit.dart';
import 'package:news_app/features/get_news/presentation/screens/post_details.dart';
import 'package:news_app/features/get_news/presentation/screens/profile_screen.dart';
import '../presentation/screens/book_marks_screen.dart';
import '../presentation/screens/categories_screen.dart';
import '../presentation/screens/category_screen.dart';
import '../presentation/screens/home_screen.dart';

class HomeRoutes {
  static List<RouteBase> routes = [
    ShellRoute(
      builder: (context, state, child) {
        return BlocProvider.value(
            value: sl<NewsCubit>()..init(), child: HomeShell());
      },
      routes: [
        GoRoute(
          path: AppRoutes.home,
          builder: (_, __) => const HomeScreen(),
        ),
        GoRoute(
          path: AppRoutes.categories,
          builder: (_, __) => const CategoriesScreen(),
        ),
        GoRoute(
          path: AppRoutes.bookmarks,
          builder: (_, __) => const BookMarksScreen(),
        ),
        GoRoute(
          path: AppRoutes.profile,
          builder: (_, __) => const ProfileScreen(),
        ),
        GoRoute(
            path: AppRoutes.categoryScreen,
            builder: (context, state) {
              //Todo: Edit cateogry passing type here.
              final category = state.extra as NewsCategory;
              context.read<NewsCubit>().callNewsCategory(category.value);

              return CategoryScreen(category: category);
            }),
      ],
    ),
    GoRoute(
        name: 'postDetails',
        path: AppRoutes.newsDetails,
        builder: (context, state) {
          final postId = state.pathParameters['postId']!;
          final extra = state.extra as Map<String, dynamic>?;
          return BlocProvider(
            create: (context) => PostDetailsCubit(sl<GetSpecificPost>())
              ..callSpecificPost(NewsCategoryParams(category: postId)),
            child: PostDetails(
              heroTag: extra?['heroTag'],
              previewCover: extra?['coverUrl'],
              previewTitle: extra?['title'],
              previewAuthor: extra?['author'],
            ),
          );
        }),
  ];
}
