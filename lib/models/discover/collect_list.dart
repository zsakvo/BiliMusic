// To parse this JSON data, do
//
//     final collectListResponse = collectListResponseFromMap(jsonString);

import 'dart:convert';

class CollectListResponse {
  int code;
  String message;
  int ttl;
  CollectListResponseData data;

  CollectListResponse({
    required this.code,
    required this.message,
    required this.ttl,
    required this.data,
  });

  CollectListResponse copyWith({
    int? code,
    String? message,
    int? ttl,
    CollectListResponseData? data,
  }) =>
      CollectListResponse(
        code: code ?? this.code,
        message: message ?? this.message,
        ttl: ttl ?? this.ttl,
        data: data ?? this.data,
      );

  factory CollectListResponse.fromJson(String str) => CollectListResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CollectListResponse.fromMap(Map<String, dynamic> json) => CollectListResponse(
        code: json["code"],
        message: json["message"],
        ttl: json["ttl"],
        data: CollectListResponseData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "ttl": ttl,
        "data": data.toMap(),
      };
}

class CollectListResponseData {
  int count;
  List<CollectListResponseListElement> list;
  bool hasMore;

  CollectListResponseData({
    required this.count,
    required this.list,
    required this.hasMore,
  });

  CollectListResponseData copyWith({
    int? count,
    List<CollectListResponseListElement>? list,
    bool? hasMore,
  }) =>
      CollectListResponseData(
        count: count ?? this.count,
        list: list ?? this.list,
        hasMore: hasMore ?? this.hasMore,
      );

  factory CollectListResponseData.fromJson(String str) => CollectListResponseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CollectListResponseData.fromMap(Map<String, dynamic> json) => CollectListResponseData(
        count: json["count"],
        list: List<CollectListResponseListElement>.from(
            json["list"].map((x) => CollectListResponseListElement.fromMap(x))),
        hasMore: json["has_more"],
      );

  Map<String, dynamic> toMap() => {
        "count": count,
        "list": List<dynamic>.from(list.map((x) => x.toMap())),
        "has_more": hasMore,
      };
}

class CollectListResponseListElement {
  int id;
  int fid;
  int mid;
  int attr;
  String title;
  String cover;
  Upper upper;
  int coverType;
  String intro;
  int ctime;
  int mtime;
  int state;
  int favState;
  int mediaCount;
  int viewCount;
  int vt;
  int playSwitch;
  int type;
  String link;
  String bvid;

  CollectListResponseListElement({
    required this.id,
    required this.fid,
    required this.mid,
    required this.attr,
    required this.title,
    required this.cover,
    required this.upper,
    required this.coverType,
    required this.intro,
    required this.ctime,
    required this.mtime,
    required this.state,
    required this.favState,
    required this.mediaCount,
    required this.viewCount,
    required this.vt,
    required this.playSwitch,
    required this.type,
    required this.link,
    required this.bvid,
  });

  CollectListResponseListElement copyWith({
    int? id,
    int? fid,
    int? mid,
    int? attr,
    String? title,
    String? cover,
    Upper? upper,
    int? coverType,
    String? intro,
    int? ctime,
    int? mtime,
    int? state,
    int? favState,
    int? mediaCount,
    int? viewCount,
    int? vt,
    int? playSwitch,
    int? type,
    String? link,
    String? bvid,
  }) =>
      CollectListResponseListElement(
        id: id ?? this.id,
        fid: fid ?? this.fid,
        mid: mid ?? this.mid,
        attr: attr ?? this.attr,
        title: title ?? this.title,
        cover: cover ?? this.cover,
        upper: upper ?? this.upper,
        coverType: coverType ?? this.coverType,
        intro: intro ?? this.intro,
        ctime: ctime ?? this.ctime,
        mtime: mtime ?? this.mtime,
        state: state ?? this.state,
        favState: favState ?? this.favState,
        mediaCount: mediaCount ?? this.mediaCount,
        viewCount: viewCount ?? this.viewCount,
        vt: vt ?? this.vt,
        playSwitch: playSwitch ?? this.playSwitch,
        type: type ?? this.type,
        link: link ?? this.link,
        bvid: bvid ?? this.bvid,
      );

  factory CollectListResponseListElement.fromJson(String str) =>
      CollectListResponseListElement.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CollectListResponseListElement.fromMap(Map<String, dynamic> json) => CollectListResponseListElement(
        id: json["id"],
        fid: json["fid"],
        mid: json["mid"],
        attr: json["attr"],
        title: json["title"],
        cover: json["cover"],
        upper: Upper.fromMap(json["upper"]),
        coverType: json["cover_type"],
        intro: json["intro"],
        ctime: json["ctime"],
        mtime: json["mtime"],
        state: json["state"],
        favState: json["fav_state"],
        mediaCount: json["media_count"],
        viewCount: json["view_count"],
        vt: json["vt"],
        playSwitch: json["play_switch"],
        type: json["type"],
        link: json["link"],
        bvid: json["bvid"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "fid": fid,
        "mid": mid,
        "attr": attr,
        "title": title,
        "cover": cover,
        "upper": upper.toMap(),
        "cover_type": coverType,
        "intro": intro,
        "ctime": ctime,
        "mtime": mtime,
        "state": state,
        "fav_state": favState,
        "media_count": mediaCount,
        "view_count": viewCount,
        "vt": vt,
        "play_switch": playSwitch,
        "type": type,
        "link": link,
        "bvid": bvid,
      };
}

class Upper {
  int mid;
  String name;
  String face;

  Upper({
    required this.mid,
    required this.name,
    required this.face,
  });

  Upper copyWith({
    int? mid,
    String? name,
    String? face,
  }) =>
      Upper(
        mid: mid ?? this.mid,
        name: name ?? this.name,
        face: face ?? this.face,
      );

  factory Upper.fromJson(String str) => Upper.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Upper.fromMap(Map<String, dynamic> json) => Upper(
        mid: json["mid"],
        name: json["name"],
        face: json["face"],
      );

  Map<String, dynamic> toMap() => {
        "mid": mid,
        "name": name,
        "face": face,
      };
}
