import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_stats/app/navigation/change.dart';
import 'package:github_stats/app/navigation/homepage.dart';
import 'package:github_stats/credentials/login.dart';
import 'package:github_stats/services/api.dart';
import 'package:github_stats/services/firebaes-auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthLogic>(create: (context) => AuthLogic()),
        ChangeNotifierProvider<ChangeofPage>(
            create: (context) => ChangeofPage()),
      ],
      child: StreamBuilder<Object>(
          stream: Provider.of<AuthLogic>(context).onAuthChanges,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              UserExtension user = snapshot.data;
              if (user == null) {
                return MaterialApp(
                  home: Login(),
                );
              } else {
                return MultiProvider(
                  providers: [
                    ChangeNotifierProvider<Api>(create: (context) => Api()),
                  ],
                  child: MaterialApp(home: MaterialHomePage()),
                );
              }
            } else {
              return CupertinoActivityIndicator();
            }
          }),
    );
  }
}
