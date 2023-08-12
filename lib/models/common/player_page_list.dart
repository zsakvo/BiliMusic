// To parse this JSON data, do
//
//     final playerPageListResponse = playerPageListResponseFromMap(jsonString);

import 'dart:convert';

class PlayerPageListResponse {
  int code;
  String message;
  int ttl;
  List<PlayerPageListItem> data;

  PlayerPageListResponse({
    required this.code,
    required this.message,
    required this.ttl,
    required this.data,
  });

  PlayerPageListResponse copyWith({
    int? code,
    String? message,
    int? ttl,
    List<PlayerPageListItem>? data,
  }) =>
      PlayerPageListResponse(
        code: code ?? this.code,
        message: message ?? this.message,
        ttl: ttl ?? this.ttl,
        data: data ?? this.data,
      );

  factory PlayerPageListResponse.fromJson(String str) =>
      PlayerPageListResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PlayerPageListResponse.fromMap(Map<String, dynamic> json) =>
      PlayerPageListResponse(
        code: json["code"],
        message: json["message"],
        ttl: json["ttl"],
        data: List<PlayerPageListItem>.from(
            json["data"].map((x) => PlayerPageListItem.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "ttl": ttl,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class PlayerPageListItem {
  int cid;
  int page;
  String from;
  String part;
  int duration;
  String vid;
  String weblink;
  Dimension dimension;

  PlayerPageListItem({
    required this.cid,
    required this.page,
    required this.from,
    required this.part,
    required this.duration,
    required this.vid,
    required this.weblink,
    required this.dimension,
  });

  PlayerPageListItem copyWith({
    int? cid,
    int? page,
    String? from,
    String? part,
    int? duration,
    String? vid,
    String? weblink,
    Dimension? dimension,
  }) =>
      PlayerPageListItem(
        cid: cid ?? this.cid,
        page: page ?? this.page,
        from: from ?? this.from,
        part: part ?? this.part,
        duration: duration ?? this.duration,
        vid: vid ?? this.vid,
        weblink: weblink ?? this.weblink,
        dimension: dimension ?? this.dimension,
      );

  factory PlayerPageListItem.fromJson(String str) =>
      PlayerPageListItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PlayerPageListItem.fromMap(Map<String, dynamic> json) =>
      PlayerPageListItem(
        cid: json["cid"],
        page: json["page"],
        from: json["from"],
        part: json["part"],
        duration: json["duration"],
        vid: json["vid"],
        weblink: json["weblink"],
        dimension: Dimension.fromMap(json["dimension"]),
      );

  Map<String, dynamic> toMap() => {
        "cid": cid,
        "page": page,
        "from": from,
        "part": part,
        "duration": duration,
        "vid": vid,
        "weblink": weblink,
        "dimension": dimension.toMap(),
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
