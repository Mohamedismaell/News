import 'package:clean_arch/features/template/data/datasources/temp_local_data_source.dart';
import 'package:clean_arch/features/template/data/datasources/temp_remote_data_source.dart';
import 'package:clean_arch/features/template/domain/repositories/temp_repository.dart';

class TemplateRepositoryImpl extends TemplateRepository {
  // final NetworkInfo networkInfo;
  final TemplateRemoteDataSource remoteDataSource;
  final TemplateLocalDataSource localDataSource;
  TemplateRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    // required this.networkInfo,
  });

  //!Posts with Category

  // @override
  // Future<Result<List<PostEntity>>> getNewsByCategory({
  //   required NewsCategoryParams params,
  // }) async {
  //   try {
  //     final remoteNews = await remoteDataSource.getNewsByCategory(params);

  //     await localDataSource.saveCategoryNews(params.category, remoteNews);

  //     final articles = remoteNews.articles
  //         .map((article) => ArticleMapper.toEntity(article))
  //         .toList();

  //     return Result.ok(articles);
  //   } on DioException catch (e) {
  //     final cached = localDataSource.getCategoryNews(params.category);
  //     if (cached != null) {
  //       final articles = cached.articles
  //           .map((article) => ArticleMapper.toEntity(article))
  //           .toList();

  //       return Result.ok(articles);
  //     }
  //     return Result.error(
  //       ApiErrorMapper.fromDioException(e),
  //     );
  //   } catch (e) {
  //     return Result.error(const UnknownFailure());
  //   }
  // }
}
