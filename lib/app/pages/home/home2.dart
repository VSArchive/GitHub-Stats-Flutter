import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_stats/model/userSearchModel.dart';
import 'package:github_stats/services/api.dart';
import 'package:provider/provider.dart';

class HomeSearch extends StatefulWidget {
  @override
  _HomeSearchState createState() => _HomeSearchState();
}

class _HomeSearchState extends State<HomeSearch> {
  bool isSpin = false;
  TextEditingController _username = TextEditingController();

  String get username => _username.text;

  @override
  Widget build(BuildContext context) {
    final api = Provider.of<Api>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: CupertinoColors.darkBackgroundGray,
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                ),
                Container(
                  height: 45,
                  child: CupertinoTextField(
                    onChanged: (value) {
                      try {
                        api.userFetchResult = [];
                        api.getSearchUserInfo(value);
                      } catch (e) {
                        print(e.error);
                      }
                    },
                    textInputAction: TextInputAction.go,
                    controller: _username,
                    placeholder: "Search",
                    suffix: IconButton(
                      icon: Icon(
                        Icons.search,
                      ),
                      onPressed: () {
                        try {
                          api.userFetchResult = [];
                          api.getSearchUserInfo(username);
                        } catch (e) {
                          print(e.error);
                        }
                      },
                    ),
                  ),
                ),
                Consumer<Api>(
                  builder: (context, _, child) {
                    return api.userFetchResult.isEmpty
                        ? Center(
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width * 0.9,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Center(
                                  child: Text(
                                "No User Found",
                              )),
                            ),
                          )
                        : Expanded(
                            child: ListView(
                              children: api.userFetchResult
                                  .map(
                                    (Item e) => ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage:
                                            NetworkImage(e.avatarUrl),
                                      ),
                                      title: Text(
                                        e.login,
                                        style: TextStyle(
                                            fontSize: 17, color: Colors.white),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
