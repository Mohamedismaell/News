import 'package:news_app/features/templete/data/models/sub_models/posts_model.dart';

class NewsModel {
  final List<PostsModel>? posts;

  NewsModel({
    required this.posts,

    //!Base response Latter
    // required super.totalResults,
    // required super.moreResultsAvailable,
    // required super.next,
    // required super.requestsLeft,
    // required super.warnings,
  });
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'posts': posts!.map((post) => post.toJson()).toList(),
    };
  }

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      posts: json['posts'] != null
          ? List<PostsModel>.from(
              (json['posts'] as List<dynamic>)
                  .map<PostsModel?>(
                    (post) => PostsModel.fromJson(
                      post as Map<String, dynamic>,
                    ),
                  ),
            )
          : null,

      //!Base response Latter
      // totalResults: json['totalResults'] != null
      //     ? json['totalResults'] as int
      //     : null,
      // moreResultsAvailable:
      //     json['moreResultsAvailable'] != null
      //     ? json['moreResultsAvailable'] as int
      //     : null,
      // next: json['next'] != null
      //     ? json['next'] as String
      //     : null,
      // requestsLeft: json['requestsLeft'] != null
      //     ? json['requestsLeft'] as int
      //     : null,
      // warnings: json['warnings'] != null
      //     ? json['warnings'] as int
      //     : 0,
    );
  }

  copyWith({required List<PostsModel> posts}) {}
}
