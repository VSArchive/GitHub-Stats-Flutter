import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_stats/app/pages/home/home2.dart';
import 'package:provider/provider.dart';
import 'package:github_stats/app/navigation/bottomNavigationBar.dart';
import 'package:github_stats/app/navigation/change.dart';
import 'package:github_stats/app/pages/user/account.dart';

class MaterialHomePage extends StatelessWidget {
  final List<Widget> children = [
    HomeSearch(),
    Account(),
  ];

  @override
  Widget build(BuildContext context) {
    final nav = Provider.of<ChangeofPage>(context);
    return Scaffold(
      body: children[nav.pageIndex],
      bottomNavigationBar: MaterialBottomNavigationBar(),
    );
  }
}
