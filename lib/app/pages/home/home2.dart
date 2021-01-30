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
  TextEditingController _username = TextEditingController();

  String get username => _username.text;

  @override
  Widget build(BuildContext context) {
    final api = Provider.of<Api>(context);

    return Scaffold(
      backgroundColor: CupertinoColors.darkBackgroundGray,
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 45,
                child: CupertinoTextField(
                  controller: _username,
                  placeholder: "Search",
                  suffix: IconButton(
                    icon: Icon(
                      Icons.search,
                    ),
                    onPressed: () => print(1),
                  ),
                ),
              ),
            ),
            CupertinoButton(
              child: Text('GetInfo'),
              onPressed: () => api.getSearchUserInfo(username),
            ),
            Container(
                height: 600,
                child: ListView(
                  children: api.userFetchResult
                      .map(
                        (Item e) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                CachedNetworkImageProvider(e.avatarUrl),
                          ),
                          title: Text(
                            e.login,
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          ),
                        ),
                      )
                      .toList(),
                )),
          ],
        ),
      ),
    );
  }
}
