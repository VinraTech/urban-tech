import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:i/model/adressmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApisService {
  String endpoint = 'https://rbarnsoft.com/henry/api/user-address';

  Future<List<Address>> getAdress() async {
    final prefs = await SharedPreferences.getInstance();

    final token = prefs.getString('logintoken');
    Response response = await get(Uri.parse(endpoint), headers: {
      'Content-Type': 'application/json; charset=UT-8',
      'Authorization': 'Bearer $token'
    });

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      return (responseData['address'] as List)
          .map(
            (e) => Address.fromJson(e),
          )
          .toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

//API SERVICE Provider
final apissProvider = Provider<ApisService>((ref) => ApisService());
