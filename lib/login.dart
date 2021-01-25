import 'package:flutter/material.dart';
import 'package:github_stats/search.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Column(
          children: [
            RaisedButton(
              child: Text('Login'),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Search(),
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
