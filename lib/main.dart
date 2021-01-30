import 'package:flutter/material.dart';
import 'package:github_stats/app/navigation/change.dart';
import 'package:github_stats/app/navigation/homepage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<ChangeofPage>(
          create: (context) => ChangeofPage(), child: MaterialHomePage()),
    );
  }
}
