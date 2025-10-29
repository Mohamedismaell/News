part of 'news_cubit.dart';

@immutable
class NewsState {
  final String selectedCategory;
  final NewsStatus status;
  final List<PostEntity>? validatedNews;
  final List<PostEntity>? newsByDate;
  final String? errorMessage;

  const NewsState({
    this.validatedNews,
    this.selectedCategory = 'Politics',
    this.status = NewsStatus.initial,
    this.errorMessage,
    this.newsByDate = const [],
  });

  NewsState copyWith({
    String? selectedCategory,
    NewsStatus? status,
    List<PostEntity>? validatedNews,
    String? errorMessage,
  }) {
    return NewsState(
      selectedCategory:
          selectedCategory ?? this.selectedCategory,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      validatedNews: validatedNews ?? this.validatedNews,
    );
  }
}

enum NewsStatus { initial, loading, loaded, error }
//  final String id;
//   final String thereadurl;
//   final String threadtitle;
//   final String threadimageUrl;
//   final String categories;