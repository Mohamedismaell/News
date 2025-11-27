import '../../domain/entities/post_entitiy.dart';

class BookmarkedPost {
  final PostEntity post;
  final String? category;
  // final DateTime bookmarkedAt;

  const BookmarkedPost({
    required this.post,
    required this.category,
    // required this.bookmarkedAt,
  });

  Map<String, dynamic> toJson() => {
        'post': post,
        'category': category,
        // 'bookmarkedAt': bookmarkedAt.toIso8601String(),
      };

  factory BookmarkedPost.fromJson(
      Map<String, dynamic> json) {
    return BookmarkedPost(
      post: json['post'] as PostEntity,
      category: json['category'] as String?,
      // bookmarkedAt:
      // DateTime.parse(json['bookmarkedAt'] as String),
    );
  }
}
