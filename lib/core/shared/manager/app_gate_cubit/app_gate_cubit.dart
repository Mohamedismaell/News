import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/features/onboarding/domain/repositories/auth_repository.dart';

part 'app_gate_state.dart';

class AppGateCubit extends Cubit<AppGateState> {
  final OnboardingRepository onboardingRepository;
  // final AuthRepository authRepository;

  // StreamSubscription? _authSubscription;

  AppGateCubit({
    required this.onboardingRepository,
    // required this.authRepository,
  }) : super(AppGateLoading()) {
    // _listenToAuthChanges();
  }

  Future<void> start() async {
    final isFirstTime = await onboardingRepository.isFirstTime();

    if (isFirstTime) {
      emit(AppGateOnboarding());
    } else {
      // _emitAuthState();

      emit(AppGateSkipOnboarding());
    }
  }

  //! Listens ONLY to auth changes (login / logout / token refresh)
  // void _listenToAuthChanges() {
  //   _authSubscription = authRepository.authStateChanges.listen((_) {
  //     _emitAuthState();
  //   });
  // }

  //! Emits authenticated / unauthenticated
  // void _emitAuthState() {
  //   emit(
  //     authRepository.isAuthenticated
  //         ? AppGateState.authenticated
  //         : AppGateState.unauthenticated,
  //   );
  // }

  // @override
  // Future<void> close() async {
  //   await _authSubscription?.cancel();
  //   return super.close();
  // }
}
