import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/shared/domain/entities/post_entitiy.dart';
import 'package:news_app/core/shared/injection/service_locator.dart';
import 'package:news_app/core/shared/params/news_category_params.dart';
import 'package:news_app/core/shared/routes/app_routes.dart';
import 'package:news_app/features/post_details/domain/usecases/get_specific_post_usecase.dart';
import 'package:news_app/features/post_details/presentation/manager/post_details/post_details_cubit.dart';
import 'package:news_app/features/post_details/presentation/screens/post_details.dart';

class PostDetailsRoutes {
  static List<RouteBase> routes = [
    GoRoute(
        name: 'postDetails',
        path: AppRoutes.postDetails,
        builder: (context, state) {
          final postId = state.pathParameters['postId']!;
          final extra = state.extra as Map<String, dynamic>?;
          return BlocProvider(
            create: (context) => PostDetailsCubit(sl<GetSpecificPost>())
              ..callSpecificPost(NewsCategoryParams(category: postId)),
            child: PostDetails(
              heroTag: extra?['heroTag'] ?? '',
              previewCover: extra?['coverUrl'] ?? '',
              previewTitle: extra?['title'] ?? '',
              previewAuthor: extra?['author'] ?? '',
              isBookmarked: extra?['isBookmarked'] ?? false,
            ),
          );
        }),
  ];
}
