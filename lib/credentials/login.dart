import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_stats/services/firebaes-auth.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthLogic>(context);
    return Container(
      color: Color.fromRGBO(255, 255, 255, 1),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ///Add github Image
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: double.infinity,
                child: CupertinoButton(
                  color: Color.fromRGBO(27, 30, 35, 1),
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontFamily: 'SF-Pro-Text-Semibold', fontSize: 17),
                  ),
                  onPressed: () => auth.signInWithGitHub(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// appBar: CupertinoNavigationBar(
//         previousPageTitle: 'Chats',
//         backgroundColor: Color.fromRGBO(249, 249, 249, 0.94),
//         middle: Text(
//           makeTitle(widget.x['name']),
//           style: TextStyle(
//               fontFamily: 'SF-Pro-Text-Semibold',
//               fontSize: 17,
//               color: Color.fromRGBO(0, 0, 0, 1)),
//         ),
//       ),
