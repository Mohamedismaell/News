import 'package:dio/dio.dart';
import 'package:news_app/core/database/api/api_error_mapper.dart';
import 'package:news_app/core/errors/failure.dart';
import 'package:news_app/core/helper/result.dart';
import 'package:news_app/core/params/news_category_params.dart';
import 'package:news_app/features/get_news/data/datasources/news_remote_data_source.dart';
import 'package:news_app/features/get_news/data/mappers/article_mapper.dart';
import 'package:news_app/features/get_news/domain/entities/post_entitiy.dart';
import 'package:news_app/features/get_news/domain/repositories/news_repository.dart';

class NewsRepositoryImpl extends NewsRepository {
  // final NetworkInfo networkInfo;
  final NewsRemoteDataSource remoteDataSource;
  NewsRepositoryImpl({
    required this.remoteDataSource,
    // required this.networkInfo,
  });
  //!Filtered Posts with Category\

  @override
  Future<Result<List<PostEntity>>> getNewsByCategory({
    required NewsCategoryParams params,
  }) async {
    try {
      // await Future.delayed(Duration(seconds: 20));
      final remoteNews = await remoteDataSource.getNewsByCategory(params);

      final articles = remoteNews.articles
          .map((article) => ArticleMapper.toEntity(article))
          .toList();

      return Result.ok(articles);
    } on DioException catch (e) {
      return Result.error(
        ApiErrorMapper.fromDioException(e),
      );
    } catch (e) {
      return Result.error(const UnknownFailure());
    }
  }

  @override
  Future<Result<List<PostEntity>>> getTopHeadLines() async {
    try {
      final remoteNews = await remoteDataSource.getTopHeadLines();

      final articles = remoteNews.articles
          .map((article) => ArticleMapper.toEntity(article))
          .toList();

      return Result.ok(articles);
    } on DioException catch (e) {
      return Result.error(
        ApiErrorMapper.fromDioException(e),
      );
    } catch (e) {
      return Result.error(const UnknownFailure());
    }
  }

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
