import 'package:flutter/material.dart';
import 'package:github_stats/app/pages/user/graph1.dart';
import 'package:github_stats/app/pages/user/graph3.dart';
import 'package:github_stats/app/pages/user/profile.dart';

import 'graph2.dart';

class Account extends StatelessWidget {

  String userName;

  Account(String login){
    userName = login;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile'),),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Profile(userName),
                      Graph1(),
                      Graph2(),
                      Graph3(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
