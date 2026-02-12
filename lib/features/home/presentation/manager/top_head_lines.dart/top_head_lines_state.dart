part of 'top_head_lines_cubit.dart';

@immutable
class TopHeadLinesState extends Equatable {
  final NewsStatus topNewsStatus;

  final List<PostEntity> topHeadLines;
  final List<BookmarkedPost>? bookmarks;
  final String? errorMessage;
  const TopHeadLinesState({
    this.topNewsStatus = NewsStatus.loading,
    this.topHeadLines = const [],
    this.errorMessage,
    this.bookmarks,
  });

  TopHeadLinesState copyWith({
    NewsStatus? topNewsStatus,
    List<PostEntity>? topHeadLines,
    List<BookmarkedPost>? bookmarks,
    String? errorMessage,
  }) {
    return TopHeadLinesState(
      topNewsStatus: topNewsStatus ?? this.topNewsStatus,
      topHeadLines: topHeadLines ?? this.topHeadLines,
      bookmarks: bookmarks ?? this.bookmarks,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  bool isBookmarked(String postId) {
    return bookmarks?.any((markedPost) => markedPost.post.id == postId) ??
        false;
  }

  @override
  List<Object?> get props =>
      [topNewsStatus, topHeadLines, bookmarks, errorMessage];
}
