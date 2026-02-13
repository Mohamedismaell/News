import 'package:news_app/core/shared/injection/service_locator.dart';
import 'package:news_app/features/book_marks/presentation/manager/cubit/book_marks_cubit.dart';

class BookMarksDi {
  BookMarksDi._();

  static void init() {
    //! Data Sources
    // sl.registerLazySingleton<NewsRemoteDataSource>(
    //   () => NewsRemoteDataSource(api: sl<DioConsumer>()),
    // );
    // sl.registerLazySingleton<NewsLocalDataSource>(
    //   () => NewsLocalDataSource(newsBox: newsBox),
    // );
    //! Repositories
    // sl.registerLazySingleton<NewsRepository>(
    //   () => NewsRepositoryImpl(
    //     remoteDataSource: sl<NewsRemoteDataSource>(),
    //     localDataSource: sl<NewsLocalDataSource>(),
    //   ),
    // );

    //! Use Cases
    // sl.registerLazySingleton(
    //   () => GetNewsByCategory(repository: sl<NewsRepository>()),
    // );

    //! Cubits
    sl.registerLazySingleton(
      () => BookMarksCubit(),
    );
  }
}
