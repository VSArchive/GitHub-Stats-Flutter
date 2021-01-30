import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_stats/model/usermodel.dart';
import 'package:provider/provider.dart';

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
                  onChanged: (value) {
                    Provider.of<UserModel>(context)
                        .userGetSearch
                        .forEach((element) {
                      if (value == element.name) {
                        print(element.name);
                      }
                    });
                  },
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
