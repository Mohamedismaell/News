import 'package:news_app/features/templete/data/models/sub_models/entities_model.dart';
import 'package:news_app/features/templete/data/models/sub_models/thread_model.dart';

import '../../../domain/entities/post_entitiy.dart';

class PostsModel extends PostEntity {
  final ThreadModel? thread;
  final String? uuid;
  final String? url;
  final int? ordInThread;
  final String? parentUrl;
  final String? published;
  final String? title;
  final String? text;
  final String? highlightText;
  final String? highlightTitle;
  final String? highlightThreadTitle;
  final String? language;
  final String? sentiment;
  final List<String>? externalLinks;
  final List<String>? externalImages;
  final EntitiesModel? entities;
  final dynamic rating;
  final String? crawled;
  final String? updated;

  PostsModel({
    required this.thread,
    required this.uuid,
    required this.url,
    required this.ordInThread,
    required this.parentUrl,

    required this.published,
    required this.title,
    required this.text,
    required this.highlightText,
    required this.highlightTitle,
    required this.highlightThreadTitle,
    required this.language,
    required this.sentiment,
    required this.externalLinks,
    required this.externalImages,
    required this.entities,
    required this.rating,
    required this.crawled,
    required this.updated,
    required super.id,
    required super.thereadurl,
    required super.threadtitle,
    required super.threadimageUrl,
    required super.author,
    required super.categories,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'thread': thread?.toJson(),
      'uuid': uuid,
      'url': url,
      'ordInThread': ordInThread,
      'parentUrl': parentUrl,
      'author': author,
      'published': published,
      'title': title,
      'text': text,
      'highlightText': highlightText,
      'highlightTitle': highlightTitle,
      'highlightThreadTitle': highlightThreadTitle,
      'language': language,
      'sentiment': sentiment,
      'categories': categories,
      'externalLinks': externalLinks,
      'externalImages': externalImages,
      'entities': entities?.toJson(),
      'rating': rating,
      'crawled': crawled,
      'updated': updated,
    };
  }

  factory PostsModel.fromJson(Map<String, dynamic> json) {
    return PostsModel(
      thread: json['thread'] != null
          ? ThreadModel.fromJson(
              json['thread'] as Map<String, dynamic>,
            )
          : null,
      uuid: json['uuid'] != null
          ? json['uuid'] as String
          : null,
      url: json['url'] != null
          ? json['url'] as String
          : null,
      ordInThread: json['ordInThread'] != null
          ? json['ordInThread'] as int
          : null,
      parentUrl: json['parentUrl'] != null
          ? json['parentUrl'] as String
          : null,
      published: json['published'] != null
          ? json['published'] as String
          : null,
      title: json['title'] != null
          ? json['title'] as String
          : null,
      text: json['text'] != null
          ? json['text'] as String
          : null,
      highlightText: json['highlightText'] != null
          ? json['highlightText'] as String
          : null,
      highlightTitle: json['highlightTitle'] != null
          ? json['highlightTitle'] as String
          : null,
      highlightThreadTitle:
          json['highlightThreadTitle'] != null
          ? json['highlightThreadTitle'] as String
          : null,
      language: json['language'] != null
          ? json['language'] as String
          : null,
      sentiment: json['sentiment'] != null
          ? json['sentiment'] as String
          : null,
      externalLinks: json['externalLinks'] != null
          ? List<String>.from(
              (json['externalLinks'] as List<String>),
            )
          : null,
      externalImages: json['externalImages'] != null
          ? List<String>.from(
              (json['externalImages'] as List<String>),
            )
          : null,
      entities: json['entities'] != null
          ? EntitiesModel.fromJson(
              json['entities'] as Map<String, dynamic>,
            )
          : null,
      rating: json['rating'] as dynamic,
      crawled: json['crawled'] != null
          ? json['crawled'] as String
          : null,
      updated: json['updated'] != null
          ? json['updated'] as String
          : null,
      id: json['thread']['uuid'] != null
          ? json['uuid'] as String
          : '',
      author: json['author'] != null
          ? json['author'] as String
          : '',
      thereadurl: json['url'] != null
          ? json['url'] as String
          : '',
      threadtitle: json['thread']['title'] != null
          ? json['title'] as String
          : '',
      threadimageUrl:
          json['thread']?['main_image'] as String? ?? '',
      categories: json['categories'] != null
          ? List<String>.from(
              json['categories'] as List<dynamic>,
            )
          : [],
    );
  }
}
