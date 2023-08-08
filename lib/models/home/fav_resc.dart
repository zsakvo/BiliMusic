// To parse this JSON data, do
//
//     final favRescListResponse = favRescListResponseFromMap(jsonString);

import 'dart:convert';

class FavRescListResponse {
  int code;
  String message;
  int ttl;
  FavRescListResponseData data;

  FavRescListResponse({
    required this.code,
    required this.message,
    required this.ttl,
    required this.data,
  });

  FavRescListResponse copyWith({
    int? code,
    String? message,
    int? ttl,
    FavRescListResponseData? data,
  }) =>
      FavRescListResponse(
        code: code ?? this.code,
        message: message ?? this.message,
        ttl: ttl ?? this.ttl,
        data: data ?? this.data,
      );

  factory FavRescListResponse.fromJson(String str) => FavRescListResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FavRescListResponse.fromMap(Map<String, dynamic> json) => FavRescListResponse(
        code: json["code"],
        message: json["message"],
        ttl: json["ttl"],
        data: FavRescListResponseData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "ttl": ttl,
        "data": data.toMap(),
      };
}

class FavRescListResponseData {
  bool hasMore;
  Info info;
  List<FavMedia> medias;
  int ttl;

  FavRescListResponseData({
    required this.hasMore,
    required this.info,
    required this.medias,
    required this.ttl,
  });

  FavRescListResponseData copyWith({
    bool? hasMore,
    Info? info,
    List<FavMedia>? medias,
    int? ttl,
  }) =>
      FavRescListResponseData(
        hasMore: hasMore ?? this.hasMore,
        info: info ?? this.info,
        medias: medias ?? this.medias,
        ttl: ttl ?? this.ttl,
      );

  factory FavRescListResponseData.fromJson(String str) => FavRescListResponseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FavRescListResponseData.fromMap(Map<String, dynamic> json) => FavRescListResponseData(
        hasMore: json["has_more"],
        info: Info.fromMap(json["info"]),
        medias: List<FavMedia>.from(json["medias"].map((x) => FavMedia.fromMap(x))),
        ttl: json["ttl"],
      );

  Map<String, dynamic> toMap() => {
        "has_more": hasMore,
        "info": info.toMap(),
        "medias": List<dynamic>.from(medias.map((x) => x.toMap())),
        "ttl": ttl,
      };
}

class Info {
  int id;
  int mid;
  int coverType;
  String intro;
  int state;
  int fid;
  InfoUpper upper;
  InfoCntInfo cntInfo;
  int favState;
  int mediaCount;
  int type;
  String title;
  int ctime;
  String cover;
  int mtime;
  int likeState;
  int attr;

  Info({
    required this.id,
    required this.mid,
    required this.coverType,
    required this.intro,
    required this.state,
    required this.fid,
    required this.upper,
    required this.cntInfo,
    required this.favState,
    required this.mediaCount,
    required this.type,
    required this.title,
    required this.ctime,
    required this.cover,
    required this.mtime,
    required this.likeState,
    required this.attr,
  });

  Info copyWith({
    int? id,
    int? mid,
    int? coverType,
    String? intro,
    int? state,
    int? fid,
    InfoUpper? upper,
    InfoCntInfo? cntInfo,
    int? favState,
    int? mediaCount,
    int? type,
    String? title,
    int? ctime,
    String? cover,
    int? mtime,
    int? likeState,
    int? attr,
  }) =>
      Info(
        id: id ?? this.id,
        mid: mid ?? this.mid,
        coverType: coverType ?? this.coverType,
        intro: intro ?? this.intro,
        state: state ?? this.state,
        fid: fid ?? this.fid,
        upper: upper ?? this.upper,
        cntInfo: cntInfo ?? this.cntInfo,
        favState: favState ?? this.favState,
        mediaCount: mediaCount ?? this.mediaCount,
        type: type ?? this.type,
        title: title ?? this.title,
        ctime: ctime ?? this.ctime,
        cover: cover ?? this.cover,
        mtime: mtime ?? this.mtime,
        likeState: likeState ?? this.likeState,
        attr: attr ?? this.attr,
      );

  factory Info.fromJson(String str) => Info.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Info.fromMap(Map<String, dynamic> json) => Info(
        id: json["id"],
        mid: json["mid"],
        coverType: json["cover_type"],
        intro: json["intro"],
        state: json["state"],
        fid: json["fid"],
        upper: InfoUpper.fromMap(json["upper"]),
        cntInfo: InfoCntInfo.fromMap(json["cnt_info"]),
        favState: json["fav_state"],
        mediaCount: json["media_count"],
        type: json["type"],
        title: json["title"],
        ctime: json["ctime"],
        cover: json["cover"],
        mtime: json["mtime"],
        likeState: json["like_state"],
        attr: json["attr"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "mid": mid,
        "cover_type": coverType,
        "intro": intro,
        "state": state,
        "fid": fid,
        "upper": upper.toMap(),
        "cnt_info": cntInfo.toMap(),
        "fav_state": favState,
        "media_count": mediaCount,
        "type": type,
        "title": title,
        "ctime": ctime,
        "cover": cover,
        "mtime": mtime,
        "like_state": likeState,
        "attr": attr,
      };
}

class InfoCntInfo {
  int collect;
  int play;
  int thumbUp;
  int share;

  InfoCntInfo({
    required this.collect,
    required this.play,
    required this.thumbUp,
    required this.share,
  });

  InfoCntInfo copyWith({
    int? collect,
    int? play,
    int? thumbUp,
    int? share,
  }) =>
      InfoCntInfo(
        collect: collect ?? this.collect,
        play: play ?? this.play,
        thumbUp: thumbUp ?? this.thumbUp,
        share: share ?? this.share,
      );

  factory InfoCntInfo.fromJson(String str) => InfoCntInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory InfoCntInfo.fromMap(Map<String, dynamic> json) => InfoCntInfo(
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

class InfoUpper {
  int vipType;
  int mid;
  int vipStatue;
  String name;
  String face;
  bool followed;

  InfoUpper({
    required this.vipType,
    required this.mid,
    required this.vipStatue,
    required this.name,
    required this.face,
    required this.followed,
  });

  InfoUpper copyWith({
    int? vipType,
    int? mid,
    int? vipStatue,
    String? name,
    String? face,
    bool? followed,
  }) =>
      InfoUpper(
        vipType: vipType ?? this.vipType,
        mid: mid ?? this.mid,
        vipStatue: vipStatue ?? this.vipStatue,
        name: name ?? this.name,
        face: face ?? this.face,
        followed: followed ?? this.followed,
      );

  factory InfoUpper.fromJson(String str) => InfoUpper.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory InfoUpper.fromMap(Map<String, dynamic> json) => InfoUpper(
        vipType: json["vip_type"],
        mid: json["mid"],
        vipStatue: json["vip_statue"],
        name: json["name"],
        face: json["face"],
        followed: json["followed"],
      );

  Map<String, dynamic> toMap() => {
        "vip_type": vipType,
        "mid": mid,
        "vip_statue": vipStatue,
        "name": name,
        "face": face,
        "followed": followed,
      };
}

class FavMedia {
  int id;
  String intro;
  int pubtime;
  String bvId;
  String bvid;
  MediaUpper upper;
  MediaCntInfo cntInfo;
  String link;
  int type;
  String title;
  int favTime;
  dynamic season;
  int ctime;
  String cover;
  dynamic ogv;
  Ugc ugc;
  int page;
  int duration;
  int attr;

  FavMedia({
    required this.id,
    required this.intro,
    required this.pubtime,
    required this.bvId,
    required this.bvid,
    required this.upper,
    required this.cntInfo,
    required this.link,
    required this.type,
    required this.title,
    required this.favTime,
    this.season,
    required this.ctime,
    required this.cover,
    this.ogv,
    required this.ugc,
    required this.page,
    required this.duration,
    required this.attr,
  });

  FavMedia copyWith({
    int? id,
    String? intro,
    int? pubtime,
    String? bvId,
    String? bvid,
    MediaUpper? upper,
    MediaCntInfo? cntInfo,
    String? link,
    int? type,
    String? title,
    int? favTime,
    dynamic season,
    int? ctime,
    String? cover,
    dynamic ogv,
    Ugc? ugc,
    int? page,
    int? duration,
    int? attr,
  }) =>
      FavMedia(
        id: id ?? this.id,
        intro: intro ?? this.intro,
        pubtime: pubtime ?? this.pubtime,
        bvId: bvId ?? this.bvId,
        bvid: bvid ?? this.bvid,
        upper: upper ?? this.upper,
        cntInfo: cntInfo ?? this.cntInfo,
        link: link ?? this.link,
        type: type ?? this.type,
        title: title ?? this.title,
        favTime: favTime ?? this.favTime,
        season: season ?? this.season,
        ctime: ctime ?? this.ctime,
        cover: cover ?? this.cover,
        ogv: ogv ?? this.ogv,
        ugc: ugc ?? this.ugc,
        page: page ?? this.page,
        duration: duration ?? this.duration,
        attr: attr ?? this.attr,
      );

  factory FavMedia.fromJson(String str) => FavMedia.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FavMedia.fromMap(Map<String, dynamic> json) => FavMedia(
        id: json["id"],
        intro: json["intro"],
        pubtime: json["pubtime"],
        bvId: json["bv_id"],
        bvid: json["bvid"],
        upper: MediaUpper.fromMap(json["upper"]),
        cntInfo: MediaCntInfo.fromMap(json["cnt_info"]),
        link: json["link"],
        type: json["type"],
        title: json["title"],
        favTime: json["fav_time"],
        season: json["season"],
        ctime: json["ctime"],
        cover: json["cover"],
        ogv: json["ogv"],
        ugc: Ugc.fromMap(json["ugc"]),
        page: json["page"],
        duration: json["duration"],
        attr: json["attr"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "intro": intro,
        "pubtime": pubtime,
        "bv_id": bvId,
        "bvid": bvid,
        "upper": upper.toMap(),
        "cnt_info": cntInfo.toMap(),
        "link": link,
        "type": type,
        "title": title,
        "fav_time": favTime,
        "season": season,
        "ctime": ctime,
        "cover": cover,
        "ogv": ogv,
        "ugc": ugc.toMap(),
        "page": page,
        "duration": duration,
        "attr": attr,
      };
}

class MediaCntInfo {
  int vt;
  int reply;
  int collect;
  int play;
  int playSwitch;
  int danmaku;

  MediaCntInfo({
    required this.vt,
    required this.reply,
    required this.collect,
    required this.play,
    required this.playSwitch,
    required this.danmaku,
  });

  MediaCntInfo copyWith({
    int? vt,
    int? reply,
    int? collect,
    int? play,
    int? playSwitch,
    int? danmaku,
  }) =>
      MediaCntInfo(
        vt: vt ?? this.vt,
        reply: reply ?? this.reply,
        collect: collect ?? this.collect,
        play: play ?? this.play,
        playSwitch: playSwitch ?? this.playSwitch,
        danmaku: danmaku ?? this.danmaku,
      );

  factory MediaCntInfo.fromJson(String str) => MediaCntInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MediaCntInfo.fromMap(Map<String, dynamic> json) => MediaCntInfo(
        vt: json["vt"],
        reply: json["reply"],
        collect: json["collect"],
        play: json["play"],
        playSwitch: json["play_switch"],
        danmaku: json["danmaku"],
      );

  Map<String, dynamic> toMap() => {
        "vt": vt,
        "reply": reply,
        "collect": collect,
        "play": play,
        "play_switch": playSwitch,
        "danmaku": danmaku,
      };
}

class Ugc {
  int firstCid;

  Ugc({
    required this.firstCid,
  });

  Ugc copyWith({
    int? firstCid,
  }) =>
      Ugc(
        firstCid: firstCid ?? this.firstCid,
      );

  factory Ugc.fromJson(String str) => Ugc.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Ugc.fromMap(Map<String, dynamic> json) => Ugc(
        firstCid: json["first_cid"],
      );

  Map<String, dynamic> toMap() => {
        "first_cid": firstCid,
      };
}

class MediaUpper {
  int mid;
  String name;
  String face;

  MediaUpper({
    required this.mid,
    required this.name,
    required this.face,
  });

  MediaUpper copyWith({
    int? mid,
    String? name,
    String? face,
  }) =>
      MediaUpper(
        mid: mid ?? this.mid,
        name: name ?? this.name,
        face: face ?? this.face,
      );

  factory MediaUpper.fromJson(String str) => MediaUpper.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MediaUpper.fromMap(Map<String, dynamic> json) => MediaUpper(
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
