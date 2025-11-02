part of 'news_cubit.dart';

@immutable
class NewsState {
  final String selectedCategory;
  final NewsStatus categoryStatus;
  final NewsStatus dateStatus;
  final List<PostEntity>? newsByCategory;
  final List<PostEntity>? newsByDate;
  final String? errorMessage;

  const NewsState({
    this.selectedCategory = 'Politics',
    this.categoryStatus = NewsStatus.initial,
    this.dateStatus = NewsStatus.initial,
    this.newsByCategory,
    this.newsByDate,
    this.errorMessage,
  });

  NewsState copyWith({
    String? selectedCategory,
    NewsStatus? categoryStatus,
    NewsStatus? dateStatus,
    List<PostEntity>? newsByCategory,
    List<PostEntity>? newsByDate,
    String? errorMessage,
  }) {
    return NewsState(
      selectedCategory:
          selectedCategory ?? this.selectedCategory,
      categoryStatus: categoryStatus ?? this.categoryStatus,
      dateStatus: dateStatus ?? this.dateStatus,
      newsByCategory: newsByCategory ?? this.newsByCategory,
      newsByDate: newsByDate ?? this.newsByDate,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

enum NewsStatus { initial, loading, loaded, error }
