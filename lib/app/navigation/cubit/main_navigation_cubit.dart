import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haat_e_commerce/app/navigation/cubit/main_navigation_state.dart';

class MainNavigationCubit extends Cubit<MainNavigationState> {
  MainNavigationCubit()
    : super(MainNavigationState(tabIndex: 0, selectedCategory: 'all'));

  void changeTabAndCategory(int index, String category) {
    emit(MainNavigationState(tabIndex: index, selectedCategory: category));
  }
}
