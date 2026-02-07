// import 'package:landit/core/injection/service_locator.dart';
// import 'package:landit/features/on_boarding/data/repositories/auth_repository_impl.dart';
// import 'package:landit/features/on_boarding/data/sources/auth_remote_data_source.dart';
// import 'package:landit/features/on_boarding/domain/repositories/auth_repository.dart';

// class OnBoardingDi {
//   OnBoardingDi._();

//   static void init() {
//     //! Data Sources
//     //* Auth
//     sl.registerLazySingleton<AuthRemoteDataSource>(
//       () => AuthRemoteDataSource(),
//     );

//     //! Repositories
//     sl.registerLazySingleton<AuthRepository>(
//       () => AuthRepositoryImpl(
//         remoteDataSource: sl<AuthRemoteDataSource>(),
//         // networkInfo: sl<NetworkInfo>(),
//       ),
//     );

//     //! Use Cases
//     // sl.registerLazySingleton(
//     //   () => LoginWithGoogle(repository: sl<AuthRepository>()),
//     // );

//     //! Cubits
//   }
// }
