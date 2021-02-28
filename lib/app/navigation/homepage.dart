import 'package:bottom_bar_page_transition/bottom_bar_page_transition.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_stats/app/pages/home/home2.dart';
import 'package:github_stats/model/usermodel.dart';
import 'package:github_stats/services/api.dart';
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

  Widget _getBody(index, context) {
    final api = Provider.of<Api>(context);
    if(index == 1){
      return FutureBuilder(
        future: api.getUser(FirebaseAuth.instance.currentUser.email),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Account(userName: snapshot.data.login.toString(),);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      );
    } else {
      return HomeSearch();
    }
  }

  @override
  Widget build(BuildContext context) {
    final nav = Provider.of<ChangeofPage>(context);
    return Scaffold(
      body: BottomBarPageTransition(
        builder: (_, index) => _getBody(index, context),
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
