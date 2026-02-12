import 'package:news_app/core/helper/result.dart';
import 'package:news_app/core/shared/domain/entities/post_entitiy.dart';

abstract class HomeRepository {
  Future<Result<List<PostEntity>>> getTopHeadLines();
}
