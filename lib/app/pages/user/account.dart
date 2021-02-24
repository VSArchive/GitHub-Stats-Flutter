import 'package:flutter/material.dart';
import 'package:github_stats/app/pages/user/graph1.dart';
import 'package:github_stats/app/pages/user/graph2.dart';
import 'package:github_stats/app/pages/user/graph3.dart';
import 'package:github_stats/app/pages/user/profile.dart';
import 'package:github_stats/model/repoDataModel.dart';
import 'package:github_stats/model/userSearchModel.dart';
import 'package:github_stats/services/api.dart';
import 'package:github_stats/services/firebaes-auth.dart';
import 'package:provider/provider.dart';

class Account extends StatelessWidget {
  final String userName;
  const Account({Key key, this.userName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final api = Provider.of<Api>(context);
    final auth = Provider.of<AuthLogic>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app), onPressed: () => auth.signout()),
        ],
        title: Text('Profile'),
        backgroundColor: Colors.black87,
        brightness: Brightness.dark,
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                FutureBuilder(
                  future: api.getUserInfo(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Expanded(
                        child: ListView(
                          children: [
                            Profile(data: snapshot.data),
                            Graph1(),
                            Graph2(),
                            // FutureBuilder<List<RepoDataModel>>(
                            //   future:
                            //       api.getUserRepoInfo(snapshot.data[1].login),
                            //   builder: (context, snapshot) {
                            //     if (snapshot.hasData) {
                            //       return Container(
                            //         color: Colors.red,
                            //       );

                            //       // Graph3(data: snapshot.data);
                            //     } else {
                            //       return Center(
                            //           child: CircularProgressIndicator());
                            //     }
                            //   },
                            // ),
                          ],
                        ),
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
