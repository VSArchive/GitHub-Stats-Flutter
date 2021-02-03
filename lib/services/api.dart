import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:github_stats/model/userSearchModel.dart';
import 'package:github_stats/model/usermodel.dart';
import 'package:http/http.dart' as http;

///this is the api Logic class
class Api extends ChangeNotifier {
  ///this List takse the userResult from the search query;
  List<Item> userFetchResult = [];

  ///user data

  //

  UserModel userModelFromJson(String str) =>
      UserModel.fromJson(json.decode(str));

  //
  //
  String previousSearch;

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

  //get Username
  Future<UserModel> getUserInfo(String userName) async {
    UserModel userData;
    String url = "https://api.github.com/users/$userName";
    final responseData = await http.get(url);
    if (responseData.statusCode == 200) {
      userData = userModelFromJson(responseData.body);
    } else {
      print(responseData.statusCode);
    }
    return userData;
  }

  ///this function  will get user and show them on screen.
  Future<void> getSearchUserInfo(String username) async {
    if (username.isEmpty) {
      userFetchResult.clear();
      notifyListeners();
      throw "Please provide a name";
    } else {
      final String url =
          "https://api.github.com/search/users?q=$username&per_page=5";
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
