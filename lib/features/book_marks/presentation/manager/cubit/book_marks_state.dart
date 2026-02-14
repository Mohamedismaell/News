// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'book_marks_cubit.dart';

@immutable
class BookMarksState extends Equatable {
  final List<BookmarkedPost> bookmarks;
  const BookMarksState({this.bookmarks = const []});

  BookMarksState copyWith({
    List<BookmarkedPost>? bookmarks,
  }) {
    return BookMarksState(
      bookmarks: bookmarks ?? this.bookmarks,
    );
  }

  bool isBookmarked(String postId) {
    return bookmarks.any((markedPost) => markedPost.post.id == postId);
  }

  @override
  List<Object?> get props => [bookmarks];
}
