import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:news_app/core/connection/refresh_on_reconnect.dart';
import 'package:news_app/core/enums/stats.dart';
import 'package:news_app/core/shared/manager/connection_cubit/connection_cubit.dart';
import 'package:news_app/features/home/domain/entities/post_entitiy.dart';
import 'package:news_app/features/home/domain/usecases/get_top_head_lines.dart';
import 'package:news_app/features/home/presentation/model/book_marked_post.dart';

part 'top_head_lines_state.dart';

class TopHeadLinesCubit extends Cubit<TopHeadLinesState>
    with RefreshOnReconnect {
  TopHeadLinesCubit(this.getTopHeadLines, this._connectionCubit)
      : super(TopHeadLinesState()) {
    init();
    reconnect(_connectionCubit, () {
      init();
    });
  }

  final GetTopHeadLines getTopHeadLines;
  final AppConnectionCubit _connectionCubit;

  Future<void> init() async {
    await callTopHeadLines();
  }

  Future<void> callTopHeadLines() async {
    emit(state.copyWith(
      topNewsStatus: NewsStatus.loading,
    ));
    final response = await getTopHeadLines.call();
    return response.when(
      success: (posts) {
        emit(
          state.copyWith(
            topNewsStatus: NewsStatus.loaded,
            topHeadLines: posts,
          ),
        );
      },
      failure: (errorMessage) {
        emit(
          state.copyWith(
            topNewsStatus: NewsStatus.error,
            errorMessage: errorMessage.message,
          ),
        );
      },
    );
  }
}
