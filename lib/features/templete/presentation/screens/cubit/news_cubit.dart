import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:news_app/core/database/api/end_points.dart';
import 'package:news_app/core/params/params.dart';
import 'package:news_app/features/templete/domain/usecases/get_news.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../domain/entities/post_entitiy.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit(this.getNews) : super(NewsState()) {
    init();
  }

  final GetNewsByCategory getNews;
  Future<void> eitherFailureOrSuccess(
    String category,
  ) async {
    emit(state.copyWith(status: NewsStatus.loading));
    final response = await getNews.call(
      params: NewsParams(category: category),
    );
    response.when(
      success: (newsApi) => emit(
        state.copyWith(
          status: NewsStatus.loaded,
          news: newsApi,
        ),
      ),
      failure: (errorMessage) => emit(
        state.copyWith(
          status: NewsStatus.error,
          errorMessage: errorMessage.toString(),
        ),
      ),
    );
  }

  Future<void> init() async {
    await eitherFailureOrSuccess(EndPoints.defaultCategory);
  }

  void selectCategory(String category) {
    if (state.selectedCategory == category) return;
    emit(state.copyWith(selectedCategory: category));
    eitherFailureOrSuccess(category);
  }

  Color activeCategoryButoon(String category) {
    return state.selectedCategory == category
        ? const Color(0xFF465AD6)
        : AppColors.white;
  }
}
