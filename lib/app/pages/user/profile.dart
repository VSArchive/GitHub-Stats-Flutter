import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.red,
          radius: 40,
        ),
        Text(
          'UserName',
          style: TextStyle(fontSize: 22),
        ),
      ],
    );
  }
}
