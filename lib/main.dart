import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_stats/app/navigation/change.dart';
import 'package:github_stats/app/navigation/homepage.dart';
import 'package:github_stats/credentials/login.dart';
import 'package:github_stats/services/api.dart';
import 'package:github_stats/services/firebaes-auth.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider<AuthLogic>(
      create: (context) => AuthLogic(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthLogic>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ChangeofPage>(
          create: (context) => ChangeofPage(),
        ),
      ],
      child: StreamBuilder<Object>(
        stream: auth.onAuthChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            UserExtension user = snapshot.data;
            if (user == null) {
              return MaterialApp(
                home: Login(),
              );
            } else {
              print(user.email);
              return MultiProvider(
                providers: [
                  Provider<UserExtension>.value(value: user),
                  ChangeNotifierProvider<Api>(
                    create: (context) => Api(email: user.email),
                  ),
                ],
                child: MaterialApp(home: MaterialHomePage()),
              );
            }
          } else {
            return CupertinoActivityIndicator();
          }
        },
      ),
    );

    //     /// This is a Temporary Code.
    //     MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider<Api>(create: (context) => Api()),
    //   ],
    //   child: MaterialApp(home: SplashScreen()),
    // )

    ///
    /// !important
    ///After Adding firebase this code will be in use so don't delete it and the imports.
  }
}
