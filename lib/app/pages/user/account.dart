import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:github_stats/model/mainUserDetails.dart';
import 'package:github_stats/services/firebaes-auth.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Account extends StatelessWidget {
  final String userName;
  const Account({Key key, this.userName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthLogic>(context);
    final datas = Provider.of<MainUserModel>(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        title: Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'SF-Pro-Display-Bold',
            fontSize: 34,
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
      ),
      body: Container(
        child: datas == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(datas.avatarUrl),
                          radius: 36,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Text(
                                datas.name,
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
                          datas.bio.toString(),
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
                                datas.location,
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
                                datas.email,
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
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: AutoSizeText(
                                datas.twitterUsername,
                                style: TextStyle(fontSize: 18),
                                maxLines: 2,
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
                              Icons.link_outlined,
                              color: Colors.grey,
                              size: 20,
                            ),
                            GestureDetector(
                              onTap: () => launch(datas.blog),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: AutoSizeText(
                                  datas.blog.substring(24),
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: 'SF-Pro-Text-Medium'),
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
                                "${datas.followers} Followers | ${datas.following} Following",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'SF-Pro-Text-Medium'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
