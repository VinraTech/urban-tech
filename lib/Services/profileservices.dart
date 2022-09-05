import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:i/model/profilemodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApisServices {
  String endpoint = 'http://rbarnsoft.com/henry/api/profile';

  Future<Profile> getprofile() async {
    final prefs = await SharedPreferences.getInstance();

    final token = prefs.getString('logintoken');
    Response response = await get(Uri.parse(endpoint), headers: {
      'Content-Type': 'application/json; charset=UT-8',
      'Authorization': 'Bearer $token'
    });

    if (response.statusCode == 200) {
      log(response.body);
      var responseData = json.decode(response.body);
      return Profile.fromJson(responseData);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

//API SERVICE Provider
final ProfileProvider = Provider<ApisServices>((ref) => ApisServices());
