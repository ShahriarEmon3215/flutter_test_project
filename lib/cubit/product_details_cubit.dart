import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_project/cubit/product_details_state.dart';

import '../repository/product_repo.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this.postRepository) : super(ProductDetailsInitial());

  final ProductRepository postRepository;


  fetchSinglePost({String? slag}) {
    if (state is ProductDetailsLoading) return;
    emit(ProductDetailsLoading());
    postRepository.fetchSinglePost(slag: slag).then((postDetails) {
      emit(ProductDetailsLoaded(postDetails));
    });
  }
}
