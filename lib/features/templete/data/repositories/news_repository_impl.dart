import 'package:news_app/core/connections/result.dart';
import 'package:news_app/features/templete/domain/entities/post_entitiy.dart';
import '../../../../core/connections/network_info.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../../domain/repositories/news_repository.dart';
import '../datasources/news_remote_data_source.dart';
// import '../models/news_model.dart';

class NewsRepositoryImpl extends NewsRepository {
  final NetworkInfo networkInfo;
  final NewsRemoteDataSource remoteDataSource;
  NewsRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });
  //!Filtered Posts with Category
  @override
  Future<Result<List<PostEntity>>> getNewsByCategory({
    required NewsParams params,
  }) async {
    try {
      final remoteNews = await remoteDataSource
          .getNewsByCategory(params);
      //! Try Filter
      print(remoteNews.posts);
      return Result.ok(remoteNews.posts ?? []);
    } on ServerExceptions catch (e) {
      return Result.error(
        Failure(errMessage: e.errorModel.errorMessage),
      );
    }
  }
}
