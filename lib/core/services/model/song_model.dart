// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

List<SongModel> usersFromJson(String str) =>
    List<SongModel>.from(json.decode(str).map((x) => SongModel.fromJson(x)));

String usersToJson(List<SongModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SongModel {
  SongModel({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  factory SongModel.fromJson(Map<String, dynamic> json) => SongModel(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}
