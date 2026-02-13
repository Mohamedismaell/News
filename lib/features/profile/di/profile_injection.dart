import 'package:hive_ce_flutter/adapters.dart';
import 'package:news_app/core/shared/injection/service_locator.dart';
import 'package:news_app/features/profile/data/datasources/profile_local_data_source.dart';
import 'package:news_app/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:news_app/features/profile/domain/repositories/profile_repository.dart';
import 'package:news_app/features/profile/domain/usecases/profile_usecase.dart';
import 'package:news_app/features/profile/presentation/manager/cubit/user_profile_cubit.dart';

class ProfileDi {
  ProfileDi._();

  static void init(Box<String> profileBox) {
    //! Data Sources
    // sl.registerLazySingleton<NewsRemoteDataSource>(
    //   () => NewsRemoteDataSource(api: sl<DioConsumer>()),
    // );
    sl.registerLazySingleton<ProfileLocalDataSource>(
      () => ProfileLocalDataSource(profileBox),
    );
    //! Repositories
    sl.registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(
        localDataSource: sl<ProfileLocalDataSource>(),
        // remoteDataSource: sl<ProfileRemoteDataSource>(),
      ),
    );

    //! Use Cases
    sl.registerLazySingleton(
      () => GetProfileImageUseCase(
        repository: sl<ProfileRepository>(),
      ),
    );
    sl.registerLazySingleton(
      () => SaveProfileImageUseCase(
        repository: sl<ProfileRepository>(),
      ),
    );
    //! Cubits
    sl.registerLazySingleton(
      () => UserProfileCubit(
        sl<GetProfileImageUseCase>(),
        sl<SaveProfileImageUseCase>(),
      ),
    );
  }
}
