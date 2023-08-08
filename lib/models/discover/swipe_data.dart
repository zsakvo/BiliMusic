// To parse this JSON data, do
//
//     final discoverSwipeDataResponse = discoverSwipeDataResponseFromMap(jsonString);

import 'dart:convert';

class DiscoverSwipeDataResponse {
  AdsControl adsControl;
  int code;
  int count;
  Data data;
  String message;

  DiscoverSwipeDataResponse({
    required this.adsControl,
    required this.code,
    required this.count,
    required this.data,
    required this.message,
  });

  DiscoverSwipeDataResponse copyWith({
    AdsControl? adsControl,
    int? code,
    int? count,
    Data? data,
    String? message,
  }) =>
      DiscoverSwipeDataResponse(
        adsControl: adsControl ?? this.adsControl,
        code: code ?? this.code,
        count: count ?? this.count,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory DiscoverSwipeDataResponse.fromJson(String str) => DiscoverSwipeDataResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DiscoverSwipeDataResponse.fromMap(Map<String, dynamic> json) => DiscoverSwipeDataResponse(
        adsControl: AdsControl.fromMap(json["ads_control"]),
        code: json["code"],
        count: json["count"],
        data: Data.fromMap(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "ads_control": adsControl.toMap(),
        "code": code,
        "count": count,
        "data": data.toMap(),
        "message": message,
      };
}

class AdsControl {
  int hasDanmu;

  AdsControl({
    required this.hasDanmu,
  });

  AdsControl copyWith({
    int? hasDanmu,
  }) =>
      AdsControl(
        hasDanmu: hasDanmu ?? this.hasDanmu,
      );

  factory AdsControl.fromJson(String str) => AdsControl.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AdsControl.fromMap(Map<String, dynamic> json) => AdsControl(
        hasDanmu: json["has_danmu"],
      );

  Map<String, dynamic> toMap() => {
        "has_danmu": hasDanmu,
      };
}

class Data {
  List<SwipeCard> the4979;

  Data({
    required this.the4979,
  });

  Data copyWith({
    List<SwipeCard>? the4979,
  }) =>
      Data(
        the4979: the4979 ?? this.the4979,
      );

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        the4979: List<SwipeCard>.from(json["4979"].map((x) => SwipeCard.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "4979": List<dynamic>.from(the4979.map((x) => x.toMap())),
      };
}

class SwipeCard {
  int id;
  String contractId;
  int resId;
  int asgId;
  int posNum;
  String name;
  String pic;
  String litpic;
  String url;
  int style;
  Archive? archive;
  String agency;
  String label;
  String intro;
  int creativeType;
  String requestId;
  int srcId;
  int area;
  bool isAdLoc;
  String adCb;
  String title;
  int serverType;
  int cmMark;
  int stime;
  String mid;
  int activityType;
  int epid;
  dynamic season;
  dynamic room;
  String subTitle;
  String adDesc;
  String adverName;
  bool nullFrame;
  String picMainColor;
  int cardType;
  dynamic businessMark;
  Inline inline;
  String operater;

  SwipeCard({
    required this.id,
    required this.contractId,
    required this.resId,
    required this.asgId,
    required this.posNum,
    required this.name,
    required this.pic,
    required this.litpic,
    required this.url,
    required this.style,
    this.archive,
    required this.agency,
    required this.label,
    required this.intro,
    required this.creativeType,
    required this.requestId,
    required this.srcId,
    required this.area,
    required this.isAdLoc,
    required this.adCb,
    required this.title,
    required this.serverType,
    required this.cmMark,
    required this.stime,
    required this.mid,
    required this.activityType,
    required this.epid,
    this.season,
    this.room,
    required this.subTitle,
    required this.adDesc,
    required this.adverName,
    required this.nullFrame,
    required this.picMainColor,
    required this.cardType,
    this.businessMark,
    required this.inline,
    required this.operater,
  });

  SwipeCard copyWith({
    int? id,
    String? contractId,
    int? resId,
    int? asgId,
    int? posNum,
    String? name,
    String? pic,
    String? litpic,
    String? url,
    int? style,
    Archive? archive,
    String? agency,
    String? label,
    String? intro,
    int? creativeType,
    String? requestId,
    int? srcId,
    int? area,
    bool? isAdLoc,
    String? adCb,
    String? title,
    int? serverType,
    int? cmMark,
    int? stime,
    String? mid,
    int? activityType,
    int? epid,
    dynamic season,
    dynamic room,
    String? subTitle,
    String? adDesc,
    String? adverName,
    bool? nullFrame,
    String? picMainColor,
    int? cardType,
    dynamic businessMark,
    Inline? inline,
    String? operater,
  }) =>
      SwipeCard(
        id: id ?? this.id,
        contractId: contractId ?? this.contractId,
        resId: resId ?? this.resId,
        asgId: asgId ?? this.asgId,
        posNum: posNum ?? this.posNum,
        name: name ?? this.name,
        pic: pic ?? this.pic,
        litpic: litpic ?? this.litpic,
        url: url ?? this.url,
        style: style ?? this.style,
        archive: archive ?? this.archive,
        agency: agency ?? this.agency,
        label: label ?? this.label,
        intro: intro ?? this.intro,
        creativeType: creativeType ?? this.creativeType,
        requestId: requestId ?? this.requestId,
        srcId: srcId ?? this.srcId,
        area: area ?? this.area,
        isAdLoc: isAdLoc ?? this.isAdLoc,
        adCb: adCb ?? this.adCb,
        title: title ?? this.title,
        serverType: serverType ?? this.serverType,
        cmMark: cmMark ?? this.cmMark,
        stime: stime ?? this.stime,
        mid: mid ?? this.mid,
        activityType: activityType ?? this.activityType,
        epid: epid ?? this.epid,
        season: season ?? this.season,
        room: room ?? this.room,
        subTitle: subTitle ?? this.subTitle,
        adDesc: adDesc ?? this.adDesc,
        adverName: adverName ?? this.adverName,
        nullFrame: nullFrame ?? this.nullFrame,
        picMainColor: picMainColor ?? this.picMainColor,
        cardType: cardType ?? this.cardType,
        businessMark: businessMark ?? this.businessMark,
        inline: inline ?? this.inline,
        operater: operater ?? this.operater,
      );

  factory SwipeCard.fromJson(String str) => SwipeCard.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SwipeCard.fromMap(Map<String, dynamic> json) => SwipeCard(
        id: json["id"],
        contractId: json["contract_id"],
        resId: json["res_id"],
        asgId: json["asg_id"],
        posNum: json["pos_num"],
        name: json["name"],
        pic: json["pic"],
        litpic: json["litpic"],
        url: json["url"],
        style: json["style"],
        archive: json.containsKey("archive") ? Archive.fromMap(json["archive"]) : null,
        agency: json["agency"],
        label: json["label"],
        intro: json["intro"],
        creativeType: json["creative_type"],
        requestId: json["request_id"],
        srcId: json["src_id"],
        area: json["area"],
        isAdLoc: json["is_ad_loc"],
        adCb: json["ad_cb"],
        title: json["title"],
        serverType: json["server_type"],
        cmMark: json["cm_mark"],
        stime: json["stime"],
        mid: json["mid"],
        activityType: json["activity_type"],
        epid: json["epid"],
        season: json["season"],
        room: json["room"],
        subTitle: json["sub_title"],
        adDesc: json["ad_desc"],
        adverName: json["adver_name"],
        nullFrame: json["null_frame"],
        picMainColor: json["pic_main_color"],
        cardType: json["card_type"],
        businessMark: json["business_mark"],
        inline: Inline.fromMap(json["inline"]),
        operater: json["operater"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "contract_id": contractId,
        "res_id": resId,
        "asg_id": asgId,
        "pos_num": posNum,
        "name": name,
        "pic": pic,
        "litpic": litpic,
        "url": url,
        "style": style,
        "archive": archive?.toMap(),
        "agency": agency,
        "label": label,
        "intro": intro,
        "creative_type": creativeType,
        "request_id": requestId,
        "src_id": srcId,
        "area": area,
        "is_ad_loc": isAdLoc,
        "ad_cb": adCb,
        "title": title,
        "server_type": serverType,
        "cm_mark": cmMark,
        "stime": stime,
        "mid": mid,
        "activity_type": activityType,
        "epid": epid,
        "season": season,
        "room": room,
        "sub_title": subTitle,
        "ad_desc": adDesc,
        "adver_name": adverName,
        "null_frame": nullFrame,
        "pic_main_color": picMainColor,
        "card_type": cardType,
        "business_mark": businessMark,
        "inline": inline.toMap(),
        "operater": operater,
      };
}

class Archive {
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
  String archiveDynamic;
  int cid;
  Dimension dimension;
  String shortLinkV2;
  String firstFrame;
  String pubLocation;
  String bvid;
  int? seasonId;

  Archive({
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
    required this.archiveDynamic,
    required this.cid,
    required this.dimension,
    required this.shortLinkV2,
    required this.firstFrame,
    required this.pubLocation,
    required this.bvid,
    this.seasonId,
  });

  Archive copyWith({
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
    String? archiveDynamic,
    int? cid,
    Dimension? dimension,
    String? shortLinkV2,
    String? firstFrame,
    String? pubLocation,
    String? bvid,
    int? seasonId,
  }) =>
      Archive(
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
        archiveDynamic: archiveDynamic ?? this.archiveDynamic,
        cid: cid ?? this.cid,
        dimension: dimension ?? this.dimension,
        shortLinkV2: shortLinkV2 ?? this.shortLinkV2,
        firstFrame: firstFrame ?? this.firstFrame,
        pubLocation: pubLocation ?? this.pubLocation,
        bvid: bvid ?? this.bvid,
        seasonId: seasonId ?? this.seasonId,
      );

  factory Archive.fromJson(String str) => Archive.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Archive.fromMap(Map<String, dynamic> json) => Archive(
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
        rights: Map.from(json["rights"]).map((k, v) => MapEntry<String, int>(k, v)),
        owner: Owner.fromMap(json["owner"]),
        stat: Map.from(json["stat"]).map((k, v) => MapEntry<String, int>(k, v)),
        archiveDynamic: json["dynamic"],
        cid: json["cid"],
        dimension: Dimension.fromMap(json["dimension"]),
        shortLinkV2: json["short_link_v2"],
        firstFrame: json["first_frame"],
        pubLocation: json["pub_location"],
        bvid: json["bvid"],
        seasonId: json["season_id"],
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
        "rights": Map.from(rights).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "owner": owner.toMap(),
        "stat": Map.from(stat).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "dynamic": archiveDynamic,
        "cid": cid,
        "dimension": dimension.toMap(),
        "short_link_v2": shortLinkV2,
        "first_frame": firstFrame,
        "pub_location": pubLocation,
        "bvid": bvid,
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

class Inline {
  int inlineUseSame;
  int inlineType;
  String inlineUrl;
  int inlineBarrageSwitch;

  Inline({
    required this.inlineUseSame,
    required this.inlineType,
    required this.inlineUrl,
    required this.inlineBarrageSwitch,
  });

  Inline copyWith({
    int? inlineUseSame,
    int? inlineType,
    String? inlineUrl,
    int? inlineBarrageSwitch,
  }) =>
      Inline(
        inlineUseSame: inlineUseSame ?? this.inlineUseSame,
        inlineType: inlineType ?? this.inlineType,
        inlineUrl: inlineUrl ?? this.inlineUrl,
        inlineBarrageSwitch: inlineBarrageSwitch ?? this.inlineBarrageSwitch,
      );

  factory Inline.fromJson(String str) => Inline.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Inline.fromMap(Map<String, dynamic> json) => Inline(
        inlineUseSame: json["inline_use_same"],
        inlineType: json["inline_type"],
        inlineUrl: json["inline_url"],
        inlineBarrageSwitch: json["inline_barrage_switch"],
      );

  Map<String, dynamic> toMap() => {
        "inline_use_same": inlineUseSame,
        "inline_type": inlineType,
        "inline_url": inlineUrl,
        "inline_barrage_switch": inlineBarrageSwitch,
      };
}
