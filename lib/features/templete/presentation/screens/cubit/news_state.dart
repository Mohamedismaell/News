part of 'news_cubit.dart';

@immutable
class NewsState {
  final String selectedCategory;
  final NewsStatus status;
  final List<PostEntity>? news;
  final String? errorMessage;

  const NewsState({
    this.selectedCategory = 'Politics',
    this.status = NewsStatus.initial,
    this.errorMessage,
    this.news = const [],
  });

  NewsState copyWith({
    String? selectedCategory,

    NewsStatus? status,
    List<PostEntity>? news,
    String? errorMessage,
  }) {
    return NewsState(
      selectedCategory:
          selectedCategory ?? this.selectedCategory,
      status: status ?? this.status,
      news: news ?? this.news,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

enum NewsStatus { initial, loading, loaded, error }
//  final String id;
//   final String thereadurl;
//   final String threadtitle;
//   final String threadimageUrl;
//   final String categories;