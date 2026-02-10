import 'package:dio/dio.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:news_app/core/connections/network_info.dart';
import 'package:news_app/core/database/api/dio_consumer.dart';
import 'package:news_app/core/database/cache/cache_helper.dart';
import 'package:news_app/core/injection/service_locator.dart';
import 'package:news_app/core/manager/connection_cubit/connection_cubit.dart';
import 'package:news_app/core/manager/theme_cubit/theme_cubit.dart';

CacheHelper get cacheHelper => sl<CacheHelper>();

class CommonDi {
  CommonDi._();

  static Future<void> init() async {
    sl.registerLazySingleton(() => ThemeCubit());
    sl.registerLazySingleton(() => Dio());
    sl.registerLazySingleton(() => DioConsumer(dio: sl<Dio>()));
    //! connection
    sl.registerLazySingleton(() => InternetConnection());

    // //! Validators
    // sl.registerLazySingleton(() => FormValidators());
    // sl.registerLazySingleton(() => UserValidation());

    //! Local Storage
    final cacheHelper = CacheHelper();
    await cacheHelper.init();
    sl.registerSingleton<CacheHelper>(cacheHelper);

    //! Core
    sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(sl<InternetConnection>()),
    );
    //!Cubits
    sl.registerLazySingleton(
        () => AppConnectionCubit(sl<InternetConnection>()));
  }
}
