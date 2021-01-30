import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:github_stats/model/userSearchModel.dart';
import 'package:http/http.dart' as http;

class Api extends ChangeNotifier {
  final String key;
  Api({this.key});
  List<Item> userFetchResult = [];
  String previousSearch;
  Future getUserInfo() async {
    const String url = "https://api.github.com/users/vijayshankarrealdeal";
    final responseData = await http.get(url);
    if (responseData.statusCode == 200) {
      print(responseData.body);
    } else {
      print(responseData.statusCode);
    }
  }

  void clearTop(String value) {
    if (value != previousSearch) {
      userFetchResult.reversed;
      notifyListeners();
    }
  }

  void clearResults() {
    userFetchResult = [];
    notifyListeners();
  }

  Future<void> getSearchUserInfo(String username) async {
    if (username.isEmpty) {
      userFetchResult.clear();
      notifyListeners();
      throw "Please provide a name";
    } else {
      final String url = "https://api.github.com/search/users?q=$username";
      final responseData = await http.get(url);
      if (responseData.statusCode == 200) {
        final extractedUser =
            jsonDecode(responseData.body) as Map<String, dynamic>;
        final x = UserSearchModel.fromJson(extractedUser);
        userFetchResult.clear();
        x.items.forEach((element) {
          userFetchResult.add(element);
        });
        print(userFetchResult.length);
      } else {
        throw responseData.statusCode;
      }
    }
    notifyListeners();
  }
}
