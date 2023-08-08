// To parse this JSON data, do
//
//     final favDetailResponse = favDetailResponseFromMap(jsonString);

import 'dart:convert';

class FavDetailResponse {
  int code;
  String message;
  int ttl;
  FavDetailResponseData data;

  FavDetailResponse({
    required this.code,
    required this.message,
    required this.ttl,
    required this.data,
  });

  FavDetailResponse copyWith({
    int? code,
    String? message,
    int? ttl,
    FavDetailResponseData? data,
  }) =>
      FavDetailResponse(
        code: code ?? this.code,
        message: message ?? this.message,
        ttl: ttl ?? this.ttl,
        data: data ?? this.data,
      );

  factory FavDetailResponse.fromJson(String str) => FavDetailResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FavDetailResponse.fromMap(Map<String, dynamic> json) => FavDetailResponse(
        code: json["code"],
        message: json["message"],
        ttl: json["ttl"],
        data: FavDetailResponseData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "ttl": ttl,
        "data": data.toMap(),
      };
}

class FavDetailResponseData {
  int id;
  int fid;
  int mid;
  int attr;
  String title;
  String cover;
  Upper upper;
  int coverType;
  CntInfo cntInfo;
  int type;
  String intro;
  int ctime;
  int mtime;
  int state;
  int favState;
  int likeState;
  int mediaCount;

  FavDetailResponseData({
    required this.id,
    required this.fid,
    required this.mid,
    required this.attr,
    required this.title,
    required this.cover,
    required this.upper,
    required this.coverType,
    required this.cntInfo,
    required this.type,
    required this.intro,
    required this.ctime,
    required this.mtime,
    required this.state,
    required this.favState,
    required this.likeState,
    required this.mediaCount,
  });

  FavDetailResponseData copyWith({
    int? id,
    int? fid,
    int? mid,
    int? attr,
    String? title,
    String? cover,
    Upper? upper,
    int? coverType,
    CntInfo? cntInfo,
    int? type,
    String? intro,
    int? ctime,
    int? mtime,
    int? state,
    int? favState,
    int? likeState,
    int? mediaCount,
  }) =>
      FavDetailResponseData(
        id: id ?? this.id,
        fid: fid ?? this.fid,
        mid: mid ?? this.mid,
        attr: attr ?? this.attr,
        title: title ?? this.title,
        cover: cover ?? this.cover,
        upper: upper ?? this.upper,
        coverType: coverType ?? this.coverType,
        cntInfo: cntInfo ?? this.cntInfo,
        type: type ?? this.type,
        intro: intro ?? this.intro,
        ctime: ctime ?? this.ctime,
        mtime: mtime ?? this.mtime,
        state: state ?? this.state,
        favState: favState ?? this.favState,
        likeState: likeState ?? this.likeState,
        mediaCount: mediaCount ?? this.mediaCount,
      );

  factory FavDetailResponseData.fromJson(String str) => FavDetailResponseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FavDetailResponseData.fromMap(Map<String, dynamic> json) => FavDetailResponseData(
        id: json["id"],
        fid: json["fid"],
        mid: json["mid"],
        attr: json["attr"],
        title: json["title"],
        cover: json["cover"],
        upper: Upper.fromMap(json["upper"]),
        coverType: json["cover_type"],
        cntInfo: CntInfo.fromMap(json["cnt_info"]),
        type: json["type"],
        intro: json["intro"],
        ctime: json["ctime"],
        mtime: json["mtime"],
        state: json["state"],
        favState: json["fav_state"],
        likeState: json["like_state"],
        mediaCount: json["media_count"],
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
        "cnt_info": cntInfo.toMap(),
        "type": type,
        "intro": intro,
        "ctime": ctime,
        "mtime": mtime,
        "state": state,
        "fav_state": favState,
        "like_state": likeState,
        "media_count": mediaCount,
      };
}

class CntInfo {
  int collect;
  int play;
  int thumbUp;
  int share;

  CntInfo({
    required this.collect,
    required this.play,
    required this.thumbUp,
    required this.share,
  });

  CntInfo copyWith({
    int? collect,
    int? play,
    int? thumbUp,
    int? share,
  }) =>
      CntInfo(
        collect: collect ?? this.collect,
        play: play ?? this.play,
        thumbUp: thumbUp ?? this.thumbUp,
        share: share ?? this.share,
      );

  factory CntInfo.fromJson(String str) => CntInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CntInfo.fromMap(Map<String, dynamic> json) => CntInfo(
        collect: json["collect"],
        play: json["play"],
        thumbUp: json["thumb_up"],
        share: json["share"],
      );

  Map<String, dynamic> toMap() => {
        "collect": collect,
        "play": play,
        "thumb_up": thumbUp,
        "share": share,
      };
}

class Upper {
  int mid;
  String name;
  String face;
  bool followed;
  int vipType;
  int vipStatue;

  Upper({
    required this.mid,
    required this.name,
    required this.face,
    required this.followed,
    required this.vipType,
    required this.vipStatue,
  });

  Upper copyWith({
    int? mid,
    String? name,
    String? face,
    bool? followed,
    int? vipType,
    int? vipStatue,
  }) =>
      Upper(
        mid: mid ?? this.mid,
        name: name ?? this.name,
        face: face ?? this.face,
        followed: followed ?? this.followed,
        vipType: vipType ?? this.vipType,
        vipStatue: vipStatue ?? this.vipStatue,
      );

  factory Upper.fromJson(String str) => Upper.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Upper.fromMap(Map<String, dynamic> json) => Upper(
        mid: json["mid"],
        name: json["name"],
        face: json["face"],
        followed: json["followed"],
        vipType: json["vip_type"],
        vipStatue: json["vip_statue"],
      );

  Map<String, dynamic> toMap() => {
        "mid": mid,
        "name": name,
        "face": face,
        "followed": followed,
        "vip_type": vipType,
        "vip_statue": vipStatue,
      };
}
