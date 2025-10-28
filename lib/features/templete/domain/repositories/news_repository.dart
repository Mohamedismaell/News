import '../../../../core/connections/result.dart';
import '../../../../core/params/params.dart';
import '../entities/post_entitiy.dart';

abstract class NewsRepository {
  Future<Result<List<PostEntity>>> getNewsByCategory({
    required NewsParams params,
  });
}
