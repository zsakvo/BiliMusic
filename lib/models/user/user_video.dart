// To parse this JSON data, do
//
//     final userVideoResponse = userVideoResponseFromMap(jsonString);

import 'dart:convert';

class UserVideoResponse {
  int code;
  String message;
  int ttl;
  Data data;

  UserVideoResponse({
    required this.code,
    required this.message,
    required this.ttl,
    required this.data,
  });

  UserVideoResponse copyWith({
    int? code,
    String? message,
    int? ttl,
    Data? data,
  }) =>
      UserVideoResponse(
        code: code ?? this.code,
        message: message ?? this.message,
        ttl: ttl ?? this.ttl,
        data: data ?? this.data,
      );

  factory UserVideoResponse.fromJson(String str) =>
      UserVideoResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserVideoResponse.fromMap(Map<String, dynamic> json) =>
      UserVideoResponse(
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
  ListClass list;
  Page page;
  EpisodicButton episodicButton;
  bool isRisk;
  int gaiaResType;
  dynamic gaiaData;

  Data({
    required this.list,
    required this.page,
    required this.episodicButton,
    required this.isRisk,
    required this.gaiaResType,
    this.gaiaData,
  });

  Data copyWith({
    ListClass? list,
    Page? page,
    EpisodicButton? episodicButton,
    bool? isRisk,
    int? gaiaResType,
    dynamic gaiaData,
  }) =>
      Data(
        list: list ?? this.list,
        page: page ?? this.page,
        episodicButton: episodicButton ?? this.episodicButton,
        isRisk: isRisk ?? this.isRisk,
        gaiaResType: gaiaResType ?? this.gaiaResType,
        gaiaData: gaiaData ?? this.gaiaData,
      );

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        list: ListClass.fromMap(json["list"]),
        page: Page.fromMap(json["page"]),
        episodicButton: EpisodicButton.fromMap(json["episodic_button"]),
        isRisk: json["is_risk"],
        gaiaResType: json["gaia_res_type"],
        gaiaData: json["gaia_data"],
      );

  Map<String, dynamic> toMap() => {
        "list": list.toMap(),
        "page": page.toMap(),
        "episodic_button": episodicButton.toMap(),
        "is_risk": isRisk,
        "gaia_res_type": gaiaResType,
        "gaia_data": gaiaData,
      };
}

class EpisodicButton {
  String text;
  String uri;

  EpisodicButton({
    required this.text,
    required this.uri,
  });

  EpisodicButton copyWith({
    String? text,
    String? uri,
  }) =>
      EpisodicButton(
        text: text ?? this.text,
        uri: uri ?? this.uri,
      );

  factory EpisodicButton.fromJson(String str) =>
      EpisodicButton.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EpisodicButton.fromMap(Map<String, dynamic> json) => EpisodicButton(
        text: json["text"],
        uri: json["uri"],
      );

  Map<String, dynamic> toMap() => {
        "text": text,
        "uri": uri,
      };
}

class ListClass {
  Map<String, Tlist> tlist;
  List<Vlist> vlist;
  List<dynamic> slist;

  ListClass({
    required this.tlist,
    required this.vlist,
    required this.slist,
  });

  ListClass copyWith({
    Map<String, Tlist>? tlist,
    List<Vlist>? vlist,
    List<dynamic>? slist,
  }) =>
      ListClass(
        tlist: tlist ?? this.tlist,
        vlist: vlist ?? this.vlist,
        slist: slist ?? this.slist,
      );

  factory ListClass.fromJson(String str) => ListClass.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListClass.fromMap(Map<String, dynamic> json) => ListClass(
        tlist: Map.from(json["tlist"])
            .map((k, v) => MapEntry<String, Tlist>(k, Tlist.fromMap(v))),
        vlist: List<Vlist>.from(json["vlist"].map((x) => Vlist.fromMap(x))),
        slist: List<dynamic>.from(json["slist"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "tlist": Map.from(tlist)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
        "vlist": List<dynamic>.from(vlist.map((x) => x.toMap())),
        "slist": List<dynamic>.from(slist.map((x) => x)),
      };
}

class Tlist {
  int tid;
  int count;
  String name;

  Tlist({
    required this.tid,
    required this.count,
    required this.name,
  });

  Tlist copyWith({
    int? tid,
    int? count,
    String? name,
  }) =>
      Tlist(
        tid: tid ?? this.tid,
        count: count ?? this.count,
        name: name ?? this.name,
      );

  factory Tlist.fromJson(String str) => Tlist.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Tlist.fromMap(Map<String, dynamic> json) => Tlist(
        tid: json["tid"],
        count: json["count"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "tid": tid,
        "count": count,
        "name": name,
      };
}

class Vlist {
  int comment;
  int typeid;
  int play;
  String pic;
  String subtitle;
  String description;
  String copyright;
  String title;
  int review;
  String author;
  int mid;
  int created;
  String length;
  int videoReview;
  int aid;
  String bvid;
  bool hideClick;
  int isPay;
  int isUnionVideo;
  int isSteinsGate;
  int isLivePlayback;
  Meta? meta;
  int isAvoided;
  int attribute;
  bool isChargingArc;
  int vt;
  int enableVt;

  Vlist({
    required this.comment,
    required this.typeid,
    required this.play,
    required this.pic,
    required this.subtitle,
    required this.description,
    required this.copyright,
    required this.title,
    required this.review,
    required this.author,
    required this.mid,
    required this.created,
    required this.length,
    required this.videoReview,
    required this.aid,
    required this.bvid,
    required this.hideClick,
    required this.isPay,
    required this.isUnionVideo,
    required this.isSteinsGate,
    required this.isLivePlayback,
    this.meta,
    required this.isAvoided,
    required this.attribute,
    required this.isChargingArc,
    required this.vt,
    required this.enableVt,
  });

  Vlist copyWith({
    int? comment,
    int? typeid,
    int? play,
    String? pic,
    String? subtitle,
    String? description,
    String? copyright,
    String? title,
    int? review,
    String? author,
    int? mid,
    int? created,
    String? length,
    int? videoReview,
    int? aid,
    String? bvid,
    bool? hideClick,
    int? isPay,
    int? isUnionVideo,
    int? isSteinsGate,
    int? isLivePlayback,
    Meta? meta,
    int? isAvoided,
    int? attribute,
    bool? isChargingArc,
    int? vt,
    int? enableVt,
  }) =>
      Vlist(
        comment: comment ?? this.comment,
        typeid: typeid ?? this.typeid,
        play: play ?? this.play,
        pic: pic ?? this.pic,
        subtitle: subtitle ?? this.subtitle,
        description: description ?? this.description,
        copyright: copyright ?? this.copyright,
        title: title ?? this.title,
        review: review ?? this.review,
        author: author ?? this.author,
        mid: mid ?? this.mid,
        created: created ?? this.created,
        length: length ?? this.length,
        videoReview: videoReview ?? this.videoReview,
        aid: aid ?? this.aid,
        bvid: bvid ?? this.bvid,
        hideClick: hideClick ?? this.hideClick,
        isPay: isPay ?? this.isPay,
        isUnionVideo: isUnionVideo ?? this.isUnionVideo,
        isSteinsGate: isSteinsGate ?? this.isSteinsGate,
        isLivePlayback: isLivePlayback ?? this.isLivePlayback,
        meta: meta ?? this.meta,
        isAvoided: isAvoided ?? this.isAvoided,
        attribute: attribute ?? this.attribute,
        isChargingArc: isChargingArc ?? this.isChargingArc,
        vt: vt ?? this.vt,
        enableVt: enableVt ?? this.enableVt,
      );

  factory Vlist.fromJson(String str) => Vlist.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Vlist.fromMap(Map<String, dynamic> json) => Vlist(
        comment: json["comment"],
        typeid: json["typeid"],
        play: json["play"],
        pic: json["pic"],
        subtitle: json["subtitle"],
        description: json["description"],
        copyright: json["copyright"],
        title: json["title"],
        review: json["review"],
        author: json["author"],
        mid: json["mid"],
        created: json["created"],
        length: json["length"],
        videoReview: json["video_review"],
        aid: json["aid"],
        bvid: json["bvid"],
        hideClick: json["hide_click"],
        isPay: json["is_pay"],
        isUnionVideo: json["is_union_video"],
        isSteinsGate: json["is_steins_gate"],
        isLivePlayback: json["is_live_playback"],
        meta: json["meta"] == null ? null : Meta.fromMap(json["meta"]),
        isAvoided: json["is_avoided"],
        attribute: json["attribute"],
        isChargingArc: json["is_charging_arc"],
        vt: json["vt"],
        enableVt: json["enable_vt"],
      );

  Map<String, dynamic> toMap() => {
        "comment": comment,
        "typeid": typeid,
        "play": play,
        "pic": pic,
        "subtitle": subtitle,
        "description": description,
        "copyright": copyright,
        "title": title,
        "review": review,
        "author": author,
        "mid": mid,
        "created": created,
        "length": length,
        "video_review": videoReview,
        "aid": aid,
        "bvid": bvid,
        "hide_click": hideClick,
        "is_pay": isPay,
        "is_union_video": isUnionVideo,
        "is_steins_gate": isSteinsGate,
        "is_live_playback": isLivePlayback,
        "meta": meta?.toMap(),
        "is_avoided": isAvoided,
        "attribute": attribute,
        "is_charging_arc": isChargingArc,
        "vt": vt,
        "enable_vt": enableVt,
      };
}

class Meta {
  int id;
  String title;
  String cover;
  int mid;
  String intro;
  int signState;
  int attribute;
  Stat stat;
  int epCount;
  int firstAid;
  int ptime;
  int epNum;

  Meta({
    required this.id,
    required this.title,
    required this.cover,
    required this.mid,
    required this.intro,
    required this.signState,
    required this.attribute,
    required this.stat,
    required this.epCount,
    required this.firstAid,
    required this.ptime,
    required this.epNum,
  });

  Meta copyWith({
    int? id,
    String? title,
    String? cover,
    int? mid,
    String? intro,
    int? signState,
    int? attribute,
    Stat? stat,
    int? epCount,
    int? firstAid,
    int? ptime,
    int? epNum,
  }) =>
      Meta(
        id: id ?? this.id,
        title: title ?? this.title,
        cover: cover ?? this.cover,
        mid: mid ?? this.mid,
        intro: intro ?? this.intro,
        signState: signState ?? this.signState,
        attribute: attribute ?? this.attribute,
        stat: stat ?? this.stat,
        epCount: epCount ?? this.epCount,
        firstAid: firstAid ?? this.firstAid,
        ptime: ptime ?? this.ptime,
        epNum: epNum ?? this.epNum,
      );

  factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        id: json["id"],
        title: json["title"],
        cover: json["cover"],
        mid: json["mid"],
        intro: json["intro"],
        signState: json["sign_state"],
        attribute: json["attribute"],
        stat: Stat.fromMap(json["stat"]),
        epCount: json["ep_count"],
        firstAid: json["first_aid"],
        ptime: json["ptime"],
        epNum: json["ep_num"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "cover": cover,
        "mid": mid,
        "intro": intro,
        "sign_state": signState,
        "attribute": attribute,
        "stat": stat.toMap(),
        "ep_count": epCount,
        "first_aid": firstAid,
        "ptime": ptime,
        "ep_num": epNum,
      };
}

class Stat {
  int seasonId;
  int view;
  int danmaku;
  int reply;
  int favorite;
  int coin;
  int share;
  int like;
  int mtime;
  int vt;
  int vv;

  Stat({
    required this.seasonId,
    required this.view,
    required this.danmaku,
    required this.reply,
    required this.favorite,
    required this.coin,
    required this.share,
    required this.like,
    required this.mtime,
    required this.vt,
    required this.vv,
  });

  Stat copyWith({
    int? seasonId,
    int? view,
    int? danmaku,
    int? reply,
    int? favorite,
    int? coin,
    int? share,
    int? like,
    int? mtime,
    int? vt,
    int? vv,
  }) =>
      Stat(
        seasonId: seasonId ?? this.seasonId,
        view: view ?? this.view,
        danmaku: danmaku ?? this.danmaku,
        reply: reply ?? this.reply,
        favorite: favorite ?? this.favorite,
        coin: coin ?? this.coin,
        share: share ?? this.share,
        like: like ?? this.like,
        mtime: mtime ?? this.mtime,
        vt: vt ?? this.vt,
        vv: vv ?? this.vv,
      );

  factory Stat.fromJson(String str) => Stat.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Stat.fromMap(Map<String, dynamic> json) => Stat(
        seasonId: json["season_id"],
        view: json["view"],
        danmaku: json["danmaku"],
        reply: json["reply"],
        favorite: json["favorite"],
        coin: json["coin"],
        share: json["share"],
        like: json["like"],
        mtime: json["mtime"],
        vt: json["vt"],
        vv: json["vv"],
      );

  Map<String, dynamic> toMap() => {
        "season_id": seasonId,
        "view": view,
        "danmaku": danmaku,
        "reply": reply,
        "favorite": favorite,
        "coin": coin,
        "share": share,
        "like": like,
        "mtime": mtime,
        "vt": vt,
        "vv": vv,
      };
}

class Page {
  int pn;
  int ps;
  int count;

  Page({
    required this.pn,
    required this.ps,
    required this.count,
  });

  Page copyWith({
    int? pn,
    int? ps,
    int? count,
  }) =>
      Page(
        pn: pn ?? this.pn,
        ps: ps ?? this.ps,
        count: count ?? this.count,
      );

  factory Page.fromJson(String str) => Page.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Page.fromMap(Map<String, dynamic> json) => Page(
        pn: json["pn"],
        ps: json["ps"],
        count: json["count"],
      );

  Map<String, dynamic> toMap() => {
        "pn": pn,
        "ps": ps,
        "count": count,
      };
}
