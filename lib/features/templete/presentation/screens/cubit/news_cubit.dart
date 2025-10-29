import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/database/api/end_points.dart';
import 'package:news_app/core/params/params.dart';
import 'package:news_app/features/templete/domain/usecases/get_news.dart';
import '../../../domain/entities/post_entitiy.dart';
part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit(this.getNews) : super(NewsState()) {
    init();
  }
  final GetNewsByCategory getNews;
  Future<void> eitherFailureOrSuccessByCategory(
    String category,
  ) async {
    final response = await getNews.callNewsCategory(
      params: NewsCategoryParams(category: category),
    );
    response.when(
      success: (newsApi) {
        final validateNewsCategory = newsApi.where((post) {
          return post.threadimageUrl != null &&
              post.threadimageUrl!.isNotEmpty &&
              Uri.tryParse(
                    post.threadimageUrl!,
                  )?.hasAbsolutePath ==
                  true;
        }).toList();
        emit(
          state.copyWith(
            categoryStatus: NewsStatus.loaded,
            newsByCategory: validateNewsCategory,
          ),
        );
      },
      failure: (errorMessage) {
        emit(
          state.copyWith(
            categoryStatus: NewsStatus.error,
            errorMessage: errorMessage.errMessage,
          ),
        );
      },
    );
  }

  Future<void> eitherFailureOrSuccessByDate() async {
    final response = await getNews.callNewsDate();
    return response.when(
      success: (news) {
        final validateNewsDate = news.where((post) {
          return post.threadimageUrl != null &&
              post.threadimageUrl!.isNotEmpty &&
              Uri.tryParse(
                    post.threadimageUrl!,
                  )?.hasAbsolutePath ==
                  true;
        }).toList();
        emit(
          state.copyWith(
            dateStatus: NewsStatus.loaded,
            newsByDate: validateNewsDate,
          ),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
            dateStatus: NewsStatus.error,
            errorMessage: error.errMessage,
          ),
        );
      },
    );
  }

  Future<void> init() async {
    emit(
      state.copyWith(
        categoryStatus: NewsStatus.loading,
        dateStatus: NewsStatus.loading,
      ),
    );
    await eitherFailureOrSuccessByCategory(
      EndPoints.defaultCategory,
    );
    await eitherFailureOrSuccessByDate();
  }

  void selectCategory(String category) {
    if (state.selectedCategory == category) return;
    emit(state.copyWith(selectedCategory: category));
    eitherFailureOrSuccessByCategory(category);
  }
}
