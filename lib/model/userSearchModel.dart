// To parse this JSON data, do
//
//     final userSearchModel = userSearchModelFromJson(jsonString);

import 'dart:convert';

UserSearchModel userSearchModelFromJson(String str) =>
    UserSearchModel.fromJson(json.decode(str));

String userSearchModelToJson(UserSearchModel data) =>
    json.encode(data.toJson());

class UserSearchModel {
  UserSearchModel({
    this.totalCount,
    this.incompleteResults,
    this.items,
  });

  int totalCount;
  bool incompleteResults;
  List<Item> items;

  factory UserSearchModel.fromJson(Map<String, dynamic> json) =>
      UserSearchModel(
        totalCount: json["total_count"],
        incompleteResults: json["incomplete_results"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total_count": totalCount,
        "incomplete_results": incompleteResults,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.receivedEventsUrl,
    this.type,
    this.score,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.eventsUrl,
    this.siteAdmin,
  });

  String login;
  int id;
  String nodeId;
  String avatarUrl;
  String gravatarId;
  String url;
  String htmlUrl;
  String followersUrl;
  String subscriptionsUrl;
  String organizationsUrl;
  String reposUrl;
  String receivedEventsUrl;
  String type;
  int score;
  String followingUrl;
  String gistsUrl;
  String starredUrl;
  String eventsUrl;
  bool siteAdmin;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        login: json["login"],
        id: json["id"],
        nodeId: json["node_id"],
        avatarUrl: json["avatar_url"],
        gravatarId: json["gravatar_id"],
        url: json["url"],
        htmlUrl: json["html_url"],
        followersUrl: json["followers_url"],
        subscriptionsUrl: json["subscriptions_url"],
        organizationsUrl: json["organizations_url"],
        reposUrl: json["repos_url"],
        receivedEventsUrl: json["received_events_url"],
        type: json["type"],
        score: json["score"],
        followingUrl: json["following_url"],
        gistsUrl: json["gists_url"],
        starredUrl: json["starred_url"],
        eventsUrl: json["events_url"],
        siteAdmin: json["site_admin"],
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "id": id,
        "node_id": nodeId,
        "avatar_url": avatarUrl,
        "gravatar_id": gravatarId,
        "url": url,
        "html_url": htmlUrl,
        "followers_url": followersUrl,
        "subscriptions_url": subscriptionsUrl,
        "organizations_url": organizationsUrl,
        "repos_url": reposUrl,
        "received_events_url": receivedEventsUrl,
        "type": type,
        "score": score,
        "following_url": followingUrl,
        "gists_url": gistsUrl,
        "starred_url": starredUrl,
        "events_url": eventsUrl,
        "site_admin": siteAdmin,
      };
}
