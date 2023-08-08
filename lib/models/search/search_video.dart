// To parse this JSON data, do
//
//     final searchVideoResultResponse = searchVideoResultResponseFromMap(jsonString);

import 'dart:convert';

class SearchVideoResultResponse {
  int code;
  String message;
  int ttl;
  SearchVideoResultResponseData data;

  SearchVideoResultResponse({
    required this.code,
    required this.message,
    required this.ttl,
    required this.data,
  });

  SearchVideoResultResponse copyWith({
    int? code,
    String? message,
    int? ttl,
    SearchVideoResultResponseData? data,
  }) =>
      SearchVideoResultResponse(
        code: code ?? this.code,
        message: message ?? this.message,
        ttl: ttl ?? this.ttl,
        data: data ?? this.data,
      );

  factory SearchVideoResultResponse.fromJson(String str) => SearchVideoResultResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SearchVideoResultResponse.fromMap(Map<String, dynamic> json) => SearchVideoResultResponse(
        code: json["code"],
        message: json["message"],
        ttl: json["ttl"],
        data: SearchVideoResultResponseData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "ttl": ttl,
        "data": data.toMap(),
      };
}

class SearchVideoResultResponseData {
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
  List<Result> result;
  int showColumn;
  int inBlackKey;
  int inWhiteKey;

  SearchVideoResultResponseData({
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
    required this.result,
    required this.showColumn,
    required this.inBlackKey,
    required this.inWhiteKey,
  });

  SearchVideoResultResponseData copyWith({
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
      SearchVideoResultResponseData(
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

  factory SearchVideoResultResponseData.fromJson(String str) => SearchVideoResultResponseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SearchVideoResultResponseData.fromMap(Map<String, dynamic> json) => SearchVideoResultResponseData(
        seid: json["seid"],
        page: json["page"],
        pagesize: json["pagesize"],
        numResults: json["numResults"],
        numPages: json["numPages"],
        suggestKeyword: json["suggest_keyword"],
        rqtType: json["rqt_type"],
        costTime: CostTime.fromMap(json["cost_time"]),
        expList: Map.from(json["exp_list"]).map((k, v) => MapEntry<String, bool>(k, v)),
        eggHit: json["egg_hit"],
        result: List<Result>.from(json["result"].map((x) => Result.fromMap(x))),
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
        "exp_list": Map.from(expList).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "egg_hit": eggHit,
        "result": List<dynamic>.from(result.map((x) => x.toMap())),
        "show_column": showColumn,
        "in_black_key": inBlackKey,
        "in_white_key": inWhiteKey,
      };
}

class CostTime {
  String paramsCheck;
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
  int id;
  String author;
  int mid;
  String typeid;
  String typename;
  String arcurl;
  int aid;
  String bvid;
  String title;
  String description;
  String arcrank;
  String pic;
  int play;
  int videoReview;
  int favorites;
  String tag;
  int review;
  int pubdate;
  int senddate;
  String duration;
  bool badgepay;
  List<String> hitColumns;
  String viewType;
  int isPay;
  int isUnionVideo;
  dynamic recTags;
  List<dynamic> newRecTags;
  int rankScore;
  int like;
  String upic;
  String corner;
  String cover;
  String desc;
  String url;
  String recReason;
  int danmaku;
  dynamic bizData;
  int isChargeVideo;
  int vt;
  int enableVt;

  Result({
    required this.type,
    required this.id,
    required this.author,
    required this.mid,
    required this.typeid,
    required this.typename,
    required this.arcurl,
    required this.aid,
    required this.bvid,
    required this.title,
    required this.description,
    required this.arcrank,
    required this.pic,
    required this.play,
    required this.videoReview,
    required this.favorites,
    required this.tag,
    required this.review,
    required this.pubdate,
    required this.senddate,
    required this.duration,
    required this.badgepay,
    required this.hitColumns,
    required this.viewType,
    required this.isPay,
    required this.isUnionVideo,
    this.recTags,
    required this.newRecTags,
    required this.rankScore,
    required this.like,
    required this.upic,
    required this.corner,
    required this.cover,
    required this.desc,
    required this.url,
    required this.recReason,
    required this.danmaku,
    this.bizData,
    required this.isChargeVideo,
    required this.vt,
    required this.enableVt,
  });

  Result copyWith({
    String? type,
    int? id,
    String? author,
    int? mid,
    String? typeid,
    String? typename,
    String? arcurl,
    int? aid,
    String? bvid,
    String? title,
    String? description,
    String? arcrank,
    String? pic,
    int? play,
    int? videoReview,
    int? favorites,
    String? tag,
    int? review,
    int? pubdate,
    int? senddate,
    String? duration,
    bool? badgepay,
    List<String>? hitColumns,
    String? viewType,
    int? isPay,
    int? isUnionVideo,
    dynamic recTags,
    List<dynamic>? newRecTags,
    int? rankScore,
    int? like,
    String? upic,
    String? corner,
    String? cover,
    String? desc,
    String? url,
    String? recReason,
    int? danmaku,
    dynamic bizData,
    int? isChargeVideo,
    int? vt,
    int? enableVt,
  }) =>
      Result(
        type: type ?? this.type,
        id: id ?? this.id,
        author: author ?? this.author,
        mid: mid ?? this.mid,
        typeid: typeid ?? this.typeid,
        typename: typename ?? this.typename,
        arcurl: arcurl ?? this.arcurl,
        aid: aid ?? this.aid,
        bvid: bvid ?? this.bvid,
        title: title ?? this.title,
        description: description ?? this.description,
        arcrank: arcrank ?? this.arcrank,
        pic: pic ?? this.pic,
        play: play ?? this.play,
        videoReview: videoReview ?? this.videoReview,
        favorites: favorites ?? this.favorites,
        tag: tag ?? this.tag,
        review: review ?? this.review,
        pubdate: pubdate ?? this.pubdate,
        senddate: senddate ?? this.senddate,
        duration: duration ?? this.duration,
        badgepay: badgepay ?? this.badgepay,
        hitColumns: hitColumns ?? this.hitColumns,
        viewType: viewType ?? this.viewType,
        isPay: isPay ?? this.isPay,
        isUnionVideo: isUnionVideo ?? this.isUnionVideo,
        recTags: recTags ?? this.recTags,
        newRecTags: newRecTags ?? this.newRecTags,
        rankScore: rankScore ?? this.rankScore,
        like: like ?? this.like,
        upic: upic ?? this.upic,
        corner: corner ?? this.corner,
        cover: cover ?? this.cover,
        desc: desc ?? this.desc,
        url: url ?? this.url,
        recReason: recReason ?? this.recReason,
        danmaku: danmaku ?? this.danmaku,
        bizData: bizData ?? this.bizData,
        isChargeVideo: isChargeVideo ?? this.isChargeVideo,
        vt: vt ?? this.vt,
        enableVt: enableVt ?? this.enableVt,
      );

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        type: json["type"],
        id: json["id"],
        author: json["author"],
        mid: json["mid"],
        typeid: json["typeid"],
        typename: json["typename"],
        arcurl: json["arcurl"],
        aid: json["aid"],
        bvid: json["bvid"],
        title: json["title"],
        description: json["description"],
        arcrank: json["arcrank"],
        pic: json["pic"],
        play: json["play"],
        videoReview: json["video_review"],
        favorites: json["favorites"],
        tag: json["tag"],
        review: json["review"],
        pubdate: json["pubdate"],
        senddate: json["senddate"],
        duration: json["duration"],
        badgepay: json["badgepay"],
        hitColumns: List<String>.from(json["hit_columns"].map((x) => x)),
        viewType: json["view_type"],
        isPay: json["is_pay"],
        isUnionVideo: json["is_union_video"],
        recTags: json["rec_tags"],
        newRecTags: List<dynamic>.from(json["new_rec_tags"].map((x) => x)),
        rankScore: json["rank_score"],
        like: json["like"],
        upic: json["upic"],
        corner: json["corner"],
        cover: json["cover"],
        desc: json["desc"],
        url: json["url"],
        recReason: json["rec_reason"],
        danmaku: json["danmaku"],
        bizData: json["biz_data"],
        isChargeVideo: json["is_charge_video"],
        vt: json["vt"],
        enableVt: json["enable_vt"],
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "id": id,
        "author": author,
        "mid": mid,
        "typeid": typeid,
        "typename": typename,
        "arcurl": arcurl,
        "aid": aid,
        "bvid": bvid,
        "title": title,
        "description": description,
        "arcrank": arcrank,
        "pic": pic,
        "play": play,
        "video_review": videoReview,
        "favorites": favorites,
        "tag": tag,
        "review": review,
        "pubdate": pubdate,
        "senddate": senddate,
        "duration": duration,
        "badgepay": badgepay,
        "hit_columns": List<dynamic>.from(hitColumns.map((x) => x)),
        "view_type": viewType,
        "is_pay": isPay,
        "is_union_video": isUnionVideo,
        "rec_tags": recTags,
        "new_rec_tags": List<dynamic>.from(newRecTags.map((x) => x)),
        "rank_score": rankScore,
        "like": like,
        "upic": upic,
        "corner": corner,
        "cover": cover,
        "desc": desc,
        "url": url,
        "rec_reason": recReason,
        "danmaku": danmaku,
        "biz_data": bizData,
        "is_charge_video": isChargeVideo,
        "vt": vt,
        "enable_vt": enableVt,
      };
}
