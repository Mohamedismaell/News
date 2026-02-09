import 'package:news_app/core/helper/result.dart';
import 'package:news_app/features/get_news/domain/entities/post_entitiy.dart';
import 'package:news_app/features/get_news/domain/repositories/news_repository.dart';

class GetTopHeadLines {
  final NewsRepository repository;

  GetTopHeadLines({required this.repository});

  Future<Result<List<PostEntity>>> callTopHeadLines() {
    return repository.getTopHeadLines();
  }
}
