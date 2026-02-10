import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

part 'connection_state.dart';

class AppConnectionCubit extends Cubit<AppConnectionState> {
  AppConnectionCubit(this._internetConnection) : super(ConnectionInitial()) {
    _init();
  }
  final InternetConnection _internetConnection;
  StreamSubscription<InternetStatus>? _subscription;
  void _init() {
    _subscription = _internetConnection.onStatusChange.listen(
      (InternetStatus status) {
        if (status == InternetStatus.connected) {
          emit(Connected());
        } else {
          emit(Disconnected());
        }
      },
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
