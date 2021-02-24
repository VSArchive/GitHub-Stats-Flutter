import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:github_stats/model/repoDataModel.dart';
import 'package:github_stats/model/userSearchModel.dart';
import 'package:http/http.dart' as http;

///this is the api Logic class
class Api extends ChangeNotifier {
  Api({this.email});
  final String email;

  ///this List takse the userResult from the search query;
  List<Item> userFetchResult = [];
  List<RepoDataModel> userRepoDetails = [];

  String previousSearch;
  UserSearchModel userSearchModelFromJson(String str) =>
      UserSearchModel.fromJson(json.decode(str));

  // ignore: missing_return
  Future<List<Item>> getUserInfo() async {
    String url = "https://api.github.com/search/users?q=$email";
    final responseData = await http.get(url);
    if (responseData.statusCode == 200) {
      UserSearchModel userall = userSearchModelFromJson(responseData.body);
      print(userall);
      return userall.items;
    } else {
      print(responseData.statusCode);
    }
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

  Future<List<RepoDataModel>> getUserRepoInfo(String username) async {
    if (username.isEmpty) {
      userRepoDetails.clear();
      throw "No Repos Found";
    } else {
      final String url = "https://api.github.com/users/$username/repos";
      final responseData = await http.get(url);
      if (responseData.statusCode == 200) {
        // Do conversion here
      } else {
        throw responseData.statusCode;
      }
    }
    return userRepoDetails;
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
}
