import 'package:dio/dio.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:news_app/core/connection/network_info.dart';
import 'package:news_app/core/connection/retry_queue.dart';
import 'package:news_app/core/connection/retry_runner.dart';
import 'package:news_app/core/database/api/api_interceptor.dart';
import 'package:news_app/core/database/api/dio_consumer.dart';
import 'package:news_app/core/database/cache/cache_helper.dart';
import 'package:news_app/core/shared/injection/service_locator.dart';
import 'package:news_app/core/shared/manager/connection_cubit/connection_cubit.dart';
import 'package:news_app/core/shared/manager/theme_cubit/theme_cubit.dart';

CacheHelper get cacheHelper => sl<CacheHelper>();

class CommonDi {
  CommonDi._();

  static Future<void> init() async {
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

    //! Local Storage
    final cacheHelper = CacheHelper();
    await cacheHelper.init();
    sl.registerSingleton<CacheHelper>(cacheHelper);

    //!Cubits
    sl.registerLazySingleton(
        () => AppConnectionCubit(sl<InternetConnection>(), sl<RetryRunner>()));
  }
}
