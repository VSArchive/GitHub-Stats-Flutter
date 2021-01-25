import 'package:flutter/material.dart';
import 'package:github_stats/profile.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Search'),
        ),
        body: Column(
          children: [
            RaisedButton(
              child: Text('Search'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Profile(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
