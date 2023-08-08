// To parse this JSON data, do
//
//     final subtitleResponse = subtitleResponseFromMap(jsonString);

import 'dart:convert';

class SubtitleResponse {
  double fontSize;
  String fontColor;
  double backgroundAlpha;
  String backgroundColor;
  String stroke;
  String type;
  String lang;
  String version;
  List<Body> body;

  SubtitleResponse({
    required this.fontSize,
    required this.fontColor,
    required this.backgroundAlpha,
    required this.backgroundColor,
    required this.stroke,
    required this.type,
    required this.lang,
    required this.version,
    required this.body,
  });

  SubtitleResponse copyWith({
    double? fontSize,
    String? fontColor,
    double? backgroundAlpha,
    String? backgroundColor,
    String? stroke,
    String? type,
    String? lang,
    String? version,
    List<Body>? body,
  }) =>
      SubtitleResponse(
        fontSize: fontSize ?? this.fontSize,
        fontColor: fontColor ?? this.fontColor,
        backgroundAlpha: backgroundAlpha ?? this.backgroundAlpha,
        backgroundColor: backgroundColor ?? this.backgroundColor,
        stroke: stroke ?? this.stroke,
        type: type ?? this.type,
        lang: lang ?? this.lang,
        version: version ?? this.version,
        body: body ?? this.body,
      );

  factory SubtitleResponse.fromJson(String str) => SubtitleResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SubtitleResponse.fromMap(Map<String, dynamic> json) => SubtitleResponse(
        fontSize: json["font_size"]?.toDouble(),
        fontColor: json["font_color"],
        backgroundAlpha: json["background_alpha"]?.toDouble(),
        backgroundColor: json["background_color"],
        stroke: json["Stroke"],
        type: json["type"],
        lang: json["lang"],
        version: json["version"],
        body: List<Body>.from(json["body"].map((x) => Body.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "font_size": fontSize,
        "font_color": fontColor,
        "background_alpha": backgroundAlpha,
        "background_color": backgroundColor,
        "Stroke": stroke,
        "type": type,
        "lang": lang,
        "version": version,
        "body": List<dynamic>.from(body.map((x) => x.toMap())),
      };
}

class Body {
  double from;
  double to;
  int sid;
  int location;
  String content;

  Body({
    required this.from,
    required this.to,
    required this.sid,
    required this.location,
    required this.content,
  });

  Body copyWith({
    double? from,
    double? to,
    int? sid,
    int? location,
    String? content,
  }) =>
      Body(
        from: from ?? this.from,
        to: to ?? this.to,
        sid: sid ?? this.sid,
        location: location ?? this.location,
        content: content ?? this.content,
      );

  factory Body.fromJson(String str) => Body.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Body.fromMap(Map<String, dynamic> json) => Body(
        from: json["from"]?.toDouble(),
        to: json["to"]?.toDouble(),
        sid: json["sid"],
        location: json["location"],
        content: json["content"],
      );

  Map<String, dynamic> toMap() => {
        "from": from,
        "to": to,
        "sid": sid,
        "location": location,
        "content": content,
      };
}
