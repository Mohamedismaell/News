import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/database/api/end_points.dart';
import 'package:news_app/core/enums/stats.dart';
import 'package:news_app/core/params/news_category_params.dart';
import 'package:news_app/features/get_news/domain/usecases/get_news.dart';
import 'package:news_app/features/get_news/domain/usecases/get_specific_post_usecase.dart';
import 'package:news_app/features/get_news/domain/usecases/get_top_head_lines.dart';

import '../../../domain/entities/post_entitiy.dart';
import '../../model/book_marked_post.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit(this.getNews, this.getTopHeadLines) : super(NewsState()) {
    init();
  }
  final GetNewsByCategory getNews;
  final GetTopHeadLines getTopHeadLines;

  Future<void> init() async {
    await callNewsCategory(EndPoints.defaultCategory);
    await callTopHeadLines();
  }

  Future<void> callNewsCategory(
    String category,
  ) async {
    emit(state.copyWith(
      categoryStatus: NewsStatus.loading,
      selectedCategory: category,
    ));
    final response = await getNews.callNewsCategory(
      params: NewsCategoryParams(category: category),
    );

    response.when(
      success: (posts) {
        emit(
          state.copyWith(
            categoryStatus: NewsStatus.loaded,
            categoryNews: posts,
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

  Future<void> callTopHeadLines() async {
    final response = await getTopHeadLines.callTopHeadLines();
    return response.when(
      success: (posts) {
        emit(
          state.copyWith(
            dateStatus: NewsStatus.loaded,
            topHeadLines: posts,
          ),
        );
      },
      failure: (errorMessage) {
        emit(
          state.copyWith(
            dateStatus: NewsStatus.error,
            errorMessage: errorMessage.message,
          ),
        );
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
}
