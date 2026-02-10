import 'package:news_app/core/database/api/dio_consumer.dart';
import 'package:news_app/core/injection/service_locator.dart';
import 'package:news_app/core/manager/connection_cubit/connection_cubit.dart';
import 'package:news_app/features/get_news/data/datasources/news_remote_data_source.dart';
import 'package:news_app/features/get_news/data/repositories/news_repository_impl.dart';
import 'package:news_app/features/get_news/domain/repositories/news_repository.dart';
import 'package:news_app/features/get_news/domain/usecases/get_news.dart';
import 'package:news_app/features/get_news/domain/usecases/get_specific_post_usecase.dart';
import 'package:news_app/features/get_news/domain/usecases/get_top_head_lines.dart';
import 'package:news_app/features/get_news/presentation/cubit/news/news_cubit.dart';
import 'package:news_app/features/get_news/presentation/cubit/post_/post_details_cubit.dart';

class HomeDi {
  HomeDi._();

  static void init() {
    //! Data Sources
    sl.registerLazySingleton<NewsRemoteDataSource>(
      () => NewsRemoteDataSource(api: sl<DioConsumer>()),
    );

    //! Repositories
    sl.registerLazySingleton<NewsRepository>(
      () => NewsRepositoryImpl(
        remoteDataSource: sl<NewsRemoteDataSource>(),
        // networkInfo: sl<NetworkInfo>(),
      ),
    );

    //! Use Cases
    sl.registerLazySingleton(
      () => GetNewsByCategory(repository: sl<NewsRepository>()),
    );
    sl.registerLazySingleton(
      () => GetTopHeadLines(repository: sl<NewsRepository>()),
    );
    sl.registerLazySingleton(
      () => GetSpecificPost(repository: sl<NewsRepository>()),
    );

    //! Cubits
    sl.registerLazySingleton(
      () => NewsCubit(
        sl<GetNewsByCategory>(),
        sl<GetTopHeadLines>(),
        sl<AppConnectionCubit>(),
      ),
    );
    sl.registerLazySingleton(
      () => PostDetailsCubit(
        sl<GetSpecificPost>(),
      ),
    );
  }
}
