import 'package:dio/dio.dart';
import 'package:news_app/core/database/api/api_error_mapper.dart';
import 'package:news_app/core/errors/failure.dart/failure.dart';
import 'package:news_app/core/helper/result.dart';
import 'package:news_app/core/shared/data/mappers/article_mapper.dart';
import 'package:news_app/core/shared/domain/entities/post_entitiy.dart';
import 'package:news_app/features/home/data/datasources/home_local_data_source.dart';
import 'package:news_app/features/home/data/datasources/home_remote_data_source.dart';
import 'package:news_app/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  // final NetworkInfo networkInfo;
  final HomeRemoteDataSource remoteDataSource;
  final HomeLocalDataSource localDataSource;
  HomeRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    // required this.networkInfo,
  });

  @override
  Future<Result<List<PostEntity>>> getTopHeadLines() async {
    try {
      final remoteNews = await remoteDataSource.getTopHeadLines();
      await localDataSource.saveTopHeadlinesNews(remoteNews);
      final articles = remoteNews.articles
          .map((article) => ArticleMapper.toEntity(article))
          .toList();

      return Result.ok(articles);
    } on DioException catch (e) {
      final cached = localDataSource.getTopHeadlinesNews();

      if (cached != null) {
        final articles = cached.articles
            .map((article) => ArticleMapper.toEntity(article))
            .toList();

        return Result.ok(articles);
      }

      return Result.error(
        ApiErrorMapper.fromDioException(e),
      );
    } catch (e) {
      return Result.error(const UnknownFailure());
    }
  }
}
