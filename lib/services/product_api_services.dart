import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class PostApiService {
  final baseUrl = "https://panel.supplyline.network/";
  Future<dynamic> fetchPosts({int? offset, String? searchText}) async {
    var response;
    try {
      if (searchText == null) {
        response = await get(
            Uri.parse(baseUrl +
                "api/product/search-suggestions/?limit=10&offset=$offset"),
            headers: {'Content-Type': 'application/json'});
      } else {
        response = await get(Uri.parse(baseUrl +
            "api/product/search-suggestions/?limit=10&offset=$offset&search=$searchText"));
      }

      return jsonDecode(utf8.decode(response.bodyBytes));
    } catch (ex) {
      return [];
    }
  }

  Future<dynamic> fetchSinglePost({required String? slag}) async {
    var response;
    try {
      if (slag != null) {
        response = await get(Uri.parse(baseUrl + "api/product-details/$slag/"));
      }

      return jsonDecode(utf8.decode(response.bodyBytes));
    } catch (ex) {
      return [];
    }
  }
}
