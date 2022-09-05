import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:i/model/allproductmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiServices {
  String endpoint = 'http://rbarnsoft.com/henry/api/all-product';

  Future<List<Product>> getUser() async {
    final prefs = await SharedPreferences.getInstance();

    final token = prefs.getString('logintoken');
    Response response = await get(Uri.parse(endpoint), headers: {
      'Content-Type': 'application/json; charset=UT-8',
      // 'Authorization': keys
      'Authorization': 'Bearer $token'
    });

    if (response.statusCode == 200) {
      log(response.body);
      var responseData = json.decode(response.body);
      return (responseData['product'] as List)
          .map((e) => Product.fromJson(e).copywith(count: 0))
          .toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

//API SERVICE Provider
final apisssProvider = Provider<ApiServices>((ref) => ApiServices());
