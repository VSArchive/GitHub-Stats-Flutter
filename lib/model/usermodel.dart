// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl = '',
    this.subscriptionsUrl,
    this.organizationsUrl = '',
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl = '',
    this.type,
    this.siteAdmin = false,
    this.name,
    this.company,
    this.blog,
    this.location,
    this.email,
    this.hireable,
    this.bio,
    this.twitterUsername,
    this.publicRepos,
    this.publicGists,
    this.followers,
    this.following,
    this.createdAt,
    this.updatedAt,
  });

  final String login;
  final int id;
  final String nodeId;
  final String avatarUrl;
  final String gravatarId;
  final String url;
  final String htmlUrl;
  final String followersUrl;
  final String followingUrl;
  final String gistsUrl;
  final String starredUrl;
  final String subscriptionsUrl;
  final String organizationsUrl;
  final String reposUrl;
  final String eventsUrl;
  final String receivedEventsUrl;
  final String type;
  final bool siteAdmin;
  final String name;
  final dynamic company;
  final String blog;
  final dynamic location;
  final dynamic email;
  final dynamic hireable;
  final String bio;
  final dynamic twitterUsername;
  final int publicRepos;
  final int publicGists;
  final int followers;
  final int following;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        login: json["login"] != null ? json["login"] : '',
        id: json["id"] != null ? json["id"] : 0,
        nodeId: json["node_id"] != null ? json["node_id"] : '',
        avatarUrl: json["avatar_url"] != null ? json["avatar_url"] : '',
        gravatarId: json["gravatar_id"] != null ? json["gravatar_id"] : '',
        url: json["url"] != null ? json["url"] : '',
        htmlUrl: json["html_url"] != null ? json["html_url"] : '',
        followersUrl:
            json["followers_url"] != null ? json["followers_url"] : '',
        followingUrl:
            json["following_url"] != null ? json["following_url"] : '',
        gistsUrl: json["gists_url"] != null ? json["gists_url"] : '',
        starredUrl: json["starred_url"] != null ? json["starred_url"] : '',
        subscriptionsUrl:
            json["subscriptions_url"] != null ? json["subscriptions_url"] : '',
        organizationsUrl:
            json["organizations_url"] != null ? json["organizations_url"] : '',
        reposUrl: json["repos_url"] != null ? json["repos_url"] : '',
        eventsUrl: json["events_url"] != null ? json["events_url"] : '',
        receivedEventsUrl: json["received_events_url"] != null
            ? json["received_events_url"]
            : '',
        type: json["type"] != null ? json["type"] : '',
        siteAdmin: json["site_admin"] != null ? json["site_admin"] : false,
        name: json["name"] != null ? json["name"] : '',
        company: json["company"] != null ? json["company"] : '',
        blog: json["blog"] != null ? json["blog"] : '',
        location: json["location"] != null ? json["location"] : '',
        email: json["email"] != null ? json["email"] : '',
        hireable: json["hireable"] != null ? json["hireable"] : '',
        bio: json["bio"] != null ? json["bio"] : '',
        twitterUsername: json["twitter_username"],
        publicRepos: json["public_repos"] != null ? json["public_repos"] : 0,
        publicGists: json["public_gists"] != null ? json["public_gists"] : 0,
        followers: json["followers"] != null ? json["followers"] : 0,
        following: json["following"] != null ? json["following"] : 0,
        createdAt: DateTime.parse(
            json["created_at"] != null ? json["created_at"] : ''),
        updatedAt: DateTime.parse(
            json["updated_at"] != null ? json["updated_at"] : ''),
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
        "following_url": followingUrl,
        "gists_url": gistsUrl,
        "starred_url": starredUrl,
        "subscriptions_url": subscriptionsUrl,
        "organizations_url": organizationsUrl,
        "repos_url": reposUrl,
        "events_url": eventsUrl,
        "received_events_url": receivedEventsUrl,
        "type": type,
        "site_admin": siteAdmin,
        "name": name,
        "company": company,
        "blog": blog,
        "location": location,
        "email": email,
        "hireable": hireable,
        "bio": bio,
        "twitter_username": twitterUsername,
        "public_repos": publicRepos,
        "public_gists": publicGists,
        "followers": followers,
        "following": following,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
