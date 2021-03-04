import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:github_stats/model/graphModal.dart';
import 'package:github_stats/model/mainUserDetails.dart';
import 'package:github_stats/model/userSearchModel.dart';
import 'package:github_stats/model/usermodel.dart';
import 'package:http/http.dart' as http;

///this is the api Logic class
class Api extends ChangeNotifier {
  Api({this.email});

  final String email;

  ///this List takse the userResult from the search query;
  List<Item> userFetchResult = [];
  List<GraphRepo> userRepoDetails = [];

  String previousSearch;

  UserSearchModel userSearchModelFromJson(String str) =>
      UserSearchModel.fromJson(json.decode(str));
//

  // ignore: missing_return
  Future<MainUserModel> mainUser(String userName) async {
    String url = "https://api.github.com/users/$userName";
    final responseData = await http.get(url);
    if (responseData.statusCode == 200) {
      return userModelFromJsonX(responseData.body);
    } else {
      print(responseData.statusCode);
    }
  }

  Future<void> followaUser(String username) async {
    String url =
        'https://api.github.com/vijayshankarrealdeal/following/$username';
    String url2 = "https://api.github.com/vijayshankarrealdeal/followers";
    try {
      await http.put(url, body: jsonEncode({'username': username}));
      final res = await http.get(url2);
      print(res.body);
    } catch (e) {
      throw e;
    }
  }

  // ignore: missing_return
  Future<UserModel> getUserInfo(String userName) async {
    String url = "https://api.github.com/users/$userName";
    final responseData = await http.get(url);
    if (responseData.statusCode == 200) {
      return userModelFromJson(responseData.body);
    } else {
      print(responseData.statusCode);
    }
  }

  ///this function  will get user and show them on screen.
  Future<Item> getSearchUserInfo(String username) async {
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
        notifyListeners();
      } else {
        throw responseData.statusCode;
      }
      return userFetchResult.first;
    }
  }

  // Future<Item> getUser(String username) async {
  //   if (username.isEmpty) {
  //     userFetchResult.clear();
  //     throw "Please provide a name";
  //   } else {
  //     final String url =
  //         "https://api.github.com/search/users?q=$username";
  //     final responseData = await http.get(url);
  //     if (responseData.statusCode == 200) {
  //       final extractedUser =
  //           jsonDecode(responseData.body) as Map<String, dynamic>;
  //       final x = UserSearchModel.fromJson(extractedUser);
  //       userFetchResult.clear();
  //       x.items.forEach((element) {
  //         userFetchResult.add(element);
  //       });
  //     } else {
  //       throw responseData.statusCode;
  //     }
  //     return userFetchResult.first;
  //   }
  // }

  Future<List<GraphRepo>> getUserRepoInfo(String username) async {
    if (username.isEmpty) {
      userRepoDetails.clear();
      throw "No Repos Found";
    } else {
      final String url = "https://api.github.com/users/$username/repos";
      final responseData = await http.get(url);
      if (responseData.statusCode == 200) {
        userRepoDetails = graphRepoFromJson(responseData.body);
        print(userRepoDetails);
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
