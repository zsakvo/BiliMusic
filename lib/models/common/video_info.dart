// To parse this JSON data, do
//
//     final videoInfoResponse = videoInfoResponseFromMap(jsonString);

import 'dart:convert';

class VideoInfoResponse {
  int? code;
  String? message;
  int? ttl;
  VideoInfoResponseData? data;

  VideoInfoResponse({
    this.code,
    this.message,
    this.ttl,
    this.data,
  });

  VideoInfoResponse copyWith({
    int? code,
    String? message,
    int? ttl,
    VideoInfoResponseData? data,
  }) =>
      VideoInfoResponse(
        code: code ?? this.code,
        message: message ?? this.message,
        ttl: ttl ?? this.ttl,
        data: data ?? this.data,
      );

  factory VideoInfoResponse.fromJson(String str) =>
      VideoInfoResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VideoInfoResponse.fromMap(Map<String, dynamic> json) =>
      VideoInfoResponse(
        code: json["code"],
        message: json["message"],
        ttl: json["ttl"],
        data: json["data"] == null
            ? null
            : VideoInfoResponseData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "ttl": ttl,
        "data": data?.toMap(),
      };
}

class VideoInfoResponseData {
  String? bvid;
  int? aid;
  int? videos;
  int? tid;
  String? tname;
  int? copyright;
  String? pic;
  String? title;
  int? pubdate;
  int? ctime;
  String? desc;
  List<DescV2>? descV2;
  int? state;
  int? duration;
  int? missionId;
  Map<String, int>? rights;
  Owner? owner;
  Stat? stat;
  String? dataDynamic;
  int? cid;
  Dimension? dimension;
  int? seasonId;
  dynamic premiere;
  int? teenageMode;
  bool? isChargeableSeason;
  bool? isStory;
  bool? isUpowerExclusive;
  bool? isUpowerPlay;
  int? enableVt;
  bool? noCache;
  List<Page>? pages;
  Subtitle? subtitle;
  UgcSeason? ugcSeason;
  bool? isSeasonDisplay;
  UserGarb? userGarb;
  HonorReply? honorReply;
  String? likeIcon;
  bool? needJumpBv;

  VideoInfoResponseData({
    this.bvid,
    this.aid,
    this.videos,
    this.tid,
    this.tname,
    this.copyright,
    this.pic,
    this.title,
    this.pubdate,
    this.ctime,
    this.desc,
    this.descV2,
    this.state,
    this.duration,
    this.missionId,
    this.rights,
    this.owner,
    this.stat,
    this.dataDynamic,
    this.cid,
    this.dimension,
    this.seasonId,
    this.premiere,
    this.teenageMode,
    this.isChargeableSeason,
    this.isStory,
    this.isUpowerExclusive,
    this.isUpowerPlay,
    this.enableVt,
    this.noCache,
    this.pages,
    this.subtitle,
    this.ugcSeason,
    this.isSeasonDisplay,
    this.userGarb,
    this.honorReply,
    this.likeIcon,
    this.needJumpBv,
  });

  VideoInfoResponseData copyWith({
    String? bvid,
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
    List<DescV2>? descV2,
    int? state,
    int? duration,
    int? missionId,
    Map<String, int>? rights,
    Owner? owner,
    Stat? stat,
    String? dataDynamic,
    int? cid,
    Dimension? dimension,
    int? seasonId,
    dynamic premiere,
    int? teenageMode,
    bool? isChargeableSeason,
    bool? isStory,
    bool? isUpowerExclusive,
    bool? isUpowerPlay,
    int? enableVt,
    bool? noCache,
    List<Page>? pages,
    Subtitle? subtitle,
    UgcSeason? ugcSeason,
    bool? isSeasonDisplay,
    UserGarb? userGarb,
    HonorReply? honorReply,
    String? likeIcon,
    bool? needJumpBv,
  }) =>
      VideoInfoResponseData(
        bvid: bvid ?? this.bvid,
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
        descV2: descV2 ?? this.descV2,
        state: state ?? this.state,
        duration: duration ?? this.duration,
        missionId: missionId ?? this.missionId,
        rights: rights ?? this.rights,
        owner: owner ?? this.owner,
        stat: stat ?? this.stat,
        dataDynamic: dataDynamic ?? this.dataDynamic,
        cid: cid ?? this.cid,
        dimension: dimension ?? this.dimension,
        seasonId: seasonId ?? this.seasonId,
        premiere: premiere ?? this.premiere,
        teenageMode: teenageMode ?? this.teenageMode,
        isChargeableSeason: isChargeableSeason ?? this.isChargeableSeason,
        isStory: isStory ?? this.isStory,
        isUpowerExclusive: isUpowerExclusive ?? this.isUpowerExclusive,
        isUpowerPlay: isUpowerPlay ?? this.isUpowerPlay,
        enableVt: enableVt ?? this.enableVt,
        noCache: noCache ?? this.noCache,
        pages: pages ?? this.pages,
        subtitle: subtitle ?? this.subtitle,
        ugcSeason: ugcSeason ?? this.ugcSeason,
        isSeasonDisplay: isSeasonDisplay ?? this.isSeasonDisplay,
        userGarb: userGarb ?? this.userGarb,
        honorReply: honorReply ?? this.honorReply,
        likeIcon: likeIcon ?? this.likeIcon,
        needJumpBv: needJumpBv ?? this.needJumpBv,
      );

  factory VideoInfoResponseData.fromJson(String str) =>
      VideoInfoResponseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VideoInfoResponseData.fromMap(Map<String, dynamic> json) =>
      VideoInfoResponseData(
        bvid: json["bvid"],
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
        descV2: json["desc_v2"] == null
            ? []
            : List<DescV2>.from(json["desc_v2"]!.map((x) => DescV2.fromMap(x))),
        state: json["state"],
        duration: json["duration"],
        missionId: json["mission_id"],
        rights: Map.from(json["rights"]!)
            .map((k, v) => MapEntry<String, int>(k, v)),
        owner: json["owner"] == null ? null : Owner.fromMap(json["owner"]),
        stat: json["stat"] == null ? null : Stat.fromMap(json["stat"]),
        dataDynamic: json["dynamic"],
        cid: json["cid"],
        dimension: json["dimension"] == null
            ? null
            : Dimension.fromMap(json["dimension"]),
        seasonId: json["season_id"],
        premiere: json["premiere"],
        teenageMode: json["teenage_mode"],
        isChargeableSeason: json["is_chargeable_season"],
        isStory: json["is_story"],
        isUpowerExclusive: json["is_upower_exclusive"],
        isUpowerPlay: json["is_upower_play"],
        enableVt: json["enable_vt"],
        noCache: json["no_cache"],
        pages: json["pages"] == null
            ? []
            : List<Page>.from(json["pages"]!.map((x) => Page.fromMap(x))),
        subtitle: json["subtitle"] == null
            ? null
            : Subtitle.fromMap(json["subtitle"]),
        ugcSeason: json["ugc_season"] == null
            ? null
            : UgcSeason.fromMap(json["ugc_season"]),
        isSeasonDisplay: json["is_season_display"],
        userGarb: json["user_garb"] == null
            ? null
            : UserGarb.fromMap(json["user_garb"]),
        honorReply: json["honor_reply"] == null
            ? null
            : HonorReply.fromMap(json["honor_reply"]),
        likeIcon: json["like_icon"],
        needJumpBv: json["need_jump_bv"],
      );

  Map<String, dynamic> toMap() => {
        "bvid": bvid,
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
        "desc_v2": descV2 == null
            ? []
            : List<dynamic>.from(descV2!.map((x) => x.toMap())),
        "state": state,
        "duration": duration,
        "mission_id": missionId,
        "rights":
            Map.from(rights!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "owner": owner?.toMap(),
        "stat": stat?.toMap(),
        "dynamic": dataDynamic,
        "cid": cid,
        "dimension": dimension?.toMap(),
        "season_id": seasonId,
        "premiere": premiere,
        "teenage_mode": teenageMode,
        "is_chargeable_season": isChargeableSeason,
        "is_story": isStory,
        "is_upower_exclusive": isUpowerExclusive,
        "is_upower_play": isUpowerPlay,
        "enable_vt": enableVt,
        "no_cache": noCache,
        "pages": pages == null
            ? []
            : List<dynamic>.from(pages!.map((x) => x.toMap())),
        "subtitle": subtitle?.toMap(),
        "ugc_season": ugcSeason?.toMap(),
        "is_season_display": isSeasonDisplay,
        "user_garb": userGarb?.toMap(),
        "honor_reply": honorReply?.toMap(),
        "like_icon": likeIcon,
        "need_jump_bv": needJumpBv,
      };
}

class DescV2 {
  String? rawText;
  int? type;
  int? bizId;

  DescV2({
    this.rawText,
    this.type,
    this.bizId,
  });

  DescV2 copyWith({
    String? rawText,
    int? type,
    int? bizId,
  }) =>
      DescV2(
        rawText: rawText ?? this.rawText,
        type: type ?? this.type,
        bizId: bizId ?? this.bizId,
      );

  factory DescV2.fromJson(String str) => DescV2.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DescV2.fromMap(Map<String, dynamic> json) => DescV2(
        rawText: json["raw_text"],
        type: json["type"],
        bizId: json["biz_id"],
      );

  Map<String, dynamic> toMap() => {
        "raw_text": rawText,
        "type": type,
        "biz_id": bizId,
      };
}

class Dimension {
  int? width;
  int? height;
  int? rotate;

  Dimension({
    this.width,
    this.height,
    this.rotate,
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

class HonorReply {
  List<Honor>? honor;

  HonorReply({
    this.honor,
  });

  HonorReply copyWith({
    List<Honor>? honor,
  }) =>
      HonorReply(
        honor: honor ?? this.honor,
      );

  factory HonorReply.fromJson(String str) =>
      HonorReply.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HonorReply.fromMap(Map<String, dynamic> json) => HonorReply(
        honor: json["honor"] == null
            ? []
            : List<Honor>.from(json["honor"]!.map((x) => Honor.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "honor": honor == null
            ? []
            : List<dynamic>.from(honor!.map((x) => x.toMap())),
      };
}

class Honor {
  int? aid;
  int? type;
  String? desc;
  int? weeklyRecommendNum;

  Honor({
    this.aid,
    this.type,
    this.desc,
    this.weeklyRecommendNum,
  });

  Honor copyWith({
    int? aid,
    int? type,
    String? desc,
    int? weeklyRecommendNum,
  }) =>
      Honor(
        aid: aid ?? this.aid,
        type: type ?? this.type,
        desc: desc ?? this.desc,
        weeklyRecommendNum: weeklyRecommendNum ?? this.weeklyRecommendNum,
      );

  factory Honor.fromJson(String str) => Honor.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Honor.fromMap(Map<String, dynamic> json) => Honor(
        aid: json["aid"],
        type: json["type"],
        desc: json["desc"],
        weeklyRecommendNum: json["weekly_recommend_num"],
      );

  Map<String, dynamic> toMap() => {
        "aid": aid,
        "type": type,
        "desc": desc,
        "weekly_recommend_num": weeklyRecommendNum,
      };
}

class Owner {
  int? mid;
  String? name;
  String? face;

  Owner({
    this.mid,
    this.name,
    this.face,
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

class Page {
  int? cid;
  int? page;
  From? from;
  String? pagePart;
  int? duration;
  String? vid;
  String? weblink;
  Dimension? dimension;
  String? firstFrame;

  Page({
    this.cid,
    this.page,
    this.from,
    this.pagePart,
    this.duration,
    this.vid,
    this.weblink,
    this.dimension,
    this.firstFrame,
  });

  Page copyWith({
    int? cid,
    int? page,
    From? from,
    String? pagePart,
    int? duration,
    String? vid,
    String? weblink,
    Dimension? dimension,
    String? firstFrame,
  }) =>
      Page(
        cid: cid ?? this.cid,
        page: page ?? this.page,
        from: from ?? this.from,
        pagePart: pagePart ?? this.pagePart,
        duration: duration ?? this.duration,
        vid: vid ?? this.vid,
        weblink: weblink ?? this.weblink,
        dimension: dimension ?? this.dimension,
        firstFrame: firstFrame ?? this.firstFrame,
      );

  factory Page.fromJson(String str) => Page.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Page.fromMap(Map<String, dynamic> json) => Page(
        cid: json["cid"],
        page: json["page"],
        from: fromValues.map[json["from"]]!,
        pagePart: json["part"],
        duration: json["duration"],
        vid: json["vid"],
        weblink: json["weblink"],
        dimension: json["dimension"] == null
            ? null
            : Dimension.fromMap(json["dimension"]),
        firstFrame: json["first_frame"],
      );

  Map<String, dynamic> toMap() => {
        "cid": cid,
        "page": page,
        "from": fromValues.reverse[from],
        "part": pagePart,
        "duration": duration,
        "vid": vid,
        "weblink": weblink,
        "dimension": dimension?.toMap(),
        "first_frame": firstFrame,
      };
}

// ignore: constant_identifier_names
enum From { VUPLOAD }

final fromValues = EnumValues({"vupload": From.VUPLOAD});

class Stat {
  int? aid;
  int? view;
  int? danmaku;
  int? reply;
  int? favorite;
  int? coin;
  int? share;
  int? nowRank;
  int? hisRank;
  int? like;
  int? dislike;
  String? evaluation;
  String? argueMsg;
  int? vt;
  int? fav;
  int? vv;

  Stat({
    this.aid,
    this.view,
    this.danmaku,
    this.reply,
    this.favorite,
    this.coin,
    this.share,
    this.nowRank,
    this.hisRank,
    this.like,
    this.dislike,
    this.evaluation,
    this.argueMsg,
    this.vt,
    this.fav,
    this.vv,
  });

  Stat copyWith({
    int? aid,
    int? view,
    int? danmaku,
    int? reply,
    int? favorite,
    int? coin,
    int? share,
    int? nowRank,
    int? hisRank,
    int? like,
    int? dislike,
    String? evaluation,
    String? argueMsg,
    int? vt,
    int? fav,
    int? vv,
  }) =>
      Stat(
        aid: aid ?? this.aid,
        view: view ?? this.view,
        danmaku: danmaku ?? this.danmaku,
        reply: reply ?? this.reply,
        favorite: favorite ?? this.favorite,
        coin: coin ?? this.coin,
        share: share ?? this.share,
        nowRank: nowRank ?? this.nowRank,
        hisRank: hisRank ?? this.hisRank,
        like: like ?? this.like,
        dislike: dislike ?? this.dislike,
        evaluation: evaluation ?? this.evaluation,
        argueMsg: argueMsg ?? this.argueMsg,
        vt: vt ?? this.vt,
        fav: fav ?? this.fav,
        vv: vv ?? this.vv,
      );

  factory Stat.fromJson(String str) => Stat.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Stat.fromMap(Map<String, dynamic> json) => Stat(
        aid: json["aid"],
        view: json["view"],
        danmaku: json["danmaku"],
        reply: json["reply"],
        favorite: json["favorite"],
        coin: json["coin"],
        share: json["share"],
        nowRank: json["now_rank"],
        hisRank: json["his_rank"],
        like: json["like"],
        dislike: json["dislike"],
        evaluation: json["evaluation"],
        argueMsg: json["argue_msg"],
        vt: json["vt"],
        fav: json["fav"],
        vv: json["vv"],
      );

  Map<String, dynamic> toMap() => {
        "aid": aid,
        "view": view,
        "danmaku": danmaku,
        "reply": reply,
        "favorite": favorite,
        "coin": coin,
        "share": share,
        "now_rank": nowRank,
        "his_rank": hisRank,
        "like": like,
        "dislike": dislike,
        "evaluation": evaluation,
        "argue_msg": argueMsg,
        "vt": vt,
        "fav": fav,
        "vv": vv,
      };
}

class Subtitle {
  bool? allowSubmit;
  List<ListElement>? list;

  Subtitle({
    this.allowSubmit,
    this.list,
  });

  Subtitle copyWith({
    bool? allowSubmit,
    List<ListElement>? list,
  }) =>
      Subtitle(
        allowSubmit: allowSubmit ?? this.allowSubmit,
        list: list ?? this.list,
      );

  factory Subtitle.fromJson(String str) => Subtitle.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Subtitle.fromMap(Map<String, dynamic> json) => Subtitle(
        allowSubmit: json["allow_submit"],
        list: json["list"] == null
            ? []
            : List<ListElement>.from(
                json["list"]!.map((x) => ListElement.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "allow_submit": allowSubmit,
        "list":
            list == null ? [] : List<dynamic>.from(list!.map((x) => x.toMap())),
      };
}

class ListElement {
  double? id;
  String? lan;
  String? lanDoc;
  bool? isLock;
  String? subtitleUrl;
  int? type;
  String? idStr;
  int? aiType;
  int? aiStatus;
  Author? author;

  ListElement({
    this.id,
    this.lan,
    this.lanDoc,
    this.isLock,
    this.subtitleUrl,
    this.type,
    this.idStr,
    this.aiType,
    this.aiStatus,
    this.author,
  });

  ListElement copyWith({
    double? id,
    String? lan,
    String? lanDoc,
    bool? isLock,
    String? subtitleUrl,
    int? type,
    String? idStr,
    int? aiType,
    int? aiStatus,
    Author? author,
  }) =>
      ListElement(
        id: id ?? this.id,
        lan: lan ?? this.lan,
        lanDoc: lanDoc ?? this.lanDoc,
        isLock: isLock ?? this.isLock,
        subtitleUrl: subtitleUrl ?? this.subtitleUrl,
        type: type ?? this.type,
        idStr: idStr ?? this.idStr,
        aiType: aiType ?? this.aiType,
        aiStatus: aiStatus ?? this.aiStatus,
        author: author ?? this.author,
      );

  factory ListElement.fromJson(String str) =>
      ListElement.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListElement.fromMap(Map<String, dynamic> json) => ListElement(
        id: json["id"]?.toDouble(),
        lan: json["lan"],
        lanDoc: json["lan_doc"],
        isLock: json["is_lock"],
        subtitleUrl: json["subtitle_url"],
        type: json["type"],
        idStr: json["id_str"],
        aiType: json["ai_type"],
        aiStatus: json["ai_status"],
        author: json["author"] == null ? null : Author.fromMap(json["author"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "lan": lan,
        "lan_doc": lanDoc,
        "is_lock": isLock,
        "subtitle_url": subtitleUrl,
        "type": type,
        "id_str": idStr,
        "ai_type": aiType,
        "ai_status": aiStatus,
        "author": author?.toMap(),
      };
}

class Author {
  int? mid;
  String? name;
  String? sex;
  String? face;
  String? sign;
  int? rank;
  int? birthday;
  int? isFakeAccount;
  int? isDeleted;
  int? inRegAudit;
  int? isSeniorMember;

  Author({
    this.mid,
    this.name,
    this.sex,
    this.face,
    this.sign,
    this.rank,
    this.birthday,
    this.isFakeAccount,
    this.isDeleted,
    this.inRegAudit,
    this.isSeniorMember,
  });

  Author copyWith({
    int? mid,
    String? name,
    String? sex,
    String? face,
    String? sign,
    int? rank,
    int? birthday,
    int? isFakeAccount,
    int? isDeleted,
    int? inRegAudit,
    int? isSeniorMember,
  }) =>
      Author(
        mid: mid ?? this.mid,
        name: name ?? this.name,
        sex: sex ?? this.sex,
        face: face ?? this.face,
        sign: sign ?? this.sign,
        rank: rank ?? this.rank,
        birthday: birthday ?? this.birthday,
        isFakeAccount: isFakeAccount ?? this.isFakeAccount,
        isDeleted: isDeleted ?? this.isDeleted,
        inRegAudit: inRegAudit ?? this.inRegAudit,
        isSeniorMember: isSeniorMember ?? this.isSeniorMember,
      );

  factory Author.fromJson(String str) => Author.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Author.fromMap(Map<String, dynamic> json) => Author(
        mid: json["mid"],
        name: json["name"],
        sex: json["sex"],
        face: json["face"],
        sign: json["sign"],
        rank: json["rank"],
        birthday: json["birthday"],
        isFakeAccount: json["is_fake_account"],
        isDeleted: json["is_deleted"],
        inRegAudit: json["in_reg_audit"],
        isSeniorMember: json["is_senior_member"],
      );

  Map<String, dynamic> toMap() => {
        "mid": mid,
        "name": name,
        "sex": sex,
        "face": face,
        "sign": sign,
        "rank": rank,
        "birthday": birthday,
        "is_fake_account": isFakeAccount,
        "is_deleted": isDeleted,
        "in_reg_audit": inRegAudit,
        "is_senior_member": isSeniorMember,
      };
}

class UgcSeason {
  int? id;
  String? title;
  String? cover;
  int? mid;
  String? intro;
  int? signState;
  int? attribute;
  List<Section>? sections;
  Map<String, int>? stat;
  int? epCount;
  int? seasonType;
  bool? isPaySeason;
  int? enableVt;

  UgcSeason({
    this.id,
    this.title,
    this.cover,
    this.mid,
    this.intro,
    this.signState,
    this.attribute,
    this.sections,
    this.stat,
    this.epCount,
    this.seasonType,
    this.isPaySeason,
    this.enableVt,
  });

  UgcSeason copyWith({
    int? id,
    String? title,
    String? cover,
    int? mid,
    String? intro,
    int? signState,
    int? attribute,
    List<Section>? sections,
    Map<String, int>? stat,
    int? epCount,
    int? seasonType,
    bool? isPaySeason,
    int? enableVt,
  }) =>
      UgcSeason(
        id: id ?? this.id,
        title: title ?? this.title,
        cover: cover ?? this.cover,
        mid: mid ?? this.mid,
        intro: intro ?? this.intro,
        signState: signState ?? this.signState,
        attribute: attribute ?? this.attribute,
        sections: sections ?? this.sections,
        stat: stat ?? this.stat,
        epCount: epCount ?? this.epCount,
        seasonType: seasonType ?? this.seasonType,
        isPaySeason: isPaySeason ?? this.isPaySeason,
        enableVt: enableVt ?? this.enableVt,
      );

  factory UgcSeason.fromJson(String str) => UgcSeason.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UgcSeason.fromMap(Map<String, dynamic> json) => UgcSeason(
        id: json["id"],
        title: json["title"],
        cover: json["cover"],
        mid: json["mid"],
        intro: json["intro"],
        signState: json["sign_state"],
        attribute: json["attribute"],
        sections: json["sections"] == null
            ? []
            : List<Section>.from(
                json["sections"]!.map((x) => Section.fromMap(x))),
        stat:
            Map.from(json["stat"]!).map((k, v) => MapEntry<String, int>(k, v)),
        epCount: json["ep_count"],
        seasonType: json["season_type"],
        isPaySeason: json["is_pay_season"],
        enableVt: json["enable_vt"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "cover": cover,
        "mid": mid,
        "intro": intro,
        "sign_state": signState,
        "attribute": attribute,
        "sections": sections == null
            ? []
            : List<dynamic>.from(sections!.map((x) => x.toMap())),
        "stat": Map.from(stat!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "ep_count": epCount,
        "season_type": seasonType,
        "is_pay_season": isPaySeason,
        "enable_vt": enableVt,
      };
}

class Section {
  int? seasonId;
  int? id;
  String? title;
  int? type;
  List<Episode>? episodes;

  Section({
    this.seasonId,
    this.id,
    this.title,
    this.type,
    this.episodes,
  });

  Section copyWith({
    int? seasonId,
    int? id,
    String? title,
    int? type,
    List<Episode>? episodes,
  }) =>
      Section(
        seasonId: seasonId ?? this.seasonId,
        id: id ?? this.id,
        title: title ?? this.title,
        type: type ?? this.type,
        episodes: episodes ?? this.episodes,
      );

  factory Section.fromJson(String str) => Section.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Section.fromMap(Map<String, dynamic> json) => Section(
        seasonId: json["season_id"],
        id: json["id"],
        title: json["title"],
        type: json["type"],
        episodes: json["episodes"] == null
            ? []
            : List<Episode>.from(
                json["episodes"]!.map((x) => Episode.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "season_id": seasonId,
        "id": id,
        "title": title,
        "type": type,
        "episodes": episodes == null
            ? []
            : List<dynamic>.from(episodes!.map((x) => x.toMap())),
      };
}

class Episode {
  int? seasonId;
  int? sectionId;
  int? id;
  int? aid;
  int? cid;
  String? title;
  int? attribute;
  Arc? arc;
  Page? page;
  String? bvid;

  Episode({
    this.seasonId,
    this.sectionId,
    this.id,
    this.aid,
    this.cid,
    this.title,
    this.attribute,
    this.arc,
    this.page,
    this.bvid,
  });

  Episode copyWith({
    int? seasonId,
    int? sectionId,
    int? id,
    int? aid,
    int? cid,
    String? title,
    int? attribute,
    Arc? arc,
    Page? page,
    String? bvid,
  }) =>
      Episode(
        seasonId: seasonId ?? this.seasonId,
        sectionId: sectionId ?? this.sectionId,
        id: id ?? this.id,
        aid: aid ?? this.aid,
        cid: cid ?? this.cid,
        title: title ?? this.title,
        attribute: attribute ?? this.attribute,
        arc: arc ?? this.arc,
        page: page ?? this.page,
        bvid: bvid ?? this.bvid,
      );

  factory Episode.fromJson(String str) => Episode.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Episode.fromMap(Map<String, dynamic> json) => Episode(
        seasonId: json["season_id"],
        sectionId: json["section_id"],
        id: json["id"],
        aid: json["aid"],
        cid: json["cid"],
        title: json["title"],
        attribute: json["attribute"],
        arc: json["arc"] == null ? null : Arc.fromMap(json["arc"]),
        page: json["page"] == null ? null : Page.fromMap(json["page"]),
        bvid: json["bvid"],
      );

  Map<String, dynamic> toMap() => {
        "season_id": seasonId,
        "section_id": sectionId,
        "id": id,
        "aid": aid,
        "cid": cid,
        "title": title,
        "attribute": attribute,
        "arc": arc?.toMap(),
        "page": page?.toMap(),
        "bvid": bvid,
      };
}

class Arc {
  int? aid;
  int? videos;
  int? typeId;
  String? typeName;
  int? copyright;
  String? pic;
  String? title;
  int? pubdate;
  int? ctime;
  String? desc;
  int? state;
  int? duration;
  Map<String, int>? rights;
  Owner? author;
  Stat? stat;
  String? arcDynamic;
  Dimension? dimension;
  dynamic descV2;
  bool? isChargeableSeason;
  bool? isBlooper;
  int? enableVt;

  Arc({
    this.aid,
    this.videos,
    this.typeId,
    this.typeName,
    this.copyright,
    this.pic,
    this.title,
    this.pubdate,
    this.ctime,
    this.desc,
    this.state,
    this.duration,
    this.rights,
    this.author,
    this.stat,
    this.arcDynamic,
    this.dimension,
    this.descV2,
    this.isChargeableSeason,
    this.isBlooper,
    this.enableVt,
  });

  Arc copyWith({
    int? aid,
    int? videos,
    int? typeId,
    String? typeName,
    int? copyright,
    String? pic,
    String? title,
    int? pubdate,
    int? ctime,
    String? desc,
    int? state,
    int? duration,
    Map<String, int>? rights,
    Owner? author,
    Stat? stat,
    String? arcDynamic,
    Dimension? dimension,
    dynamic descV2,
    bool? isChargeableSeason,
    bool? isBlooper,
    int? enableVt,
  }) =>
      Arc(
        aid: aid ?? this.aid,
        videos: videos ?? this.videos,
        typeId: typeId ?? this.typeId,
        typeName: typeName ?? this.typeName,
        copyright: copyright ?? this.copyright,
        pic: pic ?? this.pic,
        title: title ?? this.title,
        pubdate: pubdate ?? this.pubdate,
        ctime: ctime ?? this.ctime,
        desc: desc ?? this.desc,
        state: state ?? this.state,
        duration: duration ?? this.duration,
        rights: rights ?? this.rights,
        author: author ?? this.author,
        stat: stat ?? this.stat,
        arcDynamic: arcDynamic ?? this.arcDynamic,
        dimension: dimension ?? this.dimension,
        descV2: descV2 ?? this.descV2,
        isChargeableSeason: isChargeableSeason ?? this.isChargeableSeason,
        isBlooper: isBlooper ?? this.isBlooper,
        enableVt: enableVt ?? this.enableVt,
      );

  factory Arc.fromJson(String str) => Arc.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Arc.fromMap(Map<String, dynamic> json) => Arc(
        aid: json["aid"],
        videos: json["videos"],
        typeId: json["type_id"],
        typeName: json["type_name"],
        copyright: json["copyright"],
        pic: json["pic"],
        title: json["title"],
        pubdate: json["pubdate"],
        ctime: json["ctime"],
        desc: json["desc"],
        state: json["state"],
        duration: json["duration"],
        rights: Map.from(json["rights"]!)
            .map((k, v) => MapEntry<String, int>(k, v)),
        author: json["author"] == null ? null : Owner.fromMap(json["author"]),
        stat: json["stat"] == null ? null : Stat.fromMap(json["stat"]),
        arcDynamic: json["dynamic"],
        dimension: json["dimension"] == null
            ? null
            : Dimension.fromMap(json["dimension"]),
        descV2: json["desc_v2"],
        isChargeableSeason: json["is_chargeable_season"],
        isBlooper: json["is_blooper"],
        enableVt: json["enable_vt"],
      );

  Map<String, dynamic> toMap() => {
        "aid": aid,
        "videos": videos,
        "type_id": typeId,
        "type_name": typeName,
        "copyright": copyright,
        "pic": pic,
        "title": title,
        "pubdate": pubdate,
        "ctime": ctime,
        "desc": desc,
        "state": state,
        "duration": duration,
        "rights":
            Map.from(rights!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "author": author?.toMap(),
        "stat": stat?.toMap(),
        "dynamic": arcDynamic,
        "dimension": dimension?.toMap(),
        "desc_v2": descV2,
        "is_chargeable_season": isChargeableSeason,
        "is_blooper": isBlooper,
        "enable_vt": enableVt,
      };
}

class UserGarb {
  String? urlImageAniCut;

  UserGarb({
    this.urlImageAniCut,
  });

  UserGarb copyWith({
    String? urlImageAniCut,
  }) =>
      UserGarb(
        urlImageAniCut: urlImageAniCut ?? this.urlImageAniCut,
      );

  factory UserGarb.fromJson(String str) => UserGarb.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserGarb.fromMap(Map<String, dynamic> json) => UserGarb(
        urlImageAniCut: json["url_image_ani_cut"],
      );

  Map<String, dynamic> toMap() => {
        "url_image_ani_cut": urlImageAniCut,
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
