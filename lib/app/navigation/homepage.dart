import 'package:bottom_bar_page_transition/bottom_bar_page_transition.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_stats/app/pages/home/home2.dart';
import 'package:github_stats/model/usermodel.dart';
import 'package:provider/provider.dart';
import 'package:github_stats/app/navigation/bottomNavigationBar.dart';
import 'package:github_stats/app/navigation/change.dart';
import 'package:github_stats/app/pages/user/account.dart';

class MaterialHomePage extends StatefulWidget {

  @override
  _MaterialHomePageState createState() => _MaterialHomePageState();
}

class _MaterialHomePageState extends State<MaterialHomePage> {

  var _currentPage = 0;

  final List<Widget> children = [
    Builder(
      builder: (context) {
        return Provider<UserModel>(
          create: (context) => UserModel(),
          child: HomeSearch(),
        );
      },
    ),
    Account(),
  ];

  Widget _getBody(int index) {
    if(index == 1){
      return Account();
    } else {
      return HomeSearch();
    }
  }

  @override
  Widget build(BuildContext context) {
    final nav = Provider.of<ChangeofPage>(context);
    return Scaffold(
      body: BottomBarPageTransition(
        builder: (_, index) => _getBody(index),
        currentIndex: _currentPage,
        totalLength: 2,
        transitionType: TransitionType.fade,
        transitionDuration: Duration(milliseconds: 300),
        // transitionCurve: ,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color.fromRGBO(237, 241, 242, 1),
        height: 50,
        animationDuration: Duration(milliseconds: 300),
        items: <Widget>[
          Icon(
            CupertinoIcons.home,
            size: nav.size,
            color: nav.color,
          ),
          Icon(
            CupertinoIcons.person,
            size: nav.size,
            color: nav.color,
          ),
        ],
        onTap: (index) {
          _currentPage = index;
          setState(() {});
        },
      ),
    );
  }
}
