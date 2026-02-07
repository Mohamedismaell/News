import 'package:bloc/bloc.dart';
import 'package:news_app/features/onboarding/domain/usecases/check_first_time_use_case.dart';
import 'package:news_app/features/onboarding/domain/usecases/complete_onboarding_use_case.dart';
part 'on_boarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit(this.checkFirstTime, this.completeOnboarding)
      : super(OnboardingInitial());
  final CheckFirstTimeUseCase checkFirstTime;
  final CompleteOnboardingUseCase completeOnboarding;

  Future<void> check() async {
    final isFirst = await checkFirstTime.call();
    emit(isFirst ? ShowOnboarding() : SkipOnboarding());
  }

  Future<void> finishOnboarding() async {
    await completeOnboarding.call();
    emit(SkipOnboarding());
  }
}
