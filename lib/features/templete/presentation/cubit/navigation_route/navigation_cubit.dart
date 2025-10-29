import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit()
    : super(const NavigationState(currentIndex: 0));

  void changeTab(int index) {
    emit(NavigationState(currentIndex: index));
  }
}
