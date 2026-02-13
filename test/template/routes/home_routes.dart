// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:news_app/core/enums/news_category.dart';
// import 'package:news_app/core/shared/routes/app_routes.dart';
// import 'package:news_app/core/shared/shell/tabs_shell.dart';
// import 'package:news_app/features/home/presentation/cubit/news/category_news_cubit.dart';
// import 'package:news_app/features/home/presentation/screens/profile_screen.dart';
// import 'package:news_app/features/home/presentation/screens/search_screen.dart';
// import '../../home/presentation/screens/book_marks_screen.dart';
// import '../../home/presentation/screens/categories_screen.dart';
// import '../../home/presentation/screens/category_screen.dart';
// import '../../home/presentation/screens/home_screen.dart';

// class TemplateRoutes {
//   static List<RouteBase> routes = [
//     ShellRoute(
//       builder: (context, state, child) {
//         return HomeShell();
//       },
//       routes: [
//         GoRoute(
//           path: AppRoutes.home,
//           builder: (_, __) => const HomeScreen(),
//         ),
//         GoRoute(
//           path: AppRoutes.categories,
//           builder: (_, __) => const CategoriesScreen(),
//         ),
//         GoRoute(
//           path: AppRoutes.bookmarks,
//           builder: (_, __) => const BookMarksScreen(),
//         ),
//         GoRoute(
//           path: AppRoutes.profile,
//           builder: (_, __) => const ProfileScreen(),
//         ),
//         GoRoute(
//             path: AppRoutes.categoryScreen,
//             builder: (context, state) {
//               //Todo: Edit cateogry passing type here.
//               final category = state.extra as NewsCategory;
//               context
//                   .read<CategoryNewsCubit>()
//                   .callNewsCategory(category.value);

//               return CategoryScreen(category: category);
//             }),
//       ],
//     ),
//     GoRoute(
//       name: 'search',
//       path: AppRoutes.search,
//       builder: (context, state) {
//         final extra = state.extra as Map<String, dynamic>?;
//         return SearchScreen(
//           heroTag: extra?['heroTag'] ?? '',
//         );
//       },
//     ),
//   ];
// }
