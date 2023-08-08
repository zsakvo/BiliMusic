// To parse this JSON data, do
//
//     final rankingRegionVideosResponse = rankingRegionVideosResponseFromMap(jsonString);

import 'dart:convert';

class RankingRegionVideosResponse {
  int code;
  String message;
  int ttl;
  List<RankingRegionVideosResponseData> data;

  RankingRegionVideosResponse({
    required this.code,
    required this.message,
    required this.ttl,
    required this.data,
  });

  RankingRegionVideosResponse copyWith({
    int? code,
    String? message,
    int? ttl,
    List<RankingRegionVideosResponseData>? data,
  }) =>
      RankingRegionVideosResponse(
        code: code ?? this.code,
        message: message ?? this.message,
        ttl: ttl ?? this.ttl,
        data: data ?? this.data,
      );

  factory RankingRegionVideosResponse.fromJson(String str) => RankingRegionVideosResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RankingRegionVideosResponse.fromMap(Map<String, dynamic> json) => RankingRegionVideosResponse(
        code: json["code"],
        message: json["message"],
        ttl: json["ttl"],
        data: List<RankingRegionVideosResponseData>.from(
            json["data"].map((x) => RankingRegionVideosResponseData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "ttl": ttl,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class RankingRegionVideosResponseData {
  String aid;
  String bvid;
  Typename? typename;
  String title;
  String subtitle;
  int play;
  int review;
  int videoReview;
  int favorites;
  int mid;
  String author;
  String description;
  String create;
  String pic;
  int coins;
  String duration;
  bool badgepay;
  int pts;
  Map<String, int> rights;
  String redirectUrl;

  RankingRegionVideosResponseData({
    required this.aid,
    required this.bvid,
    this.typename,
    required this.title,
    required this.subtitle,
    required this.play,
    required this.review,
    required this.videoReview,
    required this.favorites,
    required this.mid,
    required this.author,
    required this.description,
    required this.create,
    required this.pic,
    required this.coins,
    required this.duration,
    required this.badgepay,
    required this.pts,
    required this.rights,
    required this.redirectUrl,
  });

  RankingRegionVideosResponseData copyWith({
    String? aid,
    String? bvid,
    Typename? typename,
    String? title,
    String? subtitle,
    int? play,
    int? review,
    int? videoReview,
    int? favorites,
    int? mid,
    String? author,
    String? description,
    String? create,
    String? pic,
    int? coins,
    String? duration,
    bool? badgepay,
    int? pts,
    Map<String, int>? rights,
    String? redirectUrl,
  }) =>
      RankingRegionVideosResponseData(
        aid: aid ?? this.aid,
        bvid: bvid ?? this.bvid,
        typename: typename ?? this.typename,
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        play: play ?? this.play,
        review: review ?? this.review,
        videoReview: videoReview ?? this.videoReview,
        favorites: favorites ?? this.favorites,
        mid: mid ?? this.mid,
        author: author ?? this.author,
        description: description ?? this.description,
        create: create ?? this.create,
        pic: pic ?? this.pic,
        coins: coins ?? this.coins,
        duration: duration ?? this.duration,
        badgepay: badgepay ?? this.badgepay,
        pts: pts ?? this.pts,
        rights: rights ?? this.rights,
        redirectUrl: redirectUrl ?? this.redirectUrl,
      );

  factory RankingRegionVideosResponseData.fromJson(String str) =>
      RankingRegionVideosResponseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RankingRegionVideosResponseData.fromMap(Map<String, dynamic> json) => RankingRegionVideosResponseData(
        aid: json["aid"],
        bvid: json["bvid"],
        typename: typenameValues.map[json["typename"]],
        title: json["title"],
        subtitle: json["subtitle"],
        play: json["play"],
        review: json["review"],
        videoReview: json["video_review"],
        favorites: json["favorites"],
        mid: json["mid"],
        author: json["author"],
        description: json["description"],
        create: json["create"],
        pic: json["pic"],
        coins: json["coins"],
        duration: json["duration"],
        badgepay: json["badgepay"],
        pts: json["pts"],
        rights: Map.from(json["rights"]).map((k, v) => MapEntry<String, int>(k, v)),
        redirectUrl: json["redirect_url"],
      );

  Map<String, dynamic> toMap() => {
        "aid": aid,
        "bvid": bvid,
        "typename": typenameValues.reverse[typename],
        "title": title,
        "subtitle": subtitle,
        "play": play,
        "review": review,
        "video_review": videoReview,
        "favorites": favorites,
        "mid": mid,
        "author": author,
        "description": description,
        "create": create,
        "pic": pic,
        "coins": coins,
        "duration": duration,
        "badgepay": badgepay,
        "pts": pts,
        "rights": Map.from(rights).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "redirect_url": redirectUrl,
      };
}

// ignore: constant_identifier_names
enum Typename { VOCALOID_UTAU }

final typenameValues = EnumValues({"VOCALOID·UTAU": Typename.VOCALOID_UTAU});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
