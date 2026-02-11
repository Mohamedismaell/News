import 'package:news_app/core/database/api/dio_consumer.dart';
import 'package:news_app/core/shared/injection/service_locator.dart';
import 'package:news_app/features/post_details/data/datasources/post_local_data_source.dart';
import 'package:news_app/features/post_details/data/datasources/post_remote_data_source.dart';
import 'package:news_app/features/post_details/data/repositories/news_repository_impl.dart';
import 'package:news_app/features/post_details/domain/repositories/post_repository.dart';
import 'package:news_app/features/post_details/domain/usecases/get_specific_post_usecase.dart';
import 'package:news_app/features/post_details/presentation/cubit/post_details/post_details_cubit.dart';

class PostDi {
  PostDi._();

  static void init(
      // Box<NewsResponseDto> newsBox,
      ) {
    //! Data Sources
    sl.registerLazySingleton<PostRemoteDataSource>(
      () => PostRemoteDataSource(api: sl<DioConsumer>()),
    );
    sl.registerLazySingleton<PostLocalDataSource>(
      () => PostLocalDataSource(),
    );
    //! Repositories
    sl.registerLazySingleton<PostRepository>(
      () => PostRepositoryImpl(
        remoteDataSource: sl<PostRemoteDataSource>(),
        localDataSource: sl<PostLocalDataSource>(),
      ),
    );

    //! Use Cases

    sl.registerLazySingleton(
      () => GetSpecificPost(repository: sl<PostRepository>()),
    );

    //! Cubits

    sl.registerLazySingleton(
      () => PostDetailsCubit(
        sl<GetSpecificPost>(),
      ),
    );
  }
}
