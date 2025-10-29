import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
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
  // Future<void> eitherFailureOrSuccessByCategory(
  //   String category,
  // ) async {
  //   emit(state.copyWith(status: NewsStatus.loading));
  //   final response = await getNews.callNewsCategory(
  //     params: NewsCategoryParams(category: category),
  //   );
  //   response.when(
  //     success: (newsApi) {
  //       final validateNews = newsApi.where((post) {
  //         return post.threadimageUrl != null &&
  //             post.threadimageUrl!.isNotEmpty &&
  //             Uri.tryParse(
  //                   post.threadimageUrl!,
  //                 )?.hasAbsolutePath ==
  //                 true;
  //       }).toList();

  //       emit(
  //         state.copyWith(
  //           status: NewsStatus.loaded,
  //           validatedNews: validateNews,
  //         ),
  //       );
  //     },
  //     failure: (errorMessage) {
  //       emit(
  //         state.copyWith(
  //           status: NewsStatus.error,
  //           errorMessage: errorMessage.toString(),
  //         ),
  //       );
  //     },
  //   );
  // }

  Future<void> eitherFailureOrSuccessByDate() async {
    final response = await getNews.callNewsDate();
    return response.when(
      success: (news) {
        final validateNews = news.where((post) {
          return post.threadimageUrl != null &&
              post.threadimageUrl!.isNotEmpty &&
              Uri.tryParse(
                    post.threadimageUrl!,
                  )?.hasAbsolutePath ==
                  true;
        }).toList();
        emit(
          state.copyWith(
            status: NewsStatus.loaded,
            validatedNews: validateNews,
          ),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
            status: NewsStatus.error,
            errorMessage: error.errMessage,
          ),
        );
      },
    );
  }

  Future<void> init() async {
    // await eitherFailureOrSuccessByCategory(
    //   EndPoints.defaultCategory,
    // );
    await eitherFailureOrSuccessByDate();
  }

  void selectCategory(String category) {
    if (state.selectedCategory == category) return;
    emit(state.copyWith(selectedCategory: category));
    // eitherFailureOrSuccessByCategory(category);
  }
}
