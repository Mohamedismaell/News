class FacebookModel {
  final int? likes;
  final int? comments;
  final int? shares;

  FacebookModel({
    required this.likes,
    required this.comments,
    required this.shares,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'likes': likes,
      'comments': comments,
      'shares': shares,
    };
  }

  factory FacebookModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return FacebookModel(
      likes: json['likes'] != null
          ? json['likes'] as int
          : null,
      comments: json['comments'] != null
          ? json['comments'] as int
          : null,
      shares: json['shares'] != null
          ? json['shares'] as int
          : null,
    );
  }
}
