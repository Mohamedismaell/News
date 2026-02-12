import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/connection/refresh_on_reconnect.dart';
import 'package:news_app/core/database/api/end_points.dart';
import 'package:news_app/core/enums/stats.dart';
import 'package:news_app/core/shared/domain/entities/post_entitiy.dart';
import 'package:news_app/core/shared/domain/usecases/get_news.dart';
import 'package:news_app/core/shared/presentation/manager/connection_cubit/connection_cubit.dart';
import 'package:news_app/core/shared/params/news_category_params.dart';
import 'package:news_app/features/home/presentation/model/book_marked_post.dart';

part 'category_news_state.dart';

class CategoryNewsCubit extends Cubit<NewsState> with RefreshOnReconnect {
  CategoryNewsCubit(this.getNews, this._connectionCubit) : super(NewsState()) {
    reconnect(_connectionCubit, () {
      init();
    });
  }
  final GetNewsByCategory getNews;
  final AppConnectionCubit _connectionCubit;

  Future<void> init() async {
    await callNewsCategory(EndPoints.defaultCategory);
  }

  Future<void> callNewsCategory(
    String category,
  ) async {
    if (isClosed) return;
    emit(state.copyWith(
      categoryStatus: NewsStatus.loading,
      selectedCategory: category,
    ));
    final response = await getNews.call(
      params: NewsCategoryParams(category: category),
    );

    response.when(
      success: (posts) {
        if (!isClosed) {
          emit(
            state.copyWith(
              categoryStatus: NewsStatus.loaded,
              categoryNews: posts,
            ),
          );
        }
      },
      failure: (errorMessage) {
        if (!isClosed) {
          emit(
            state.copyWith(
              categoryStatus: NewsStatus.error,
              errorMessage: errorMessage.message,
            ),
          );
        }
      },
    );
  }

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

  @override
  Future<void> close() {
    disposeReconnect();
    return super.close();
  }
}
