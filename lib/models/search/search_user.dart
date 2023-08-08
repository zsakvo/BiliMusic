// To parse this JSON data, do
//
//     final searchUserResponse = searchUserResponseFromMap(jsonString);

import 'dart:convert';

class SearchUserResponse {
  int code;
  String message;
  int ttl;
  Data data;

  SearchUserResponse({
    required this.code,
    required this.message,
    required this.ttl,
    required this.data,
  });

  SearchUserResponse copyWith({
    int? code,
    String? message,
    int? ttl,
    Data? data,
  }) =>
      SearchUserResponse(
        code: code ?? this.code,
        message: message ?? this.message,
        ttl: ttl ?? this.ttl,
        data: data ?? this.data,
      );

  factory SearchUserResponse.fromJson(String str) =>
      SearchUserResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SearchUserResponse.fromMap(Map<String, dynamic> json) =>
      SearchUserResponse(
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
  String seid;
  int page;
  int pagesize;
  int numResults;
  int numPages;
  String suggestKeyword;
  String rqtType;
  CostTime costTime;
  Map<String, bool> expList;
  int eggHit;
  List<Result>? result;
  int showColumn;
  int inBlackKey;
  int inWhiteKey;

  Data({
    required this.seid,
    required this.page,
    required this.pagesize,
    required this.numResults,
    required this.numPages,
    required this.suggestKeyword,
    required this.rqtType,
    required this.costTime,
    required this.expList,
    required this.eggHit,
    this.result,
    required this.showColumn,
    required this.inBlackKey,
    required this.inWhiteKey,
  });

  Data copyWith({
    String? seid,
    int? page,
    int? pagesize,
    int? numResults,
    int? numPages,
    String? suggestKeyword,
    String? rqtType,
    CostTime? costTime,
    Map<String, bool>? expList,
    int? eggHit,
    List<Result>? result,
    int? showColumn,
    int? inBlackKey,
    int? inWhiteKey,
  }) =>
      Data(
        seid: seid ?? this.seid,
        page: page ?? this.page,
        pagesize: pagesize ?? this.pagesize,
        numResults: numResults ?? this.numResults,
        numPages: numPages ?? this.numPages,
        suggestKeyword: suggestKeyword ?? this.suggestKeyword,
        rqtType: rqtType ?? this.rqtType,
        costTime: costTime ?? this.costTime,
        expList: expList ?? this.expList,
        eggHit: eggHit ?? this.eggHit,
        result: result ?? this.result,
        showColumn: showColumn ?? this.showColumn,
        inBlackKey: inBlackKey ?? this.inBlackKey,
        inWhiteKey: inWhiteKey ?? this.inWhiteKey,
      );

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        seid: json["seid"],
        page: json["page"],
        pagesize: json["pagesize"],
        numResults: json["numResults"],
        numPages: json["numPages"],
        suggestKeyword: json["suggest_keyword"],
        rqtType: json["rqt_type"],
        costTime: CostTime.fromMap(json["cost_time"]),
        expList: Map.from(json["exp_list"])
            .map((k, v) => MapEntry<String, bool>(k, v)),
        eggHit: json["egg_hit"],
        result: json['result'] == null
            ? null
            : List<Result>.from(json["result"].map((x) => Result.fromMap(x))),
        showColumn: json["show_column"],
        inBlackKey: json["in_black_key"],
        inWhiteKey: json["in_white_key"],
      );

  Map<String, dynamic> toMap() => {
        "seid": seid,
        "page": page,
        "pagesize": pagesize,
        "numResults": numResults,
        "numPages": numPages,
        "suggest_keyword": suggestKeyword,
        "rqt_type": rqtType,
        "cost_time": costTime.toMap(),
        "exp_list":
            Map.from(expList).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "egg_hit": eggHit,
        "result": result == null
            ? null
            : List<dynamic>.from(result!.map((x) => x.toMap())),
        "show_column": showColumn,
        "in_black_key": inBlackKey,
        "in_white_key": inWhiteKey,
      };
}

class CostTime {
  String paramsCheck;
  // String getUpuserLiveStatus;
  String isRiskQuery;
  String illegalHandler;
  String asResponseFormat;
  String asRequest;
  String deserializeResponse;
  String asRequestFormat;
  String total;
  String mainHandler;

  CostTime({
    required this.paramsCheck,
    // required this.getUpuserLiveStatus,
    required this.isRiskQuery,
    required this.illegalHandler,
    required this.asResponseFormat,
    required this.asRequest,
    required this.deserializeResponse,
    required this.asRequestFormat,
    required this.total,
    required this.mainHandler,
  });

  CostTime copyWith({
    String? paramsCheck,
    // String? getUpuserLiveStatus,
    String? isRiskQuery,
    String? illegalHandler,
    String? asResponseFormat,
    String? asRequest,
    String? deserializeResponse,
    String? asRequestFormat,
    String? total,
    String? mainHandler,
  }) =>
      CostTime(
        paramsCheck: paramsCheck ?? this.paramsCheck,
        // getUpuserLiveStatus: getUpuserLiveStatus ?? this.getUpuserLiveStatus,
        isRiskQuery: isRiskQuery ?? this.isRiskQuery,
        illegalHandler: illegalHandler ?? this.illegalHandler,
        asResponseFormat: asResponseFormat ?? this.asResponseFormat,
        asRequest: asRequest ?? this.asRequest,
        deserializeResponse: deserializeResponse ?? this.deserializeResponse,
        asRequestFormat: asRequestFormat ?? this.asRequestFormat,
        total: total ?? this.total,
        mainHandler: mainHandler ?? this.mainHandler,
      );

  factory CostTime.fromJson(String str) => CostTime.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CostTime.fromMap(Map<String, dynamic> json) => CostTime(
        paramsCheck: json["params_check"],
        // getUpuserLiveStatus: json["get upuser live status"],
        isRiskQuery: json["is_risk_query"],
        illegalHandler: json["illegal_handler"],
        asResponseFormat: json["as_response_format"],
        asRequest: json["as_request"],
        deserializeResponse: json["deserialize_response"],
        asRequestFormat: json["as_request_format"],
        total: json["total"],
        mainHandler: json["main_handler"],
      );

  Map<String, dynamic> toMap() => {
        "params_check": paramsCheck,
        // "get upuser live status": getUpuserLiveStatus,
        "is_risk_query": isRiskQuery,
        "illegal_handler": illegalHandler,
        "as_response_format": asResponseFormat,
        "as_request": asRequest,
        "deserialize_response": deserializeResponse,
        "as_request_format": asRequestFormat,
        "total": total,
        "main_handler": mainHandler,
      };
}

class Result {
  String type;
  int mid;
  String uname;
  String usign;
  int fans;
  int videos;
  String upic;
  int faceNft;
  int faceNftType;
  String verifyInfo;
  int level;
  int gender;
  int isUpuser;
  int isLive;
  int roomId;
  List<Re> res;
  OfficialVerify officialVerify;
  List<dynamic> hitColumns;
  int isSeniorMember;

  Result({
    required this.type,
    required this.mid,
    required this.uname,
    required this.usign,
    required this.fans,
    required this.videos,
    required this.upic,
    required this.faceNft,
    required this.faceNftType,
    required this.verifyInfo,
    required this.level,
    required this.gender,
    required this.isUpuser,
    required this.isLive,
    required this.roomId,
    required this.res,
    required this.officialVerify,
    required this.hitColumns,
    required this.isSeniorMember,
  });

  Result copyWith({
    String? type,
    int? mid,
    String? uname,
    String? usign,
    int? fans,
    int? videos,
    String? upic,
    int? faceNft,
    int? faceNftType,
    String? verifyInfo,
    int? level,
    int? gender,
    int? isUpuser,
    int? isLive,
    int? roomId,
    List<Re>? res,
    OfficialVerify? officialVerify,
    List<dynamic>? hitColumns,
    int? isSeniorMember,
  }) =>
      Result(
        type: type ?? this.type,
        mid: mid ?? this.mid,
        uname: uname ?? this.uname,
        usign: usign ?? this.usign,
        fans: fans ?? this.fans,
        videos: videos ?? this.videos,
        upic: upic ?? this.upic,
        faceNft: faceNft ?? this.faceNft,
        faceNftType: faceNftType ?? this.faceNftType,
        verifyInfo: verifyInfo ?? this.verifyInfo,
        level: level ?? this.level,
        gender: gender ?? this.gender,
        isUpuser: isUpuser ?? this.isUpuser,
        isLive: isLive ?? this.isLive,
        roomId: roomId ?? this.roomId,
        res: res ?? this.res,
        officialVerify: officialVerify ?? this.officialVerify,
        hitColumns: hitColumns ?? this.hitColumns,
        isSeniorMember: isSeniorMember ?? this.isSeniorMember,
      );

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        type: json["type"],
        mid: json["mid"],
        uname: json["uname"],
        usign: json["usign"],
        fans: json["fans"],
        videos: json["videos"],
        upic: json["upic"],
        faceNft: json["face_nft"],
        faceNftType: json["face_nft_type"],
        verifyInfo: json["verify_info"],
        level: json["level"],
        gender: json["gender"],
        isUpuser: json["is_upuser"],
        isLive: json["is_live"],
        roomId: json["room_id"],
        res: List<Re>.from(json["res"].map((x) => Re.fromMap(x))),
        officialVerify: OfficialVerify.fromMap(json["official_verify"]),
        hitColumns: List<dynamic>.from(json["hit_columns"].map((x) => x)),
        isSeniorMember: json["is_senior_member"],
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "mid": mid,
        "uname": uname,
        "usign": usign,
        "fans": fans,
        "videos": videos,
        "upic": upic,
        "face_nft": faceNft,
        "face_nft_type": faceNftType,
        "verify_info": verifyInfo,
        "level": level,
        "gender": gender,
        "is_upuser": isUpuser,
        "is_live": isLive,
        "room_id": roomId,
        "res": List<dynamic>.from(res.map((x) => x.toMap())),
        "official_verify": officialVerify.toMap(),
        "hit_columns": List<dynamic>.from(hitColumns.map((x) => x)),
        "is_senior_member": isSeniorMember,
      };
}

class OfficialVerify {
  int type;
  String desc;

  OfficialVerify({
    required this.type,
    required this.desc,
  });

  OfficialVerify copyWith({
    int? type,
    String? desc,
  }) =>
      OfficialVerify(
        type: type ?? this.type,
        desc: desc ?? this.desc,
      );

  factory OfficialVerify.fromJson(String str) =>
      OfficialVerify.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OfficialVerify.fromMap(Map<String, dynamic> json) => OfficialVerify(
        type: json["type"],
        desc: json["desc"],
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "desc": desc,
      };
}

class Re {
  int aid;
  String bvid;
  String title;
  int pubdate;
  String arcurl;
  String pic;
  String play;
  int dm;
  int coin;
  int fav;
  String desc;
  String duration;
  int isPay;
  int isUnionVideo;
  int isChargeVideo;
  int vt;
  int enableVt;

  Re({
    required this.aid,
    required this.bvid,
    required this.title,
    required this.pubdate,
    required this.arcurl,
    required this.pic,
    required this.play,
    required this.dm,
    required this.coin,
    required this.fav,
    required this.desc,
    required this.duration,
    required this.isPay,
    required this.isUnionVideo,
    required this.isChargeVideo,
    required this.vt,
    required this.enableVt,
  });

  Re copyWith({
    int? aid,
    String? bvid,
    String? title,
    int? pubdate,
    String? arcurl,
    String? pic,
    String? play,
    int? dm,
    int? coin,
    int? fav,
    String? desc,
    String? duration,
    int? isPay,
    int? isUnionVideo,
    int? isChargeVideo,
    int? vt,
    int? enableVt,
  }) =>
      Re(
        aid: aid ?? this.aid,
        bvid: bvid ?? this.bvid,
        title: title ?? this.title,
        pubdate: pubdate ?? this.pubdate,
        arcurl: arcurl ?? this.arcurl,
        pic: pic ?? this.pic,
        play: play ?? this.play,
        dm: dm ?? this.dm,
        coin: coin ?? this.coin,
        fav: fav ?? this.fav,
        desc: desc ?? this.desc,
        duration: duration ?? this.duration,
        isPay: isPay ?? this.isPay,
        isUnionVideo: isUnionVideo ?? this.isUnionVideo,
        isChargeVideo: isChargeVideo ?? this.isChargeVideo,
        vt: vt ?? this.vt,
        enableVt: enableVt ?? this.enableVt,
      );

  factory Re.fromJson(String str) => Re.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Re.fromMap(Map<String, dynamic> json) => Re(
        aid: json["aid"],
        bvid: json["bvid"],
        title: json["title"],
        pubdate: json["pubdate"],
        arcurl: json["arcurl"],
        pic: json["pic"],
        play: json["play"],
        dm: json["dm"],
        coin: json["coin"],
        fav: json["fav"],
        desc: json["desc"],
        duration: json["duration"],
        isPay: json["is_pay"],
        isUnionVideo: json["is_union_video"],
        isChargeVideo: json["is_charge_video"],
        vt: json["vt"],
        enableVt: json["enable_vt"],
      );

  Map<String, dynamic> toMap() => {
        "aid": aid,
        "bvid": bvid,
        "title": title,
        "pubdate": pubdate,
        "arcurl": arcurl,
        "pic": pic,
        "play": play,
        "dm": dm,
        "coin": coin,
        "fav": fav,
        "desc": desc,
        "duration": duration,
        "is_pay": isPay,
        "is_union_video": isUnionVideo,
        "is_charge_video": isChargeVideo,
        "vt": vt,
        "enable_vt": enableVt,
      };
}
