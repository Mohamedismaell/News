import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:news_app/core/database/api/dio_consumer.dart';
import 'package:news_app/core/database/cache/cache_helper.dart';
import 'package:news_app/core/injection/service_locator.dart';
import 'package:news_app/core/routes/manager/cubit/app_gate_cubit.dart';
import 'package:news_app/core/theme/manager/theme_cubit.dart';
import 'package:news_app/core/utils/form_validators.dart';
import 'package:news_app/features/get_news/data/datasources/news_remote_data_source.dart';
import 'package:news_app/features/get_news/data/repositories/news_repository_impl.dart';
import 'package:news_app/features/get_news/domain/repositories/news_repository.dart';
import 'package:news_app/features/get_news/domain/usecases/get_news.dart';
import 'package:news_app/features/get_news/presentation/cubit/news/news_cubit.dart';
import 'package:news_app/features/onboarding/domain/repositories/auth_repository.dart';

CacheHelper get cacheHelper => sl<CacheHelper>();

class CommonDi {
  CommonDi._();

  static Future<void> init() async {
    sl.registerLazySingleton(() => ThemeCubit());
    sl.registerLazySingleton(() => Dio());
    sl.registerLazySingleton(() => DioConsumer(dio: sl<Dio>()));

    //! Validators
    sl.registerLazySingleton(() => FormValidators());
    // sl.registerLazySingleton(() => UserValidation());

    //! Local Storage
    final cacheHelper = CacheHelper();
    await cacheHelper.init();
    sl.registerSingleton<CacheHelper>(cacheHelper);
    //! Core
    sl.registerLazySingleton(() => DataConnectionChecker());
    // sl.registerLazySingleton<NetworkInfo>(
    //   () => NetworkInfoImpl(
    //     connectionChecker: sl<DataConnectionChecker>(),
    //   ),
    // );
    // sl.registerLazySingleton(() => CacheHelper());

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

    //! Cubits
    sl.registerLazySingleton(
      () => NewsCubit(sl<GetNewsByCategory>()),
    );
  }
}
