import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_stats/model/usermodel.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileFromSerach extends StatelessWidget {
  final String userName;

  const ProfileFromSerach({Key key, this.userName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<UserModel>(context);
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text(
          userName,
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: Container(
        child: data == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(data.avatarUrl),
                        radius: 36,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Text(
                              data.name,
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        data.bio.toString(),
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.grey,
                            size: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              data.location,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.email_outlined,
                            color: Colors.grey,
                            size: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              data.email,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.brightness_medium_rounded,
                            color: Colors.grey,
                            size: 20,
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 10),
                          //   child: AutoSizeText(
                          //     data.twitterUsername,
                          //     style: TextStyle(fontSize: 18),
                          //     maxLines: 2,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.link_outlined,
                            color: Colors.grey,
                            size: 20,
                          ),
                          GestureDetector(
                            onTap: () => launch(data.blog),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: AutoSizeText(
                                data.blog.substring(24),
                                style: TextStyle(fontSize: 18),
                                maxLines: 2,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.person_outlined,
                            color: Colors.grey,
                            size: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "${data.followers} Followers | ${data.following} Following",
                              style: TextStyle(fontSize: 18),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  // ignore: unused_element
  _launchURL(String urlX) async {
    try {
      if (await canLaunch(urlX)) {
        print(urlX);
        await launch(urlX);
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e);
    }
  }
}
