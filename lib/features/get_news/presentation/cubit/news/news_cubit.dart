import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/database/api/end_points.dart';
import 'package:news_app/core/enums/stats.dart';
import 'package:news_app/core/params/news_category_params.dart';
import 'package:news_app/features/get_news/domain/usecases/get_news.dart';

import '../../../domain/entities/post_entitiy.dart';
import '../../model/book_marked_post.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit(this.getNews) : super(NewsState()) {
    init();
  }
  final GetNewsByCategory getNews;
  int _categoryRequestId = 0;
  // int _dateRequestId = 0;

  Future<void> callNewsCategory(
    String category,
  ) async {
    final requestId = ++_categoryRequestId;
    emit(state.copyWith(
      categoryStatus: NewsStatus.loading,
      newsByCategory: [],
      selectedCategory: category,
    ));
    final response = await getNews.callNewsCategory(
      params: NewsCategoryParams(category: category),
    );

    if (requestId != _categoryRequestId) {
      return;
    }

    response.when(
      success: (newsApi) {
        if (requestId != _categoryRequestId) return;

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
            errorMessage: errorMessage.message,
          ),
        );
      },
    );
  }

  Future<void> callTopNews() async {
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
            errorMessage: error.message,
          ),
        );
      },
    );
  }

  Future<void> init() async {
    await callNewsCategory(EndPoints.defaultCategory);
    await callTopNews();
  }

  //* wait for it now

  // void init() {

  // }

  // Future<void> fetchInitial(bool isloaded) async {
  //   if (!isloaded) {
  //     emit(
  //       state.copyWith(
  //         categoryStatus: NewsStatus.loading,
  //         dateStatus: NewsStatus.loading,
  //       ),
  //     );
  //     await eitherFailureOrSuccessByCategory(
  //       EndPoints.defaultCategory,
  //     );
  //     await eitherFailureOrSuccessByDate();
  //   }
  // }

  void selectCategory(String category) {
    if (state.selectedCategory == category) return;
    emit(state.copyWith(selectedCategory: category));
    callNewsCategory(category);
  }

  void toggleBookmark(PostEntity post, {String? category}) {
    final currentBookmarks = List<BookmarkedPost>.from(state.bookmarks ?? []);
    final index = currentBookmarks.indexWhere(
      (bookmark) => bookmark.post.id == post.id,
    );

    if (index != -1) {
      currentBookmarks.removeAt(index);
    } else {
      currentBookmarks.add(BookmarkedPost(post: post, category: category));
    }

    emit(state.copyWith(bookmarks: currentBookmarks));
  }
}
