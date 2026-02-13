import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/core/shared/domain/entities/post_entitiy.dart';
import 'package:news_app/features/home/presentation/model/book_marked_post.dart';

part 'book_marks_state.dart';

class BookMarksCubit extends Cubit<BookMarksState> {
  BookMarksCubit() : super(BookMarksState());

  void toggleBookmark({required PostEntity post, String? category}) {
    final currentBookmarks = List<BookmarkedPost>.from(state.bookmarks);
    final index = currentBookmarks.indexWhere(
      (bookmark) => bookmark.post.id == post.id,
    );

    if (index != -1) {
      currentBookmarks.removeAt(index);
    } else {
      currentBookmarks
          .add(BookmarkedPost(post: post, category: category ?? ''));
    }

    emit(state.copyWith(bookmarks: currentBookmarks));
  }
}
