import 'package:flutter_bloc/flutter_bloc.dart';

class CartState {
  final List<Map<String, dynamic>> cartItems;

  CartState(this.cartItems);
}

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState([]));

  void addItem(Map<String, dynamic> product) {
    final updatedCart = List<Map<String, dynamic>>.from(state.cartItems)
      ..add(product);
    emit(CartState(updatedCart));
  }

  void removeItem(Map<String, dynamic> product) {
    final updatedCart = List<Map<String, dynamic>>.from(state.cartItems)
      ..remove(product);
    emit(CartState(updatedCart));
  }

  void clearCart() {
    emit(CartState([]));
  }
}