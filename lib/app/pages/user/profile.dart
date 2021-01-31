import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:github_stats/model/usermodel.dart';
import 'package:http/http.dart' as http;

class Profile extends StatelessWidget {
  String userName;

  Profile(String userName){
    this.userName = userName;
  }

  String login = "";
  String name = "";
  String avatarUrl = "";
  String location = "";
  String email = "";
  String blog = "";
  String bio = "";
  UserModel data;

  Future<String> getUserInfo() async {
    String url = "https://api.github.com/users/$userName";
    final responseData = await http.get(url);
    final extractedUser = jsonDecode(responseData.body) as Map<String, dynamic>;

    data = UserModel.fromJson(extractedUser);

    if (data.login == null) {
      login = "Not Visible";
    } else {
      login = data.login;
    }

    if (data.name == null) {
      name = "Not Visible";
    } else {
      name = data.name;
    }

    if (data.avatarUrl == null) {
      avatarUrl = "Not Visible";
    } else {
      avatarUrl = data.avatarUrl;
    }

    if (data.location == null) {
      location = "Not Visible";
    } else {
      location = data.location;
    }

    if (data.email == null) {
      email = "Not Visible";
    } else {
      email = data.email;
    }

    if (data.blog == null || data.blog.trim() == "") {
      blog = "Not Visible";
    } else {
      blog = data.blog;
    }

    if (data.bio == null) {
      bio = "Not Visible";
    } else {
      bio = data.bio;
    }

    return url;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: getUserInfo(),
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(avatarUrl),
                        radius: 36,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              login,
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        bio,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.grey,
                            size: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              location,
                              style: TextStyle(fontSize: 18),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.email_outlined,
                            color: Colors.grey,
                            size: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              email,
                              style: TextStyle(fontSize: 18),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.link_outlined,
                            color: Colors.grey,
                            size: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              blog,
                              style: TextStyle(fontSize: 18),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return CircularProgressIndicator.adaptive();
          }
        });
  }
}
