
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/views/product_search_page.dart';

import 'cubit/products_cubit.dart';
import 'cubit/product_details_cubit.dart';
import 'repository/product_repo.dart';
import 'services/product_api_services.dart';

void main() {
  runApp(MyApp(
    postRepository: ProductRepository(PostApiService()),
  ));
}

class MyApp extends StatelessWidget {
  final ProductRepository postRepository;
  const MyApp({super.key, required this.postRepository});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductsCubit>(
            create: (postsCubitContext) => ProductsCubit(postRepository)),
        BlocProvider<ProductDetailsCubit>(
            create: (productDetailsContext) =>
                ProductDetailsCubit(postRepository)),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: SearchPage()),
    );
  }
}
