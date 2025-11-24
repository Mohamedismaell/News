//edit latter
part of 'navigation_cubit.dart';

@immutable
sealed class NavigationState {
  final int index;

  const NavigationState({required this.index});
}

final class InitialIndex extends NavigationState {
  const InitialIndex() : super(index: 0);
}

final class UpdateIndex extends NavigationState {
  const UpdateIndex({required super.index});
}
