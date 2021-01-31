import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_stats/app/pages/user/account.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
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
                    api.previousSearch = value;
                    if (value.isEmpty || value.length == 0) {
                      api.clearResults();
                    }
                    try {
                      api.getSearchUserInfo(value);
                      api.clearTop(value);
                    } catch (e) {
                      print(e.error);
                    }
                  },
                  onSubmitted: (value) {
                    try {
                      api.getSearchUserInfo(value);
                      api.clearTop(value);
                    } catch (e) {
                      print(e.error);
                    }
                  },
                  textInputAction: TextInputAction.search,
                  controller: _username,
                  placeholder: "Search",
                  suffix: IconButton(
                    icon: Icon(
                      Icons.clear,
                    ),
                    onPressed: () {
                      api.clearResults();
                      _username.clear();
                    },
                  ),
                ),
              ),
              Consumer<Api>(
                builder: (context, _, child) {
                  return api.userFetchResult.isEmpty && username.isNotEmpty
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
                                    onTap: () => {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Account(e.login)))
                                    },
                                    leading: CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(e.avatarUrl),
                                    ),
                                    title: Text(
                                      e.login,
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.black),
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
    );
  }
}
