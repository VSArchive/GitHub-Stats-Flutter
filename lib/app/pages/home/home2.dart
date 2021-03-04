import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_stats/app/profileView/profile.dart';
import 'package:github_stats/model/mainUserDetails.dart';
import 'package:github_stats/model/usermodel.dart';
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
    final authUser = Provider.of<MainUserModel>(context);
    final api = Provider.of<Api>(context, listen: false);
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        title: Text(
          'Start',
          style: TextStyle(
            fontFamily: 'SF-Pro-Display-Bold',
            fontSize: 34,
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 8, right: 8),
          child: Column(
            children: [
              Container(
                width: double.infinity,
              ),
              Container(
                height: 45,
                child: CupertinoTextField(
                  prefix: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Icon(
                      Icons.search_outlined,
                      color: Colors.grey,
                      size: 18,
                    ),
                  ),
                  style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1)),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(118, 118, 118, 0.12),
                      borderRadius: BorderRadius.circular(5.0)),
                  placeholderStyle: TextStyle(
                    color: Color.fromRGBO(60, 60, 67, 0.60),
                  ),
                  onChanged: (value) {
                    api.previousSearch = value;
                    if (value.isEmpty || value.trim().length == 0) {
                      api.clearResults();
                    } else {
                      try {
                        api.getSearchUserInfo(value);
                        api.clearTop(value);
                      } catch (e) {
                        print(e.error);
                      }
                    }
                  },
                  onSubmitted: (value) {
                    if (value.isEmpty || value.trim().length == 0) {
                      api.clearResults();
                    } else {
                      try {
                        api.getSearchUserInfo(value);
                        api.clearTop(value);
                      } catch (e) {
                        print(e.error);
                      }
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
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.12),
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Center(
                              child: Text(
                                "No User Found",
                                style: TextStyle(
                                    fontSize: 27,
                                    fontFamily: 'SF-Pro-Text-Semibold'),
                              ),
                            ),
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                            itemCount: api.userFetchResult.length,
                            itemBuilder: (context, i) {
                              return GestureDetector(
                                onTap: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>

                                          //  FutureBuilder<UserModel>(
                                          //     future: api.getUserInfo(
                                          //         api.userFetchResult[i].login),
                                          //     builder: (context, snapshot) {
                                          //       if (snapshot.hasData) {
                                          //         return ProfileFromSerach(
                                          //           data: snapshot.data,
                                          //         );
                                          //       } else {
                                          //         return Center(
                                          //             child:
                                          //                 CircularProgressIndicator());
                                          //       }
                                          //     }),

                                          FutureProvider<UserModel>.value(
                                        initialData: null,
                                        value: api.getUserInfo(
                                            api.userFetchResult[i].login),
                                        child: ProfileFromSerach(
                                          authUsername: authUser.login,
                                          api: api,
                                          userName:
                                              api.userFetchResult[i].login,
                                        ),
                                      ),
                                    ),
                                  )
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0,
                                          color:
                                              Color.fromRGBO(60, 60, 67, 0.36)),
                                    ),
                                    color: Colors.white,
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height * 0.08,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundColor:
                                                  CupertinoColors.systemGrey,
                                              backgroundImage: NetworkImage(api
                                                  .userFetchResult[i]
                                                  .avatarUrl),
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              api.userFetchResult[i].login,
                                              style: TextStyle(
                                                decoration: TextDecoration.none,
                                                color:
                                                    Color.fromRGBO(0, 0, 0, 1),
                                                fontSize: 17.0,
                                                fontFamily:
                                                    'SF-Pro-Text-Regular',
                                              ),
                                            ),
                                          ],
                                        ),
                                        Icon(
                                          CupertinoIcons.chevron_forward,
                                          color:
                                              Color.fromRGBO(60, 60, 67, 0.30),
                                          size: 16.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                },
              ),
              // RaisedButton(
              //   onPressed: () => {
              //     api.signInWithGitHub(context).whenComplete(
              //         () => {print(FirebaseAuth.instance.currentUser)})
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
