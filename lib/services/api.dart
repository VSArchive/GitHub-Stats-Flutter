import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:github_stats/model/repoDataModel.dart';
import 'package:github_stats/model/userSearchModel.dart';
import 'package:github_stats/model/usermodel.dart';
import 'package:http/http.dart' as http;

///this is the api Logic class
class Api extends ChangeNotifier {
  Api({this.userNameOfSignedInUser, this.username});
  final String userNameOfSignedInUser;
  final String username;

  ///this List takse the userResult from the search query;
  List<Item> userFetchResult = [];
  List<RepoDataModel> userRepoDetails = [];

  UserModel userModelFromJson(String str) =>
      UserModel.fromJson(json.decode(str));
  String previousSearch;

  //get Username
  // ignore: missing_return
  Future<UserModel> getUserInfo() async {
    String url = "https://api.github.com/users/$username";
    final responseData = await http.get(url);
    if (responseData.statusCode == 200) {
      return userModelFromJson(responseData.body);
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

  Future<List<RepoDataModel>> getUserRepoInfo() async {
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
