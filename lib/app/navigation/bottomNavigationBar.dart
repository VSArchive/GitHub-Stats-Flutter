import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:github_stats/app/navigation/change.dart';
import 'package:provider/provider.dart';

class MaterialBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final nav = Provider.of<ChangeofPage>(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 4.0, right: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                icon: Icon(
                  CupertinoIcons.home,
                  size: nav.size,
                  color: nav.color,
                ),
                onPressed: () {
                  nav.kCallback(0);
                }),
            IconButton(
                icon: Icon(
                  CupertinoIcons.person,
                  size: nav.size,
                  color: nav.color,
                ),
                onPressed: () {
                  nav.kCallback(1);
                }),
          ],
        ),
      ),
    );
  }
}
