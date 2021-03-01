import 'package:flutter/material.dart';
import 'package:github_stats/model/CloudUserData.dart';
import 'package:github_stats/services/api.dart';
import 'package:github_stats/services/firebaes-auth.dart';
import 'package:provider/provider.dart';

class Account extends StatelessWidget {
  final String userName;
  const Account({Key key, this.userName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthLogic>(context);
    final cdatabase = Provider.of<List<CloudUserData>>(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(237, 241, 242, 1),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: auth.signout,
          )
        ],
        title: Text('Profile'),
        backgroundColor: Colors.black87,
        brightness: Brightness.dark,
      ),
      body: Container(
        child: cdatabase.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView(
                            children: [
                              // FutureBuilder(
                              //   future: api.getUserInfo(userName),
                              //   builder: (context, snapshot) {
                              //     if (snapshot.hasData) {
                              //       return Profile(data: snapshot.data);
                              //     } else {
                              //       return Center(child: CircularProgressIndicator());
                              //     }
                              //   },
                              // ),
                              // FutureBuilder(
                              //   future: api.getUserRepoInfo(userName),
                              //   builder: (context, snapshot) {
                              //     if (snapshot.hasData) {
                              //       return Graph3();
                              //     } else {
                              //       return Center(child: CircularProgressIndicator());
                              //     }
                              //   },
                              // ),
                              // Graph1(),
                              // Graph2(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
