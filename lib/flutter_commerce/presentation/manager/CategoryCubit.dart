import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'CategoryState.dart';
import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final String category;

  CategoryCubit( this.category) : super(CategoryInitial()) {
    _loadProducts();
  }

  void _loadProducts() async {
    try {
      emit(CategoryLoading());
      // Example JSON data (replace with your own JSON file or required data)
      String jsonData = await rootBundle.loadString('lib/flutter_commerce/data/local/data_sources/product.json');
      List<dynamic> decodedJson = json.decode(jsonData);
      List<Map<String, dynamic>> filteredProducts = decodedJson
          .where((product) => category == 'ALL' || product['category'] == category)
          .toList()
          .cast<Map<String, dynamic>>();
      emit(CategoryLoaded(filteredProducts));
    } catch (e) {
      emit(CategoryError("Failed to load products"));
    }
  }
}
