// FavoritesCubit for managing favorite products
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesState {
  final List<Map<String, dynamic>> favoriteItems;

  FavoritesState(this.favoriteItems);
}

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesState([]));

  void addFavorite(Map<String, dynamic> product) {
    final updatedFavorites = List<Map<String, dynamic>>.from(state.favoriteItems)
      ..add(product);
    emit(FavoritesState(updatedFavorites));
  }

  void removeFavorite(Map<String, dynamic> product) {
    final updatedFavorites = List<Map<String, dynamic>>.from(state.favoriteItems)
      ..remove(product);
    emit(FavoritesState(updatedFavorites));
  }
}