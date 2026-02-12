import 'package:hive_ce_flutter/adapters.dart';
import 'package:news_app/core/database/api/dio_consumer.dart';
import 'package:news_app/core/shared/data/datasources/news_local_data_source.dart';
import 'package:news_app/core/shared/data/datasources/news_remote_data_source.dart';
import 'package:news_app/core/shared/data/models/news_response_dto.dart';
import 'package:news_app/core/shared/domain/repositories/news_repository.dart';
import 'package:news_app/core/shared/domain/usecases/get_news.dart';
import 'package:news_app/core/shared/injection/service_locator.dart';
import 'package:news_app/core/shared/manager/connection_cubit/connection_cubit.dart';
import 'package:news_app/features/home/data/datasources/home_local_data_source.dart';
import 'package:news_app/features/home/data/datasources/home_remote_data_source.dart';
import 'package:news_app/features/home/data/repositories/home_repository_impl.dart';
import 'package:news_app/features/home/domain/repositories/home_repository.dart';
import 'package:news_app/features/home/domain/usecases/get_top_head_lines.dart';
import 'package:news_app/features/home/domain/usecases/search_category.dart';
import 'package:news_app/features/home/presentation/cubit/news/category_news_cubit.dart';
import 'package:news_app/features/home/presentation/cubit/search/search_cubit.dart';
import 'package:news_app/features/home/presentation/cubit/top_head_lines.dart/top_head_lines_cubit.dart';

class HomeDi {
  HomeDi._();

  static void init(
    Box<NewsResponseDto> newsBox,
  ) {
    //! Data Sources
    sl.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSource(api: sl<DioConsumer>()),
    );
    sl.registerLazySingleton<HomeLocalDataSource>(
      () => HomeLocalDataSource(newsBox: newsBox),
    );
    //! Repositories
    sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(
        remoteDataSource: sl<HomeRemoteDataSource>(),
        localDataSource: sl<HomeLocalDataSource>(),
      ),
    );

    sl.registerLazySingleton(
      () => GetTopHeadLines(repository: sl<HomeRepository>()),
    );
    sl.registerLazySingleton(
      () => SearchUseCase(repository: sl<NewsRepository>()),
    );

    //! Cubits
    sl.registerLazySingleton(
      () => CategoryNewsCubit(
        sl<GetNewsByCategory>(),
        sl<AppConnectionCubit>(),
      ),
    );
    sl.registerLazySingleton(
      () => TopHeadLinesCubit(
        sl<GetTopHeadLines>(),
        sl<AppConnectionCubit>(),
      ),
    );
    sl.registerLazySingleton(
      () => SearchCubit(
        sl<SearchUseCase>(),
        sl<AppConnectionCubit>(),
      ),
    );
  }
}
