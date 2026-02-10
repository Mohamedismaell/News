// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hive_ce_flutter/adapters.dart';

import 'articled_dto.dart';

part 'news_response_dto.g.dart';

@HiveType(typeId: 0)
class NewsResponseDto extends Equatable {
  @HiveField(0)
  final String status;
  @HiveField(1)
  final int totalResults;
  @HiveField(2)
  final List<ArticleDto> articles;

  const NewsResponseDto({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  @override
  List<Object> get props => [status, totalResults, articles];

  NewsResponseDto copyWith({
    String? status,
    int? totalResults,
    List<ArticleDto>? articles,
  }) {
    return NewsResponseDto(
      status: status ?? this.status,
      totalResults: totalResults ?? this.totalResults,
      articles: articles ?? this.articles,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'totalResults': totalResults,
      'articles': articles.map((x) => x.toMap()).toList(),
    };
  }

  //! ['articles'] as List<int> ===> check
  factory NewsResponseDto.fromJsonMap(Map<String, dynamic> map) {
    return NewsResponseDto(
      status: map['status'] as String,
      totalResults: map['totalResults'] as int,
      articles: List<ArticleDto>.from(
        (map['articles'] as List).map<ArticleDto>(
          (x) => ArticleDto.fromJsonMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsResponseDto.fromJsonString(String source) =>
      NewsResponseDto.fromJsonMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
