import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'CategoryState.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final String category;
  static CategoryCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  void changeIndex(int index) {
    currentIndex = index;
    emit(AppCurrentIndex());
  }
  CategoryCubit(this.category) : super(CategoryInitial()) {
    _loadProducts();
  }

  void _loadProducts() async {
    try {
      emit(CategoryLoading());
      // Example JSON data (replace with your own JSON file or required data)
      String jsonData = await rootBundle.loadString('lib/flutter_commerce/data/local/data_sources/product.json');
      List<dynamic> decodedJson = json.decode(jsonData);
      List<Map<String, dynamic>> filteredProducts = decodedJson
          .where((product) => category ==
          'ALL'
          'PS5'
          'PS4'
          'Xbox One'
          'Xbox One X'  || product['category'] == category)
          .toList()
          .cast<Map<String, dynamic>>();
      emit(CategoryLoaded(filteredProducts));
    } catch (e) {
      emit(CategoryError("Failed to load products"));
    }
  }
}