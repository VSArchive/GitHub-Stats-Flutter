import 'dart:convert';

RepoDataModel userSearchModelFromJson(String str) =>
    RepoDataModel.fromJson(json.decode(str));

String repoDataModelToJson(RepoDataModel data) => json.encode(data.toJson());

class RepoDataModel {
  RepoDataModel({
    this.name,
    this.language,
    this.forks,
  });

  String name;
  String language;
  int forks;

  factory RepoDataModel.fromJson(Map<String, dynamic> json) => RepoDataModel(
      name: json["name"],
      language: json["language"],
      forks: json["forks"]
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "language": language,
    "forks": forks,
  };
}