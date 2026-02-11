import 'package:dio/dio.dart';
import 'package:news_app/core/database/api/api_error_mapper.dart';
import 'package:news_app/core/errors/failure.dart/failure.dart';
import 'package:news_app/core/helper/result.dart';
import 'package:news_app/core/shared/domain/entities/post_entitiy.dart';
import 'package:news_app/core/shared/params/news_category_params.dart';
import 'package:news_app/core/shared/data/mappers/article_mapper.dart';
import 'package:news_app/features/post_details/data/datasources/post_local_data_source.dart';
import 'package:news_app/features/post_details/data/datasources/post_remote_data_source.dart';
import 'package:news_app/features/post_details/domain/repositories/post_repository.dart';

class PostRepositoryImpl extends PostRepository {
  // final NetworkInfo networkInfo;
  final PostRemoteDataSource remoteDataSource;
  final PostLocalDataSource localDataSource;
  PostRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    // required this.networkInfo,
  });
  //!Filtered Posts with Category\

  @override
  Future<Result<PostEntity>> getSpecificPost({
    required NewsCategoryParams params,
  }) async {
    try {
      final remoteNews = await remoteDataSource.getSpecificPost(params);

      final articles = remoteNews.articles
          .map((article) => ArticleMapper.toEntity(article))
          .toList();

      return Result.ok(articles.first);
    } on DioException catch (e) {
      return Result.error(
        ApiErrorMapper.fromDioException(e),
      );
    } catch (e) {
      return Result.error(const UnknownFailure());
    }
  }
}
