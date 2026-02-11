import 'package:news_app/core/shared/params/news_category_params.dart';
import 'package:news_app/features/home/domain/entities/post_entitiy.dart';

import '../../../../core/helper/result.dart';

abstract class PostRepository {
  Future<Result<PostEntity>> getSpecificPost({
    required NewsCategoryParams params,
  });
}
