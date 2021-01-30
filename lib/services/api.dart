import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Api extends ChangeNotifier {
  final String key;

  Api({this.key});

  Future getUserInfo() async {
    const String url = "https://api.github.com/users/vijayshankarrealdeal";
    final responseData = await http.get(url);
    if (responseData.statusCode == 200) {
      print(responseData.body);
    } else {
      print(responseData.statusCode);
    }
  }

  Future getSearchUserInfo() async {
    const String url = "https://api.github.com/search/users";
    final responseData = await http.get(url);
    if (responseData.statusCode == 200) {
      print(responseData.body);
    } else {
      print(responseData.statusCode);
    }
  }
}
