import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:github_stats/model/usermodel.dart';
import 'package:http/http.dart' as http;

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String username = "";
  String name = "";
  String avatarUrl = "";
  String location = "";
  String email = "";
  String blog = "";
  String bio = "";
  UserModel data;

  Future<String> getUserInfo() async {
    const String url = "https://api.github.com/users/vineelsai26";
    final responseData = await http.get(url);
    final extractedUser = jsonDecode(responseData.body) as Map<String, dynamic>;

    data = UserModel.fromJson(extractedUser);

    username = data.login;
    name = data.name;
    avatarUrl = data.avatarUrl;
    location = data.location;
    if (data.email == null) {
      email = "Not Visible";
    } else {
      email = data.email;
    }
    blog = data.blog;
    bio = data.bio;

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
                              username,
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
