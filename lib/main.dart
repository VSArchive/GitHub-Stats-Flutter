import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_stats/app/navigation/change.dart';
import 'package:github_stats/app/navigation/homepage.dart';
import 'package:github_stats/services/api.dart';
import 'package:provider/provider.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(
    // ChangeNotifierProvider<AuthLogic>(
    //   create: (context) => AuthLogic(),
    //child:
    MyApp(),
    // ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final auth = Provider.of<AuthLogic>(context);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ChangeofPage>(
            create: (context) => ChangeofPage(),
          ),
        ],
        child:

            /// This is a Temporary Code.
            MultiProvider(
          providers: [
            ChangeNotifierProvider<Api>(create: (context) => Api()),
          ],
          child: MaterialApp(home: MaterialHomePage()),
        )

        ///
        /// !important
        ///After Adding firebase this code will be in use so don't delete it and the imports.
        //     StreamBuilder<Object>(
        //   stream: auth.onAuthChanges,
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.active) {
        //       UserExtension user = snapshot.data;
        //       if (user != null) {
        //         return MaterialApp(
        //           home: Login(),
        //         );
        //       } else {
        //         return MultiProvider(
        //           providers: [
        //             ChangeNotifierProvider<Api>(
        //                 create: (context) =>
        //                     Api(userNameOfSignedInUser: user.email)),
        //           ],
        //           child: MaterialApp(home: MaterialHomePage()),
        //         );
        //       }
        //     } else {
        //       return CupertinoActivityIndicator();
        //     }
        //   },
        // ),
        );
  }
}
