import 'package:news_app/core/connections/result.dart';
import '../../../../core/params/params.dart';
import '../entities/post_entitiy.dart';
import '../repositories/news_repository.dart';

class GetNewsByCategory {
  final NewsRepository repository;

  GetNewsByCategory({required this.repository});

  Future<Result<List<PostEntity>>> call({
    required NewsParams params,
  }) {
    return repository.getNewsByCategory(params: params);
  }
}
