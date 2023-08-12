// To parse this JSON data, do
//
//     final relatedVideoResponse = relatedVideoResponseFromMap(jsonString);

import 'dart:convert';

class RelatedVideoResponse {
  int code;
  List<Datum> data;
  String message;

  RelatedVideoResponse({
    required this.code,
    required this.data,
    required this.message,
  });

  RelatedVideoResponse copyWith({
    int? code,
    List<Datum>? data,
    String? message,
  }) =>
      RelatedVideoResponse(
        code: code ?? this.code,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory RelatedVideoResponse.fromJson(String str) =>
      RelatedVideoResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RelatedVideoResponse.fromMap(Map<String, dynamic> json) =>
      RelatedVideoResponse(
        code: json["code"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "message": message,
      };
}

class Datum {
  int aid;
  int videos;
  int tid;
  String tname;
  int copyright;
  String pic;
  String title;
  int pubdate;
  int ctime;
  String desc;
  int state;
  int duration;
  int? missionId;
  Map<String, int> rights;
  Owner owner;
  Map<String, int> stat;
  String datumDynamic;
  int cid;
  Dimension dimension;
  String shortLinkV2;
  int? upFromV2;
  String? firstFrame;
  String? pubLocation;
  String vtDisplay;
  String bvid;
  int seasonType;
  bool isOgv;
  dynamic ogvInfo;
  String rcmdReason;
  int enableVt;
  int? seasonId;
  String? redirectUrl;

  Datum({
    required this.aid,
    required this.videos,
    required this.tid,
    required this.tname,
    required this.copyright,
    required this.pic,
    required this.title,
    required this.pubdate,
    required this.ctime,
    required this.desc,
    required this.state,
    required this.duration,
    this.missionId,
    required this.rights,
    required this.owner,
    required this.stat,
    required this.datumDynamic,
    required this.cid,
    required this.dimension,
    required this.shortLinkV2,
    this.upFromV2,
    this.firstFrame,
    this.pubLocation,
    required this.vtDisplay,
    required this.bvid,
    required this.seasonType,
    required this.isOgv,
    this.ogvInfo,
    required this.rcmdReason,
    required this.enableVt,
    this.seasonId,
    this.redirectUrl,
  });

  Datum copyWith({
    int? aid,
    int? videos,
    int? tid,
    String? tname,
    int? copyright,
    String? pic,
    String? title,
    int? pubdate,
    int? ctime,
    String? desc,
    int? state,
    int? duration,
    int? missionId,
    Map<String, int>? rights,
    Owner? owner,
    Map<String, int>? stat,
    String? datumDynamic,
    int? cid,
    Dimension? dimension,
    String? shortLinkV2,
    int? upFromV2,
    String? firstFrame,
    String? pubLocation,
    String? vtDisplay,
    String? bvid,
    int? seasonType,
    bool? isOgv,
    dynamic ogvInfo,
    String? rcmdReason,
    int? enableVt,
    int? seasonId,
    String? redirectUrl,
  }) =>
      Datum(
        aid: aid ?? this.aid,
        videos: videos ?? this.videos,
        tid: tid ?? this.tid,
        tname: tname ?? this.tname,
        copyright: copyright ?? this.copyright,
        pic: pic ?? this.pic,
        title: title ?? this.title,
        pubdate: pubdate ?? this.pubdate,
        ctime: ctime ?? this.ctime,
        desc: desc ?? this.desc,
        state: state ?? this.state,
        duration: duration ?? this.duration,
        missionId: missionId ?? this.missionId,
        rights: rights ?? this.rights,
        owner: owner ?? this.owner,
        stat: stat ?? this.stat,
        datumDynamic: datumDynamic ?? this.datumDynamic,
        cid: cid ?? this.cid,
        dimension: dimension ?? this.dimension,
        shortLinkV2: shortLinkV2 ?? this.shortLinkV2,
        upFromV2: upFromV2 ?? this.upFromV2,
        firstFrame: firstFrame ?? this.firstFrame,
        pubLocation: pubLocation ?? this.pubLocation,
        vtDisplay: vtDisplay ?? this.vtDisplay,
        bvid: bvid ?? this.bvid,
        seasonType: seasonType ?? this.seasonType,
        isOgv: isOgv ?? this.isOgv,
        ogvInfo: ogvInfo ?? this.ogvInfo,
        rcmdReason: rcmdReason ?? this.rcmdReason,
        enableVt: enableVt ?? this.enableVt,
        seasonId: seasonId ?? this.seasonId,
        redirectUrl: redirectUrl ?? this.redirectUrl,
      );

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        aid: json["aid"],
        videos: json["videos"],
        tid: json["tid"],
        tname: json["tname"],
        copyright: json["copyright"],
        pic: json["pic"],
        title: json["title"],
        pubdate: json["pubdate"],
        ctime: json["ctime"],
        desc: json["desc"],
        state: json["state"],
        duration: json["duration"],
        missionId: json["mission_id"],
        rights:
            Map.from(json["rights"]).map((k, v) => MapEntry<String, int>(k, v)),
        owner: Owner.fromMap(json["owner"]),
        stat: Map.from(json["stat"]).map((k, v) => MapEntry<String, int>(k, v)),
        datumDynamic: json["dynamic"],
        cid: json["cid"],
        dimension: Dimension.fromMap(json["dimension"]),
        shortLinkV2: json["short_link_v2"],
        upFromV2: json["up_from_v2"],
        firstFrame: json["first_frame"],
        pubLocation: json["pub_location"],
        vtDisplay: json["vt_display"],
        bvid: json["bvid"],
        seasonType: json["season_type"],
        isOgv: json["is_ogv"],
        ogvInfo: json["ogv_info"],
        rcmdReason: json["rcmd_reason"],
        enableVt: json["enable_vt"],
        seasonId: json["season_id"],
        redirectUrl: json["redirect_url"],
      );

  Map<String, dynamic> toMap() => {
        "aid": aid,
        "videos": videos,
        "tid": tid,
        "tname": tname,
        "copyright": copyright,
        "pic": pic,
        "title": title,
        "pubdate": pubdate,
        "ctime": ctime,
        "desc": desc,
        "state": state,
        "duration": duration,
        "mission_id": missionId,
        "rights":
            Map.from(rights).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "owner": owner.toMap(),
        "stat": Map.from(stat).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "dynamic": datumDynamic,
        "cid": cid,
        "dimension": dimension.toMap(),
        "short_link_v2": shortLinkV2,
        "up_from_v2": upFromV2,
        "first_frame": firstFrame,
        "pub_location": pubLocation,
        "vt_display": vtDisplay,
        "bvid": bvid,
        "season_type": seasonType,
        "is_ogv": isOgv,
        "ogv_info": ogvInfo,
        "rcmd_reason": rcmdReason,
        "enable_vt": enableVt,
        "season_id": seasonId,
        "redirect_url": redirectUrl,
      };
}

class Dimension {
  int width;
  int height;
  int rotate;

  Dimension({
    required this.width,
    required this.height,
    required this.rotate,
  });

  Dimension copyWith({
    int? width,
    int? height,
    int? rotate,
  }) =>
      Dimension(
        width: width ?? this.width,
        height: height ?? this.height,
        rotate: rotate ?? this.rotate,
      );

  factory Dimension.fromJson(String str) => Dimension.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Dimension.fromMap(Map<String, dynamic> json) => Dimension(
        width: json["width"],
        height: json["height"],
        rotate: json["rotate"],
      );

  Map<String, dynamic> toMap() => {
        "width": width,
        "height": height,
        "rotate": rotate,
      };
}

class Owner {
  int mid;
  String name;
  String face;

  Owner({
    required this.mid,
    required this.name,
    required this.face,
  });

  Owner copyWith({
    int? mid,
    String? name,
    String? face,
  }) =>
      Owner(
        mid: mid ?? this.mid,
        name: name ?? this.name,
        face: face ?? this.face,
      );

  factory Owner.fromJson(String str) => Owner.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Owner.fromMap(Map<String, dynamic> json) => Owner(
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
