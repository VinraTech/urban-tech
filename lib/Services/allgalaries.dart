import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/Modelgalleries.dart';

class ApisService {
  String endpoint = 'http://rbarnsoft.com/henry/api/get-image';

  Future<List<Gallory>> getgalllery() async {
    final prefs = await SharedPreferences.getInstance();

    final token = prefs.getString('logintoken');
    Response response = await get(Uri.parse(endpoint), headers: {
      'Content-Type': 'application/json; charset=UT-8',
      'Authorization': 'Bearer $token'
    });

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      return (responseData['gallory'] as List)
          .map(
            (e) => Gallory.fromJson(e),
          )
          .toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

//API SERVICE Provider
final apissProvider = Provider<ApisService>((ref) => ApisService());
