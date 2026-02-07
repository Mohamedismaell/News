// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'on_boarding_cubit.dart';

class OnBoardingState extends Equatable {
  final bool isFirstTime;

  const OnBoardingState({this.isFirstTime = true});

  @override
  List<Object?> get props => [isFirstTime];

  OnBoardingState copyWith({
    bool? isFirstTime,
  }) {
    return OnBoardingState(
      isFirstTime: isFirstTime ?? this.isFirstTime,
    );
  }
}
