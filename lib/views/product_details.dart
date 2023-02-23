import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

import '../cubit/product_details_cubit.dart';
import '../cubit/product_details_state.dart';

class ProductDetails extends StatelessWidget {
  String? slag;
  var searchTxtController = TextEditingController();
  ProductDetails({super.key, this.slag});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProductDetailsCubit>(context).fetchSinglePost(slag: slag);
    return Scaffold(
        backgroundColor: const Color.fromRGBO(243, 238, 251, 1),
        appBar: AppBar(
          title: Text(
            "প্রোডাক্ট ডিটেইল",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: const Color.fromRGBO(243, 238, 251, 1),
          elevation: 0,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
        ),
        body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          builder: (context, state) {
            if (state is ProductDetailsLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ProductDetailsLoaded) {
              return Container(
                padding: EdgeInsets.all(10),
                color: const Color.fromRGBO(243, 238, 251, 1),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      kSearchField(),
                      SizedBox(height: 20),
                      kProductImageSlider(state),
                      SizedBox(height: 15),
                      Text(
                        state.postDetails!.productName!,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "ব্র্যান্ড : ",
                            style: TextStyle(fontSize: 22),
                          ),
                          Text(
                            "${state.postDetails!.brand!.name!.length > 10 ? state.postDetails!.brand!.name!.toString().substring(0, 10) : state.postDetails!.brand!.name!}",
                            style: TextStyle(fontSize: 22),
                          ),
                          Container(
                            height: 10,
                            width: 10,
                            margin: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.pink,
                            ),
                          ),
                          Text(
                            "ডিস্ট্রিবিউটর : ",
                            style: TextStyle(fontSize: 22),
                          ),
                          Text(
                            "",
                            style: TextStyle(fontSize: 22),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      kChargeCard(state),
                      SizedBox(height: 10),
                      Text(
                        "বিস্তারিত",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Html(data: state.postDetails!.description!),
                      // Text(Html(data: ), style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              );
            } else {
              return Center(child: Text("Data not loaded :("));
            }
          },
        ));
  }

  Container kChargeCard(ProductDetailsLoaded state) {
    return Container(
      height: 200,
      child: Stack(
        children: [
          Container(
            height: 140,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Text(
                      "ক্রয়মূল্য : ",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.pink,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      "\u09F3" +
                          " ${state.postDetails!.charge!.currentCharge!}",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.pink,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "বিক্রয়মূল্য : ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      "\u09F3" +
                          " ${state.postDetails!.charge!.sellingPrice ?? ""}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Divider(thickness: 1),
                Row(
                  children: [
                    Text(
                      "লাভ : ",
                      style: TextStyle(fontSize: 24),
                    ),
                    Spacer(),
                    Text(
                      "\u09F3" + " ${state.postDetails!.charge!.profit ?? ""}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      child: Image.asset('assets/badge.png'),
                    ),
                    Container(
                        height: 100,
                        width: 100,
                        child: Center(
                            child: Text(
                          " এটি\nকিনুন",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ))),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  CarouselSlider kProductImageSlider(ProductDetailsLoaded state) {
    return CarouselSlider(
        items: state.postDetails!.images!.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(i.image!)));
            },
          );
        }).toList(),
        options: CarouselOptions(
          height: 300,
          aspectRatio: 16 / 9,
          viewportFraction: 0.7,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.2,
          scrollDirection: Axis.horizontal,
        ));
  }

  Container kSearchField() {
    return Container(
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
          suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          filled: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          fillColor: Colors.white,
          contentPadding: EdgeInsets.only(left: 15, top: 5, bottom: 5),
          hintText: 'কাঙ্খীত পণ্যটি খুজুন ',
        ),
      ),
    );
  }
}
