// To parse this JSON data, do
//
//     final favFolderListResponse = favFolderListResponseFromMap(jsonString);

import 'dart:convert';

class FavFolderListResponse {
  int code;
  String message;
  int ttl;
  Data data;

  FavFolderListResponse({
    required this.code,
    required this.message,
    required this.ttl,
    required this.data,
  });

  FavFolderListResponse copyWith({
    int? code,
    String? message,
    int? ttl,
    Data? data,
  }) =>
      FavFolderListResponse(
        code: code ?? this.code,
        message: message ?? this.message,
        ttl: ttl ?? this.ttl,
        data: data ?? this.data,
      );

  factory FavFolderListResponse.fromJson(String str) => FavFolderListResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FavFolderListResponse.fromMap(Map<String, dynamic> json) => FavFolderListResponse(
        code: json["code"],
        message: json["message"],
        ttl: json["ttl"],
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "ttl": ttl,
        "data": data.toMap(),
      };
}

class Data {
  int count;
  List<FavFolderList> list;
  dynamic season;

  Data({
    required this.count,
    required this.list,
    this.season,
  });

  Data copyWith({
    int? count,
    List<FavFolderList>? list,
    dynamic season,
  }) =>
      Data(
        count: count ?? this.count,
        list: list ?? this.list,
        season: season ?? this.season,
      );

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        count: json["count"],
        list: List<FavFolderList>.from(json["list"].map((x) => FavFolderList.fromMap(x))),
        season: json["season"],
      );

  Map<String, dynamic> toMap() => {
        "count": count,
        "list": List<dynamic>.from(list.map((x) => x.toMap())),
        "season": season,
      };
}

class FavFolderList {
  int id;
  int fid;
  int mid;
  int attr;
  String title;
  int favState;
  int mediaCount;

  FavFolderList({
    required this.id,
    required this.fid,
    required this.mid,
    required this.attr,
    required this.title,
    required this.favState,
    required this.mediaCount,
  });

  FavFolderList copyWith({
    int? id,
    int? fid,
    int? mid,
    int? attr,
    String? title,
    int? favState,
    int? mediaCount,
  }) =>
      FavFolderList(
        id: id ?? this.id,
        fid: fid ?? this.fid,
        mid: mid ?? this.mid,
        attr: attr ?? this.attr,
        title: title ?? this.title,
        favState: favState ?? this.favState,
        mediaCount: mediaCount ?? this.mediaCount,
      );

  factory FavFolderList.fromJson(String str) => FavFolderList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FavFolderList.fromMap(Map<String, dynamic> json) => FavFolderList(
        id: json["id"],
        fid: json["fid"],
        mid: json["mid"],
        attr: json["attr"],
        title: json["title"],
        favState: json["fav_state"],
        mediaCount: json["media_count"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "fid": fid,
        "mid": mid,
        "attr": attr,
        "title": title,
        "fav_state": favState,
        "media_count": mediaCount,
      };
}
