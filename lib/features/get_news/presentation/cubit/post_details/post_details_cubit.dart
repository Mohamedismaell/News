import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/core/params/news_category_params.dart';
import 'package:news_app/features/get_news/domain/entities/post_entitiy.dart';
import 'package:news_app/features/get_news/domain/usecases/get_specific_post_usecase.dart';
part 'post_details_state.dart';

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
