import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/features/templete/data/datasources/news_remote_data_source.dart';
import 'package:news_app/features/templete/data/repositories/news_repository_impl.dart';
import 'package:news_app/features/templete/domain/usecases/get_news.dart';

import '../../features/templete/domain/repositories/news_repository.dart';
import '../../features/templete/presentation/cubit/news/news_cubit.dart';
import '../connections/network_info.dart';
import '../database/api/dio_consumer.dart';
import '../database/cache/cache_helper.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  //! Core
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(
    () => DioConsumer(dio: sl<Dio>()),
  );
  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      connectionChecker: sl<DataConnectionChecker>(),
    ),
  );
  sl.registerLazySingleton(() => CacheHelper());

  //! Data Sources
  sl.registerLazySingleton<NewsRemoteDataSource>(
    () => NewsRemoteDataSource(api: sl<DioConsumer>()),
  );

  //! Repositories
  sl.registerLazySingleton<NewsRepository>(
    () => NewsRepositoryImpl(
      remoteDataSource: sl<NewsRemoteDataSource>(),
      networkInfo: sl<NetworkInfo>(),
    ),
  );

  //! Use Cases
  sl.registerLazySingleton(
    () =>
        GetNewsByCategory(repository: sl<NewsRepository>()),
  );

  //! Cubits
  sl.registerFactory(
    () => NewsCubit(sl<GetNewsByCategory>()),
  );
}
