import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/product_response_model.dart';
import '../repository/product_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.postRepository) : super(ProductsInitial());

  int offset = 0;
  final ProductRepository postRepository;

  fetchPosts({String? searchText, int? offsetValue}) {
    if (offsetValue != null && offsetValue == 0) {
      offset = 0;
    }

    if (state is ProductsLoading) return;
    var currentState = state;
    var oldProducts = <Product>[];
    if (currentState is ProductsLoaded) {
      oldProducts = currentState.products!;
    }
    if (offsetValue != null && offsetValue == 0) {
      oldProducts = [];
    }

    emit(ProductsLoading(oldProducts, isFirstFethed: offset == 0));

    postRepository
        .fetchPosts(offset: offset, searchText: searchText)
        .then((newProducts) {
      if (offset == 0) {
        offset = 10;
      } else {
        offset = offset + 10;
      }
      print(offset);

      final posts = (state as ProductsLoading).oldProducts;
      posts!.addAll(newProducts);
      emit(ProductsLoaded(posts));
    });
  }
}
