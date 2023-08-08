// To parse this JSON data, do
//
//     final rankHitResponse = rankHitResponseFromMap(jsonString);

import 'dart:convert';

class RankHitResponse {
  int code;
  String msg;
  RankHitResponseData data;

  RankHitResponse({
    required this.code,
    required this.msg,
    required this.data,
  });

  RankHitResponse copyWith({
    int? code,
    String? msg,
    RankHitResponseData? data,
  }) =>
      RankHitResponse(
        code: code ?? this.code,
        msg: msg ?? this.msg,
        data: data ?? this.data,
      );

  factory RankHitResponse.fromJson(String str) => RankHitResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RankHitResponse.fromMap(Map<String, dynamic> json) => RankHitResponse(
        code: json["code"],
        msg: json["msg"],
        data: RankHitResponseData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "msg": msg,
        "data": data.toMap(),
      };
}

class RankHitResponseData {
  int curPage;
  int pageCount;
  int totalSize;
  int pageSize;
  List<Datum> data;

  RankHitResponseData({
    required this.curPage,
    required this.pageCount,
    required this.totalSize,
    required this.pageSize,
    required this.data,
  });

  RankHitResponseData copyWith({
    int? curPage,
    int? pageCount,
    int? totalSize,
    int? pageSize,
    List<Datum>? data,
  }) =>
      RankHitResponseData(
        curPage: curPage ?? this.curPage,
        pageCount: pageCount ?? this.pageCount,
        totalSize: totalSize ?? this.totalSize,
        pageSize: pageSize ?? this.pageSize,
        data: data ?? this.data,
      );

  factory RankHitResponseData.fromJson(String str) => RankHitResponseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RankHitResponseData.fromMap(Map<String, dynamic> json) => RankHitResponseData(
        curPage: json["curPage"],
        pageCount: json["pageCount"],
        totalSize: json["totalSize"],
        pageSize: json["pageSize"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "curPage": curPage,
        "pageCount": pageCount,
        "totalSize": totalSize,
        "pageSize": pageSize,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Datum {
  int menuId;
  int uid;
  Uname uname;
  String title;
  String cover;
  String intro;
  int type;
  int off;
  int ctime;
  int curtime;
  Statistic statistic;
  int snum;
  int attr;
  int isDefault;
  int collectionId;

  Datum({
    required this.menuId,
    required this.uid,
    required this.uname,
    required this.title,
    required this.cover,
    required this.intro,
    required this.type,
    required this.off,
    required this.ctime,
    required this.curtime,
    required this.statistic,
    required this.snum,
    required this.attr,
    required this.isDefault,
    required this.collectionId,
  });

  Datum copyWith({
    int? menuId,
    int? uid,
    Uname? uname,
    String? title,
    String? cover,
    String? intro,
    int? type,
    int? off,
    int? ctime,
    int? curtime,
    Statistic? statistic,
    int? snum,
    int? attr,
    int? isDefault,
    int? collectionId,
  }) =>
      Datum(
        menuId: menuId ?? this.menuId,
        uid: uid ?? this.uid,
        uname: uname ?? this.uname,
        title: title ?? this.title,
        cover: cover ?? this.cover,
        intro: intro ?? this.intro,
        type: type ?? this.type,
        off: off ?? this.off,
        ctime: ctime ?? this.ctime,
        curtime: curtime ?? this.curtime,
        statistic: statistic ?? this.statistic,
        snum: snum ?? this.snum,
        attr: attr ?? this.attr,
        isDefault: isDefault ?? this.isDefault,
        collectionId: collectionId ?? this.collectionId,
      );

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        menuId: json["menuId"],
        uid: json["uid"],
        uname: unameValues.map[json["uname"]]!,
        title: json["title"],
        cover: json["cover"],
        intro: json["intro"],
        type: json["type"],
        off: json["off"],
        ctime: json["ctime"],
        curtime: json["curtime"],
        statistic: Statistic.fromMap(json["statistic"]),
        snum: json["snum"],
        attr: json["attr"],
        isDefault: json["isDefault"],
        collectionId: json["collectionId"],
      );

  Map<String, dynamic> toMap() => {
        "menuId": menuId,
        "uid": uid,
        "uname": unameValues.reverse[uname],
        "title": title,
        "cover": cover,
        "intro": intro,
        "type": type,
        "off": off,
        "ctime": ctime,
        "curtime": curtime,
        "statistic": statistic.toMap(),
        "snum": snum,
        "attr": attr,
        "isDefault": isDefault,
        "collectionId": collectionId,
      };
}

class Statistic {
  int sid;
  int play;
  int collect;
  int comment;
  int share;

  Statistic({
    required this.sid,
    required this.play,
    required this.collect,
    required this.comment,
    required this.share,
  });

  Statistic copyWith({
    int? sid,
    int? play,
    int? collect,
    int? comment,
    int? share,
  }) =>
      Statistic(
        sid: sid ?? this.sid,
        play: play ?? this.play,
        collect: collect ?? this.collect,
        comment: comment ?? this.comment,
        share: share ?? this.share,
      );

  factory Statistic.fromJson(String str) => Statistic.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Statistic.fromMap(Map<String, dynamic> json) => Statistic(
        sid: json["sid"],
        play: json["play"],
        collect: json["collect"],
        comment: json["comment"],
        share: json["share"],
      );

  Map<String, dynamic> toMap() => {
        "sid": sid,
        "play": play,
        "collect": collect,
        "comment": comment,
        "share": share,
      };
}

// ignore: constant_identifier_names
enum Uname { EMPTY }

final unameValues = EnumValues({"大家的音乐机": Uname.EMPTY});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
