import 'package:flutter/material.dart';
import 'package:github_stats/app/navigation/change.dart';
import 'package:github_stats/app/navigation/homepage.dart';
import 'package:github_stats/services/api.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(providers: [
        ChangeNotifierProvider<ChangeofPage>(
            create: (context) => ChangeofPage()),
        ChangeNotifierProvider<Api>(create: (context) => Api()),
      ], child: MaterialHomePage()),
    );
  }
}
