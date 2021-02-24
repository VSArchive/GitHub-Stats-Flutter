import 'package:flutter/material.dart';
import 'package:github_stats/services/firebaes-auth.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthLogic>(context);
    return Container(
      color: Colors.blue,
      child: Center(
        child: FlatButton(
          child: Text('Login'),
          onPressed: () => auth.signInWithGitHub(context),
        ),
      ),
    );
  }
}
