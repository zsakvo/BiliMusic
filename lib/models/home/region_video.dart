// To parse this JSON data, do
//
//     final regionVideoResponse = regionVideoResponseFromJson(jsonString);

import 'dart:convert';

class RegionVideoResponse {
  int code;
  String message;
  int ttl;
  RegionVideoResponseData data;

  RegionVideoResponse({
    required this.code,
    required this.message,
    required this.ttl,
    required this.data,
  });

  RegionVideoResponse copyWith({
    int? code,
    String? message,
    int? ttl,
    RegionVideoResponseData? data,
  }) =>
      RegionVideoResponse(
        code: code ?? this.code,
        message: message ?? this.message,
        ttl: ttl ?? this.ttl,
        data: data ?? this.data,
      );

  factory RegionVideoResponse.fromRawJson(String str) => RegionVideoResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RegionVideoResponse.fromJson(Map<String, dynamic> json) => RegionVideoResponse(
        code: json["code"],
        message: json["message"],
        ttl: json["ttl"],
        data: RegionVideoResponseData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "ttl": ttl,
        "data": data.toJson(),
      };
}

class RegionVideoResponseData {
  Page page;
  List<RegionVideoItem> archives;

  RegionVideoResponseData({
    required this.page,
    required this.archives,
  });

  RegionVideoResponseData copyWith({
    Page? page,
    List<RegionVideoItem>? archives,
  }) =>
      RegionVideoResponseData(
        page: page ?? this.page,
        archives: archives ?? this.archives,
      );

  factory RegionVideoResponseData.fromRawJson(String str) => RegionVideoResponseData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RegionVideoResponseData.fromJson(Map<String, dynamic> json) => RegionVideoResponseData(
        page: Page.fromJson(json["page"]),
        archives: List<RegionVideoItem>.from(json["archives"].map((x) => RegionVideoItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "page": page.toJson(),
        "archives": List<dynamic>.from(archives.map((x) => x.toJson())),
      };
}

class RegionVideoItem {
  int aid;
  int videos;
  int tid;
  Tname? tname;
  int copyright;
  String pic;
  String title;
  int pubdate;
  int ctime;
  String desc;
  int state;
  int duration;
  Map<String, int> rights;
  Owner owner;
  Map<String, int> stat;
  String archiveDynamic;
  int cid;
  Dimension dimension;
  String shortLinkV2;
  String? firstFrame;
  String? pubLocation;
  String bvid;
  int seasonType;
  bool isOgv;
  dynamic ogvInfo;
  String rcmdReason;
  int? missionId;
  int? seasonId;

  RegionVideoItem({
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
    required this.rights,
    required this.owner,
    required this.stat,
    required this.archiveDynamic,
    required this.cid,
    required this.dimension,
    required this.shortLinkV2,
    this.firstFrame,
    this.pubLocation,
    required this.bvid,
    required this.seasonType,
    required this.isOgv,
    this.ogvInfo,
    required this.rcmdReason,
    this.missionId,
    this.seasonId,
  });

  RegionVideoItem copyWith({
    int? aid,
    int? videos,
    int? tid,
    Tname? tname,
    int? copyright,
    String? pic,
    String? title,
    int? pubdate,
    int? ctime,
    String? desc,
    int? state,
    int? duration,
    Map<String, int>? rights,
    Owner? owner,
    Map<String, int>? stat,
    String? archiveDynamic,
    int? cid,
    Dimension? dimension,
    String? shortLinkV2,
    String? firstFrame,
    String? pubLocation,
    String? bvid,
    int? seasonType,
    bool? isOgv,
    dynamic ogvInfo,
    String? rcmdReason,
    int? missionId,
    int? seasonId,
  }) =>
      RegionVideoItem(
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
        rights: rights ?? this.rights,
        owner: owner ?? this.owner,
        stat: stat ?? this.stat,
        archiveDynamic: archiveDynamic ?? this.archiveDynamic,
        cid: cid ?? this.cid,
        dimension: dimension ?? this.dimension,
        shortLinkV2: shortLinkV2 ?? this.shortLinkV2,
        firstFrame: firstFrame ?? this.firstFrame,
        pubLocation: pubLocation ?? this.pubLocation,
        bvid: bvid ?? this.bvid,
        seasonType: seasonType ?? this.seasonType,
        isOgv: isOgv ?? this.isOgv,
        ogvInfo: ogvInfo ?? this.ogvInfo,
        rcmdReason: rcmdReason ?? this.rcmdReason,
        missionId: missionId ?? this.missionId,
        seasonId: seasonId ?? this.seasonId,
      );

  factory RegionVideoItem.fromRawJson(String str) => RegionVideoItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RegionVideoItem.fromJson(Map<String, dynamic> json) => RegionVideoItem(
        aid: json["aid"],
        videos: json["videos"],
        tid: json["tid"],
        tname: tnameValues.map[json["tname"]],
        copyright: json["copyright"],
        pic: json["pic"],
        title: json["title"],
        pubdate: json["pubdate"],
        ctime: json["ctime"],
        desc: json["desc"],
        state: json["state"],
        duration: json["duration"],
        rights: Map.from(json["rights"]).map((k, v) => MapEntry<String, int>(k, v)),
        owner: Owner.fromJson(json["owner"]),
        stat: Map.from(json["stat"]).map((k, v) => MapEntry<String, int>(k, v)),
        archiveDynamic: json["dynamic"],
        cid: json["cid"],
        dimension: Dimension.fromJson(json["dimension"]),
        shortLinkV2: json["short_link_v2"],
        firstFrame: json["first_frame"],
        pubLocation: json["pub_location"],
        bvid: json["bvid"],
        seasonType: json["season_type"],
        isOgv: json["is_ogv"],
        ogvInfo: json["ogv_info"],
        rcmdReason: json["rcmd_reason"],
        missionId: json["mission_id"],
        seasonId: json["season_id"],
      );

  Map<String, dynamic> toJson() => {
        "aid": aid,
        "videos": videos,
        "tid": tid,
        "tname": tnameValues.reverse[tname],
        "copyright": copyright,
        "pic": pic,
        "title": title,
        "pubdate": pubdate,
        "ctime": ctime,
        "desc": desc,
        "state": state,
        "duration": duration,
        "rights": Map.from(rights).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "owner": owner.toJson(),
        "stat": Map.from(stat).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "dynamic": archiveDynamic,
        "cid": cid,
        "dimension": dimension.toJson(),
        "short_link_v2": shortLinkV2,
        "first_frame": firstFrame,
        "pub_location": pubLocation,
        "bvid": bvid,
        "season_type": seasonType,
        "is_ogv": isOgv,
        "ogv_info": ogvInfo,
        "rcmd_reason": rcmdReason,
        "mission_id": missionId,
        "season_id": seasonId,
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

  factory Dimension.fromRawJson(String str) => Dimension.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Dimension.fromJson(Map<String, dynamic> json) => Dimension(
        width: json["width"],
        height: json["height"],
        rotate: json["rotate"],
      );

  Map<String, dynamic> toJson() => {
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

  factory Owner.fromRawJson(String str) => Owner.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        mid: json["mid"],
        name: json["name"],
        face: json["face"],
      );

  Map<String, dynamic> toJson() => {
        "mid": mid,
        "name": name,
        "face": face,
      };
}

// ignore: constant_identifier_names
enum Tname { VOCALOID_UTAU }

final tnameValues = EnumValues({"VOCALOID·UTAU": Tname.VOCALOID_UTAU});

class Page {
  int num;
  int size;
  int count;

  Page({
    required this.num,
    required this.size,
    required this.count,
  });

  Page copyWith({
    int? num,
    int? size,
    int? count,
  }) =>
      Page(
        num: num ?? this.num,
        size: size ?? this.size,
        count: count ?? this.count,
      );

  factory Page.fromRawJson(String str) => Page.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Page.fromJson(Map<String, dynamic> json) => Page(
        num: json["num"],
        size: json["size"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "num": num,
        "size": size,
        "count": count,
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
