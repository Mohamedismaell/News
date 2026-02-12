import 'package:news_app/core/helper/result.dart';
import 'package:news_app/core/shared/domain/entities/post_entitiy.dart';
import 'package:news_app/features/home/domain/repositories/home_repository.dart';

class GetTopHeadLines {
  final HomeRepository repository;

  GetTopHeadLines({required this.repository});

  Future<Result<List<PostEntity>>> call() {
    return repository.getTopHeadLines();
  }
}
