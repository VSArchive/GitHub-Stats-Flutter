import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_stats/services/api.dart';
import 'package:provider/provider.dart';

class HomeSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final api = Provider.of<Api>(context);

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
                    onPressed: () => print(1),
                  ),
                ),
              ),
            ),
            CupertinoButton(
              child: Text('GetInfo'),
              onPressed: () => api.getSearchUserInfo(),
            )
          ],
        ),
      ),
    );
  }
}
