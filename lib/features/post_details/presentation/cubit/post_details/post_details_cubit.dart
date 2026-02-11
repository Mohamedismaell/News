import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/params/news_category_params.dart';
import 'package:news_app/features/post_details/domain/usecases/get_specific_post_usecase.dart';
import 'package:news_app/features/post_details/presentation/cubit/post_details/post_details_state.dart';

class PostDetailsCubit extends Cubit<PostDetailsState> {
  PostDetailsCubit(this.getSpecificPost) : super(PostDetailsInitial());
  final GetSpecificPost getSpecificPost;

  Future<void> callSpecificPost(
    NewsCategoryParams params,
  ) async {
    emit(
      PostDetailsLoading(),
    );
    final response = await getSpecificPost.callSpecificPost(
      params: params,
    );

    response.when(
      success: (post) {
        emit(PostDetailsLoaded(post: post));
      },
      failure: (errorMessage) {
        emit(PostDetailsError(errorMessage: errorMessage.message));
      },
    );
  }
}
