import 'package:flutter_bloc/flutter_bloc.dart';

import 'HomeState.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());


  void getCategories() {
    try {
      emit(HomeLoading());
      // Simulate fetching categories
      final categories = ["PS5", "PS4", "Xbox One", "Xbox One X"];
      emit(HomeLoaded(categories));
    } catch (e) {
      emit(HomeError("Failed to load categories"));
    }
  }
}