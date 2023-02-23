import '../models/product_details_model.dart';
import '../models/product_response_model.dart';
import '../services/product_api_services.dart';

class ProductRepository {
  final PostApiService? service;

  ProductRepository(this.service);
  Future<List<Product>> fetchPosts({int? offset, String? searchText}) async {
    List<Product> products = [];
    final productsResponse =
        await service!.fetchPosts(offset: offset, searchText: searchText);
    for (var item in productsResponse['data']['products']['results']) {
      products.add(Product.fromJson(item));
    }
    return products;
  }

  Future<ProductDetailsModel> fetchSinglePost({required String? slag}) async {
    final productsDetailsResponse = await service!.fetchSinglePost(slag: slag);

    var productDetails =
        ProductDetailsModel.fromJson(productsDetailsResponse['data']);
    return productDetails;
  }
}
