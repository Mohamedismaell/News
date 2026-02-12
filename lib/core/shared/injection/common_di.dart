import 'package:dio/dio.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:news_app/core/connection/network_info.dart';
import 'package:news_app/core/connection/retry_queue.dart';
import 'package:news_app/core/connection/retry_runner.dart';
import 'package:news_app/core/database/api/api_interceptor.dart';
import 'package:news_app/core/database/api/dio_consumer.dart';
import 'package:news_app/core/database/cache/cache_helper.dart';
import 'package:news_app/core/shared/data/datasources/news_local_data_source.dart';
import 'package:news_app/core/shared/data/datasources/news_remote_data_source.dart';
import 'package:news_app/core/shared/data/models/news_response_dto.dart';
import 'package:news_app/core/shared/data/repositories/news_repository_impl.dart';
import 'package:news_app/core/shared/domain/repositories/news_repository.dart';
import 'package:news_app/core/shared/domain/usecases/get_news.dart';
import 'package:news_app/core/shared/injection/service_locator.dart';
import 'package:news_app/core/shared/presentation/manager/connection_cubit/connection_cubit.dart';
import 'package:news_app/core/shared/presentation/manager/theme_cubit/theme_cubit.dart';

CacheHelper get cacheHelper => sl<CacheHelper>();

class CommonDi {
  CommonDi._();

  static Future<void> init(
    Box<NewsResponseDto> newsBox,
  ) async {
    sl.registerLazySingleton(() => ThemeCubit());
    sl.registerLazySingleton(() => Dio());
    sl.registerLazySingleton(() => InternetConnection());

    //! Core
    sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(sl<InternetConnection>()),
    );
    sl.registerLazySingleton(() => RetryQueue());
    sl.registerLazySingleton(() => RetryRunner(sl<Dio>(), sl<RetryQueue>()));

    sl.registerLazySingleton(
        () => ApiInterceptor(sl<NetworkInfo>(), sl<RetryQueue>()));
    sl.registerLazySingleton(
        () => DioConsumer(sl<Dio>(), sl<ApiInterceptor>()));
    //! connection

    // //! Validators
    // sl.registerLazySingleton(() => FormValidators());
    // sl.registerLazySingleton(() => UserValidation());
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
    ); //! Use Cases
    sl.registerLazySingleton(
      () => GetNewsByCategory(repository: sl<NewsRepository>()),
    );
    //! Local Storage
    final cacheHelper = CacheHelper();
    await cacheHelper.init();
    sl.registerSingleton<CacheHelper>(cacheHelper);

    //!Cubits
    sl.registerLazySingleton(
        () => AppConnectionCubit(sl<InternetConnection>(), sl<RetryRunner>()));
  }
}
