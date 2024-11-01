import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/flutter_commerce/presentation/manager/HomeState.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void getCategories (){
    try{
      emit(HomeLoading());
      final categories = ["ALL","PS5" , "PS4","Xbox one" ,"Xbox one X"];
      emit(HomeLoaded(categories));
    }catch(e){
      emit(HomeError('Failed to load categories'));
    }
  }
}