class TemplateDi {
  TemplateDi._();

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
    // sl.registerLazySingleton(
    //   () => CategoryNewsCubit(
    //     sl<GetNewsByCategory>(),
    //     sl<AppConnectionCubit>(),
    //   ),
    // );
  }
}
