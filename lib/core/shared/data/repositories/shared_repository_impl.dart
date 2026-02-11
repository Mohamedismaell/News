import 'package:news_app/core/shared/domain/repositories/shared_repository.dart';
import 'package:news_app/features/home/data/datasources/news_local_data_source.dart';
import 'package:news_app/features/home/data/datasources/news_remote_data_source.dart';

class SharedRepositoryImpl extends SharedRepository {
  final NewsRemoteDataSource remoteDataSource;
  final NewsLocalDataSource localDataSource;
  SharedRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });
}
