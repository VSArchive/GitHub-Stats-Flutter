import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.darkBackgroundGray,
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 45,
                child: CupertinoTextField(
                  placeholder: "Search",
                  suffix: IconButton(
                    icon: Icon(
                      Icons.search,
                    ),
                    onPressed: () => print('x'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
