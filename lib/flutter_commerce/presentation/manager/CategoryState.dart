// CategoryCubit states
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<Map<String, dynamic>> products;
  CategoryLoaded(this.products);
}
class AppCurrentIndex extends CategoryState{}

class CategoryError extends CategoryState {
  final String message;
  CategoryError(this.message);
}
