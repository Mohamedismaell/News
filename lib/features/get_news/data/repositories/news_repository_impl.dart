import 'package:news_app/core/utils/result.dart';
import 'package:news_app/core/params/news_category_params.dart';
import 'package:news_app/features/get_news/domain/entities/post_entitiy.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/repositories/news_repository.dart';
import '../datasources/news_remote_data_source.dart';

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
      return Result.ok(remoteNews.posts ?? []);
    } on ServerExceptions catch (e) {
      return Result.error(
        Failure(errMessage: e.errorModel.errorMessage),
      );
    }
  }

  @override
  Future<Result<List<PostEntity>>> getNewsByDate() async {
    try {
      // await Future.delayed(Duration(seconds: 20));
      final remoteNews = await remoteDataSource.getNewsByDate();
      // debugPrint(
      //   'remoteNews from data source: $remoteNews',
      // );
      // debugPrint('remoteNews.posts: ${remoteNews?.posts}');
      return Result.ok(remoteNews.posts ?? []);
    } on ServerExceptions catch (e) {
      return Result.error(
        Failure(errMessage: e.errorModel.errorMessage),
      );
    }
  }
}
