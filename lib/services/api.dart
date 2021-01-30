import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:github_stats/model/userSearchModel.dart';
import 'package:http/http.dart' as http;

class Api extends ChangeNotifier {
  final String key;

  Api({this.key});
  List<Item> userFetchResult = [];
  Future getUserInfo() async {
    const String url = "https://api.github.com/users/vijayshankarrealdeal";
    final responseData = await http.get(url);
    if (responseData.statusCode == 200) {
      print(responseData.body);
    } else {
      print(responseData.statusCode);
    }
  }

  Future<List<Item>> getSearchUserInfo(String username) async {
    final String url = "https://api.github.com/search/users?q=$username";
    final responseData = await http.get(url);
    if (responseData.statusCode == 200) {
      final extractedUser =
          jsonDecode(responseData.body) as Map<String, dynamic>;
      final x = UserSearchModel.fromJson(extractedUser);
      x.items.forEach((element) {
        userFetchResult.add(element);
      });
    } else {
      print(responseData.statusCode);
    }
    return userFetchResult;
  }
}
