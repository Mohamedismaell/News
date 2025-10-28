import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

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
  sl.registerLazySingleton(() => CacheHelper());
  sl.registerLazySingleton(
    () => NetworkInfoImpl(
      connectionChecker: sl<DataConnectionChecker>(),
    ),
  );
  //! Data Sources
  // sl.registerLazySingleton<UserLocalDataSource>(
  //   () => UserLocalDataSource(cache: sl<CacheHelper>()),
  // );
  // sl.registerLazySingleton<UserRemoteDataSource>(
  //   () => UserRemoteDataSource(api: sl<DioConsumer>()),
  // );
  // //! repositories
  // sl.registerLazySingleton<UserRepositoryImpl>(
  //   () => UserRepositoryImpl(
  //     remoteDataSource: sl<UserRemoteDataSource>(),
  //     localDataSource: sl<UserLocalDataSource>(),
  //     networkInfo: sl<NetworkInfo>(),
  //   ),
  // );
  // //! usecases
  // sl.registerLazySingleton(
  //   () => GetUser(repository: sl<UserRepositoryImpl>()),
  // );
}
