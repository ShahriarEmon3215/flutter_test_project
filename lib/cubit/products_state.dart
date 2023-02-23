part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {} 
class ProductsLoading extends ProductsState {
  List<Product>? oldProducts;
  bool isFirstFethed;
  ProductsLoading(this.oldProducts, {this.isFirstFethed = false});
} 
class ProductsLoaded extends ProductsState {
  List<Product>? products;
  ProductsLoaded(this.products);
} 
class ProductsFailed extends ProductsState {} 
