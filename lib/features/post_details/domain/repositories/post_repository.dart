import 'package:news_app/core/helper/result.dart';
import 'package:news_app/core/shared/domain/entities/post_entitiy.dart';
import 'package:news_app/core/shared/params/news_category_params.dart';

abstract class PostRepository {
  Future<Result<PostEntity>> getSpecificPost({
    required NewsCategoryParams params,
  });
}
