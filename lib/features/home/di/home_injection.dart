import 'package:hive_ce_flutter/adapters.dart';
import 'package:news_app/core/database/api/dio_consumer.dart';
import 'package:news_app/core/shared/data/models/news_response_dto.dart';
import 'package:news_app/core/shared/injection/service_locator.dart';
import 'package:news_app/core/shared/manager/connection_cubit/connection_cubit.dart';
import 'package:news_app/features/home/data/datasources/news_local_data_source.dart';
import 'package:news_app/features/home/data/datasources/news_remote_data_source.dart';
import 'package:news_app/features/home/data/repositories/news_repository_impl.dart';
import 'package:news_app/features/home/domain/repositories/news_repository.dart';
import 'package:news_app/features/home/domain/usecases/get_news.dart';
import 'package:news_app/features/home/domain/usecases/get_top_head_lines.dart';
import 'package:news_app/features/home/presentation/cubit/news/news_cubit.dart';

class HomeDi {
  HomeDi._();

  static void init(
    Box<NewsResponseDto> newsBox,
  ) {
    //! Data Sources
    sl.registerLazySingleton<NewsRemoteDataSource>(
      () => NewsRemoteDataSource(api: sl<DioConsumer>()),
    );
    sl.registerLazySingleton<NewsLocalDataSource>(
      () => NewsLocalDataSource(newsBox: newsBox),
    );
    //! Repositories
    sl.registerLazySingleton<NewsRepository>(
      () => NewsRepositoryImpl(
        remoteDataSource: sl<NewsRemoteDataSource>(),
        localDataSource: sl<NewsLocalDataSource>(),
      ),
    );

    //! Use Cases
    sl.registerLazySingleton(
      () => GetNewsByCategory(repository: sl<NewsRepository>()),
    );
    sl.registerLazySingleton(
      () => GetTopHeadLines(repository: sl<NewsRepository>()),
    );

    //! Cubits
    sl.registerLazySingleton(
      () => NewsCubit(
        sl<GetNewsByCategory>(),
        sl<GetTopHeadLines>(),
        sl<AppConnectionCubit>(),
      ),
    );
  }
}
