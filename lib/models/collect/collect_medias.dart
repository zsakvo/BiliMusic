// To parse this JSON data, do
//
//     final collectMediasResponse = collectMediasResponseFromMap(jsonString);

import 'dart:convert';

class CollectMediasResponse {
  int code;
  String message;
  int ttl;
  CollectMediasResponseData data;

  CollectMediasResponse({
    required this.code,
    required this.message,
    required this.ttl,
    required this.data,
  });

  CollectMediasResponse copyWith({
    int? code,
    String? message,
    int? ttl,
    CollectMediasResponseData? data,
  }) =>
      CollectMediasResponse(
        code: code ?? this.code,
        message: message ?? this.message,
        ttl: ttl ?? this.ttl,
        data: data ?? this.data,
      );

  factory CollectMediasResponse.fromJson(String str) => CollectMediasResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CollectMediasResponse.fromMap(Map<String, dynamic> json) => CollectMediasResponse(
        code: json["code"],
        message: json["message"],
        ttl: json["ttl"],
        data: CollectMediasResponseData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "ttl": ttl,
        "data": data.toMap(),
      };
}

class CollectMediasResponseData {
  Info info;
  List<CollectMedia> medias;

  CollectMediasResponseData({
    required this.info,
    required this.medias,
  });

  CollectMediasResponseData copyWith({
    Info? info,
    List<CollectMedia>? medias,
  }) =>
      CollectMediasResponseData(
        info: info ?? this.info,
        medias: medias ?? this.medias,
      );

  factory CollectMediasResponseData.fromJson(String str) => CollectMediasResponseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CollectMediasResponseData.fromMap(Map<String, dynamic> json) => CollectMediasResponseData(
        info: Info.fromMap(json["info"]),
        medias: List<CollectMedia>.from(json["medias"].map((x) => CollectMedia.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "info": info.toMap(),
        "medias": List<dynamic>.from(medias.map((x) => x.toMap())),
      };
}

class Info {
  int id;
  int seasonType;
  String title;
  String cover;
  Upper upper;
  CntInfo cntInfo;
  int mediaCount;
  String intro;

  Info({
    required this.id,
    required this.seasonType,
    required this.title,
    required this.cover,
    required this.upper,
    required this.cntInfo,
    required this.mediaCount,
    required this.intro,
  });

  Info copyWith({
    int? id,
    int? seasonType,
    String? title,
    String? cover,
    Upper? upper,
    CntInfo? cntInfo,
    int? mediaCount,
    String? intro,
  }) =>
      Info(
        id: id ?? this.id,
        seasonType: seasonType ?? this.seasonType,
        title: title ?? this.title,
        cover: cover ?? this.cover,
        upper: upper ?? this.upper,
        cntInfo: cntInfo ?? this.cntInfo,
        mediaCount: mediaCount ?? this.mediaCount,
        intro: intro ?? this.intro,
      );

  factory Info.fromJson(String str) => Info.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Info.fromMap(Map<String, dynamic> json) => Info(
        id: json["id"],
        seasonType: json["season_type"],
        title: json["title"],
        cover: json["cover"],
        upper: Upper.fromMap(json["upper"]),
        cntInfo: CntInfo.fromMap(json["cnt_info"]),
        mediaCount: json["media_count"],
        intro: json["intro"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "season_type": seasonType,
        "title": title,
        "cover": cover,
        "upper": upper.toMap(),
        "cnt_info": cntInfo.toMap(),
        "media_count": mediaCount,
        "intro": intro,
      };
}

class CntInfo {
  int collect;
  int play;
  int danmaku;

  CntInfo({
    required this.collect,
    required this.play,
    required this.danmaku,
  });

  CntInfo copyWith({
    int? collect,
    int? play,
    int? danmaku,
  }) =>
      CntInfo(
        collect: collect ?? this.collect,
        play: play ?? this.play,
        danmaku: danmaku ?? this.danmaku,
      );

  factory CntInfo.fromJson(String str) => CntInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CntInfo.fromMap(Map<String, dynamic> json) => CntInfo(
        collect: json["collect"],
        play: json["play"],
        danmaku: json["danmaku"],
      );

  Map<String, dynamic> toMap() => {
        "collect": collect,
        "play": play,
        "danmaku": danmaku,
      };
}

class Upper {
  int mid;
  String name;

  Upper({
    required this.mid,
    required this.name,
  });

  Upper copyWith({
    int? mid,
    String? name,
  }) =>
      Upper(
        mid: mid ?? this.mid,
        name: name ?? this.name,
      );

  factory Upper.fromJson(String str) => Upper.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Upper.fromMap(Map<String, dynamic> json) => Upper(
        mid: json["mid"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "mid": mid,
        "name": name,
      };
}

// ignore: constant_identifier_names
// enum Name { JLRS_LEO_FM }

// final nameValues = EnumValues({"JLRS-LeoFM": Name.JLRS_LEO_FM});

class CollectMedia {
  int id;
  String title;
  String cover;
  int duration;
  int pubtime;
  String bvid;
  Upper upper;
  CntInfo cntInfo;

  CollectMedia({
    required this.id,
    required this.title,
    required this.cover,
    required this.duration,
    required this.pubtime,
    required this.bvid,
    required this.upper,
    required this.cntInfo,
  });

  CollectMedia copyWith({
    int? id,
    String? title,
    String? cover,
    int? duration,
    int? pubtime,
    String? bvid,
    Upper? upper,
    CntInfo? cntInfo,
  }) =>
      CollectMedia(
        id: id ?? this.id,
        title: title ?? this.title,
        cover: cover ?? this.cover,
        duration: duration ?? this.duration,
        pubtime: pubtime ?? this.pubtime,
        bvid: bvid ?? this.bvid,
        upper: upper ?? this.upper,
        cntInfo: cntInfo ?? this.cntInfo,
      );

  factory CollectMedia.fromJson(String str) => CollectMedia.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CollectMedia.fromMap(Map<String, dynamic> json) => CollectMedia(
        id: json["id"],
        title: json["title"],
        cover: json["cover"],
        duration: json["duration"],
        pubtime: json["pubtime"],
        bvid: json["bvid"],
        upper: Upper.fromMap(json["upper"]),
        cntInfo: CntInfo.fromMap(json["cnt_info"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "cover": cover,
        "duration": duration,
        "pubtime": pubtime,
        "bvid": bvid,
        "upper": upper.toMap(),
        "cnt_info": cntInfo.toMap(),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
