import 'package:bloc/bloc.dart';
import 'package:news_app/features/onboarding/domain/usecases/complete_onboarding_use_case.dart';

part 'on_boarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit(this.completeOnboarding) : super(OnboardingInitial());
  // final CheckFirstTimeUseCase checkFirstTime;
  final CompleteOnboardingUseCase completeOnboarding;

  Future<void> finishOnboarding() async {
    await completeOnboarding.call();
    emit(SkipOnboarding());
  }
}
