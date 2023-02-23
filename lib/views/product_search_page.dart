import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:http/http.dart';
import 'package:test_project/views/product_details.dart';

import '../cubit/products_cubit.dart';
import '../models/product_response_model.dart';

class SearchPage extends StatelessWidget {
  final scrollController = ScrollController();
  var searchTxtController = TextEditingController();
  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
    BlocProvider.of<ProductsCubit>(context).fetchPosts();
    var size = MediaQuery.of(context).size;

    double itemHeight = (size.height) / 1.9;
    double itemWidth = size.width / 2;

    bool isLoading = false;

    return Scaffold(
      body: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoading && state.isFirstFethed) {
            return Center(child: CircularProgressIndicator());
          }
          List<Product> posts = [];
          bool isLoading = false;

          if (state is ProductsLoading) {
            posts = state.oldProducts!;
            isLoading = true;
          } else if (state is ProductsLoaded) {
            posts = state.products!;
          }

          return Container(
            padding: EdgeInsets.all(10),
            color: Color.fromRGBO(243, 238, 251, 1),
            child: Column(
              children: [
                SizedBox(height: 50),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  height: 50,
                  child: TextField(
                    controller: searchTxtController,
                    maxLines: 1,
                    style: TextStyle(fontSize: 17),
                    textAlign: TextAlign.start,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            BlocProvider.of<ProductsCubit>(context).fetchPosts(
                                searchText: searchTxtController.text,
                                offsetValue: 0);
                          },
                          icon: Icon(Icons.search)),
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      fillColor: Colors.white,
                      contentPadding:
                          EdgeInsets.only(left: 15, top: 5, bottom: 5),
                      hintText: 'Search',
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: (itemWidth / itemHeight),
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20),
                    controller: scrollController,
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      if (index < posts.length) {
                        isLoading = false;
                        Product post = posts[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (routeContext) =>
                                      ProductDetails(slag: post.slug),
                                ));
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                Container(
                                    height: itemHeight / 1.7,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(post.image!))),
                                Text(
                                  post.productName!.length > 30
                                      ? post.productName!.substring(0, 30) +
                                          "..."
                                      : post.productName!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black87),
                                ),
                                Row(
                                  children: [
                                    Text("ক্রয় "),
                                    Text(
                                      post.charge!.sellingPrice != null &&
                                              post.charge!.profit != null
                                          ? "\u09F3" +
                                              " ${post.charge!.sellingPrice!.floor() - post.charge!.profit!.floor()}"
                                          : " ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.pink),
                                    ),
                                    Spacer(),
                                    Text(
                                      post.charge!.currentCharge != null
                                          ? "\u09F3" +
                                              " ${post.charge!.currentCharge!.floor()}"
                                          : "",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.pink,
                                          decoration:
                                              TextDecoration.lineThrough),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("বিক্রয় "),
                                    Text(
                                      post.charge!.sellingPrice != null
                                          ? "\u09F3" +
                                              " ${post.charge!.sellingPrice!.floor()}"
                                          : "",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.pink),
                                    ),
                                    Spacer(),
                                    Text("লাভ "),
                                    Text(
                                      post.charge!.profit != null
                                          ? "\u09F3" +
                                              " ${post.charge!.profit!.floor()}"
                                          : "",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.pink,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      } else {
                        isLoading = true;
                        Timer(Duration(milliseconds: 30), () {
                          scrollController.jumpTo(
                              scrollController.position.maxScrollExtent);
                        });
                        return Container();
                      }
                    },
                  ),
                ),
                if (isLoading)
                  Container(
                    height: 60,
                    width: double.infinity,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
              ],
            ),
          );
        },
      ),
    );
  }

  void setupScrollController(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<ProductsCubit>(context).fetchPosts(
              searchText: searchTxtController.text.isNotEmpty
                  ? searchTxtController.text
                  : null);
        }
      }
    });
  }
}
