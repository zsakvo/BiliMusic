// To parse this JSON data, do
//
//     final videoDashResponse = videoDashResponseFromMap(jsonString);

import 'dart:convert';

class VideoDashResponse {
  int code;
  String message;
  int ttl;
  VideoDashResponseData data;

  VideoDashResponse({
    required this.code,
    required this.message,
    required this.ttl,
    required this.data,
  });

  VideoDashResponse copyWith({
    int? code,
    String? message,
    int? ttl,
    VideoDashResponseData? data,
  }) =>
      VideoDashResponse(
        code: code ?? this.code,
        message: message ?? this.message,
        ttl: ttl ?? this.ttl,
        data: data ?? this.data,
      );

  factory VideoDashResponse.fromJson(String str) => VideoDashResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VideoDashResponse.fromMap(Map<String, dynamic> json) => VideoDashResponse(
        code: json["code"],
        message: json["message"],
        ttl: json["ttl"],
        data: VideoDashResponseData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "ttl": ttl,
        "data": data.toMap(),
      };
}

class VideoDashResponseData {
  String? from;
  String result;
  String message;
  int quality;
  String format;
  int timelength;
  String acceptFormat;
  List<String> acceptDescription;
  List<int> acceptQuality;
  int videoCodecid;
  String seekParam;
  String seekType;
  Dash dash;
  List<SupportFormat> supportFormats;
  dynamic highFormat;
  int lastPlayTime;
  int lastPlayCid;

  VideoDashResponseData({
    this.from,
    required this.result,
    required this.message,
    required this.quality,
    required this.format,
    required this.timelength,
    required this.acceptFormat,
    required this.acceptDescription,
    required this.acceptQuality,
    required this.videoCodecid,
    required this.seekParam,
    required this.seekType,
    required this.dash,
    required this.supportFormats,
    this.highFormat,
    required this.lastPlayTime,
    required this.lastPlayCid,
  });

  VideoDashResponseData copyWith({
    String? from,
    String? result,
    String? message,
    int? quality,
    String? format,
    int? timelength,
    String? acceptFormat,
    List<String>? acceptDescription,
    List<int>? acceptQuality,
    int? videoCodecid,
    String? seekParam,
    String? seekType,
    Dash? dash,
    List<SupportFormat>? supportFormats,
    dynamic highFormat,
    int? lastPlayTime,
    int? lastPlayCid,
  }) =>
      VideoDashResponseData(
        from: from ?? this.from,
        result: result ?? this.result,
        message: message ?? this.message,
        quality: quality ?? this.quality,
        format: format ?? this.format,
        timelength: timelength ?? this.timelength,
        acceptFormat: acceptFormat ?? this.acceptFormat,
        acceptDescription: acceptDescription ?? this.acceptDescription,
        acceptQuality: acceptQuality ?? this.acceptQuality,
        videoCodecid: videoCodecid ?? this.videoCodecid,
        seekParam: seekParam ?? this.seekParam,
        seekType: seekType ?? this.seekType,
        dash: dash ?? this.dash,
        supportFormats: supportFormats ?? this.supportFormats,
        highFormat: highFormat ?? this.highFormat,
        lastPlayTime: lastPlayTime ?? this.lastPlayTime,
        lastPlayCid: lastPlayCid ?? this.lastPlayCid,
      );

  factory VideoDashResponseData.fromJson(String str) => VideoDashResponseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VideoDashResponseData.fromMap(Map<String, dynamic> json) => VideoDashResponseData(
        from: json["from"],
        result: json["result"],
        message: json["message"],
        quality: json["quality"],
        format: json["format"],
        timelength: json["timelength"],
        acceptFormat: json["accept_format"],
        acceptDescription: List<String>.from(json["accept_description"].map((x) => x)),
        acceptQuality: List<int>.from(json["accept_quality"].map((x) => x)),
        videoCodecid: json["video_codecid"],
        seekParam: json["seek_param"],
        seekType: json["seek_type"],
        dash: Dash.fromMap(json["dash"]),
        supportFormats: List<SupportFormat>.from(json["support_formats"].map((x) => SupportFormat.fromMap(x))),
        highFormat: json["high_format"],
        lastPlayTime: json["last_play_time"],
        lastPlayCid: json["last_play_cid"],
      );

  Map<String, dynamic> toMap() => {
        "from": from,
        "result": result,
        "message": message,
        "quality": quality,
        "format": format,
        "timelength": timelength,
        "accept_format": acceptFormat,
        "accept_description": List<dynamic>.from(acceptDescription.map((x) => x)),
        "accept_quality": List<dynamic>.from(acceptQuality.map((x) => x)),
        "video_codecid": videoCodecid,
        "seek_param": seekParam,
        "seek_type": seekType,
        "dash": dash.toMap(),
        "support_formats": List<dynamic>.from(supportFormats.map((x) => x.toMap())),
        "high_format": highFormat,
        "last_play_time": lastPlayTime,
        "last_play_cid": lastPlayCid,
      };
}

class Dash {
  int duration;
  double minBufferTime;
  double dashMinBufferTime;
  List<Audio> video;
  List<Audio> audio;
  Dolby dolby;
  dynamic flac;

  Dash({
    required this.duration,
    required this.minBufferTime,
    required this.dashMinBufferTime,
    required this.video,
    required this.audio,
    required this.dolby,
    this.flac,
  });

  Dash copyWith({
    int? duration,
    double? minBufferTime,
    double? dashMinBufferTime,
    List<Audio>? video,
    List<Audio>? audio,
    Dolby? dolby,
    dynamic flac,
  }) =>
      Dash(
        duration: duration ?? this.duration,
        minBufferTime: minBufferTime ?? this.minBufferTime,
        dashMinBufferTime: dashMinBufferTime ?? this.dashMinBufferTime,
        video: video ?? this.video,
        audio: audio ?? this.audio,
        dolby: dolby ?? this.dolby,
        flac: flac ?? this.flac,
      );

  factory Dash.fromJson(String str) => Dash.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Dash.fromMap(Map<String, dynamic> json) => Dash(
        duration: json["duration"],
        minBufferTime: json["minBufferTime"]?.toDouble(),
        dashMinBufferTime: json["min_buffer_time"]?.toDouble(),
        video: List<Audio>.from(json["video"].map((x) => Audio.fromMap(x))),
        audio: List<Audio>.from(json["audio"].map((x) => Audio.fromMap(x))),
        dolby: Dolby.fromMap(json["dolby"]),
        flac: json["flac"],
      );

  Map<String, dynamic> toMap() => {
        "duration": duration,
        "minBufferTime": minBufferTime,
        "min_buffer_time": dashMinBufferTime,
        "video": List<dynamic>.from(video.map((x) => x.toMap())),
        "audio": List<dynamic>.from(audio.map((x) => x.toMap())),
        "dolby": dolby.toMap(),
        "flac": flac,
      };
}

class Audio {
  int id;
  String baseUrl;
  String audioBaseUrl;
  List<String> backupUrl;
  List<String> audioBackupUrl;
  int bandwidth;
  String mimeType;
  String audioMimeType;
  String codecs;
  int width;
  int height;
  String frameRate;
  String audioFrameRate;
  String sar;
  int startWithSap;
  int audioStartWithSap;
  SegmentBase segmentBase;
  SegmentBaseClass audioSegmentBase;
  int codecid;

  Audio({
    required this.id,
    required this.baseUrl,
    required this.audioBaseUrl,
    required this.backupUrl,
    required this.audioBackupUrl,
    required this.bandwidth,
    required this.mimeType,
    required this.audioMimeType,
    required this.codecs,
    required this.width,
    required this.height,
    required this.frameRate,
    required this.audioFrameRate,
    required this.sar,
    required this.startWithSap,
    required this.audioStartWithSap,
    required this.segmentBase,
    required this.audioSegmentBase,
    required this.codecid,
  });

  Audio copyWith({
    int? id,
    String? baseUrl,
    String? audioBaseUrl,
    List<String>? backupUrl,
    List<String>? audioBackupUrl,
    int? bandwidth,
    String? mimeType,
    String? audioMimeType,
    String? codecs,
    int? width,
    int? height,
    String? frameRate,
    String? audioFrameRate,
    String? sar,
    int? startWithSap,
    int? audioStartWithSap,
    SegmentBase? segmentBase,
    SegmentBaseClass? audioSegmentBase,
    int? codecid,
  }) =>
      Audio(
        id: id ?? this.id,
        baseUrl: baseUrl ?? this.baseUrl,
        audioBaseUrl: audioBaseUrl ?? this.audioBaseUrl,
        backupUrl: backupUrl ?? this.backupUrl,
        audioBackupUrl: audioBackupUrl ?? this.audioBackupUrl,
        bandwidth: bandwidth ?? this.bandwidth,
        mimeType: mimeType ?? this.mimeType,
        audioMimeType: audioMimeType ?? this.audioMimeType,
        codecs: codecs ?? this.codecs,
        width: width ?? this.width,
        height: height ?? this.height,
        frameRate: frameRate ?? this.frameRate,
        audioFrameRate: audioFrameRate ?? this.audioFrameRate,
        sar: sar ?? this.sar,
        startWithSap: startWithSap ?? this.startWithSap,
        audioStartWithSap: audioStartWithSap ?? this.audioStartWithSap,
        segmentBase: segmentBase ?? this.segmentBase,
        audioSegmentBase: audioSegmentBase ?? this.audioSegmentBase,
        codecid: codecid ?? this.codecid,
      );

  factory Audio.fromJson(String str) => Audio.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Audio.fromMap(Map<String, dynamic> json) => Audio(
        id: json["id"],
        baseUrl: json["baseUrl"],
        audioBaseUrl: json["base_url"],
        backupUrl: List<String>.from(json["backupUrl"].map((x) => x)),
        audioBackupUrl: List<String>.from(json["backup_url"].map((x) => x)),
        bandwidth: json["bandwidth"],
        mimeType: json["mimeType"],
        audioMimeType: json["mime_type"],
        codecs: json["codecs"],
        width: json["width"],
        height: json["height"],
        frameRate: json["frameRate"],
        audioFrameRate: json["frame_rate"],
        sar: json["sar"],
        startWithSap: json["startWithSap"],
        audioStartWithSap: json["start_with_sap"],
        segmentBase: SegmentBase.fromMap(json["SegmentBase"]),
        audioSegmentBase: SegmentBaseClass.fromMap(json["segment_base"]),
        codecid: json["codecid"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "baseUrl": baseUrl,
        "base_url": audioBaseUrl,
        "backupUrl": List<dynamic>.from(backupUrl.map((x) => x)),
        "backup_url": List<dynamic>.from(audioBackupUrl.map((x) => x)),
        "bandwidth": bandwidth,
        "mimeType": mimeType,
        "mime_type": audioMimeType,
        "codecs": codecs,
        "width": width,
        "height": height,
        "frameRate": frameRate,
        "frame_rate": audioFrameRate,
        "sar": sar,
        "startWithSap": startWithSap,
        "start_with_sap": audioStartWithSap,
        "SegmentBase": segmentBase.toMap(),
        "segment_base": audioSegmentBase.toMap(),
        "codecid": codecid,
      };
}

class SegmentBaseClass {
  String initialization;
  String indexRange;

  SegmentBaseClass({
    required this.initialization,
    required this.indexRange,
  });

  SegmentBaseClass copyWith({
    String? initialization,
    String? indexRange,
  }) =>
      SegmentBaseClass(
        initialization: initialization ?? this.initialization,
        indexRange: indexRange ?? this.indexRange,
      );

  factory SegmentBaseClass.fromJson(String str) => SegmentBaseClass.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SegmentBaseClass.fromMap(Map<String, dynamic> json) => SegmentBaseClass(
        initialization: json["initialization"],
        indexRange: json["index_range"],
      );

  Map<String, dynamic> toMap() => {
        "initialization": initialization,
        "index_range": indexRange,
      };
}

class SegmentBase {
  String initialization;
  String indexRange;

  SegmentBase({
    required this.initialization,
    required this.indexRange,
  });

  SegmentBase copyWith({
    String? initialization,
    String? indexRange,
  }) =>
      SegmentBase(
        initialization: initialization ?? this.initialization,
        indexRange: indexRange ?? this.indexRange,
      );

  factory SegmentBase.fromJson(String str) => SegmentBase.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SegmentBase.fromMap(Map<String, dynamic> json) => SegmentBase(
        initialization: json["Initialization"],
        indexRange: json["indexRange"],
      );

  Map<String, dynamic> toMap() => {
        "Initialization": initialization,
        "indexRange": indexRange,
      };
}

class Dolby {
  int type;
  dynamic audio;

  Dolby({
    required this.type,
    this.audio,
  });

  Dolby copyWith({
    int? type,
    dynamic audio,
  }) =>
      Dolby(
        type: type ?? this.type,
        audio: audio ?? this.audio,
      );

  factory Dolby.fromJson(String str) => Dolby.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Dolby.fromMap(Map<String, dynamic> json) => Dolby(
        type: json["type"],
        audio: json["audio"],
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "audio": audio,
      };
}

class SupportFormat {
  int quality;
  String format;
  String newDescription;
  String displayDesc;
  String superscript;
  List<String> codecs;

  SupportFormat({
    required this.quality,
    required this.format,
    required this.newDescription,
    required this.displayDesc,
    required this.superscript,
    required this.codecs,
  });

  SupportFormat copyWith({
    int? quality,
    String? format,
    String? newDescription,
    String? displayDesc,
    String? superscript,
    List<String>? codecs,
  }) =>
      SupportFormat(
        quality: quality ?? this.quality,
        format: format ?? this.format,
        newDescription: newDescription ?? this.newDescription,
        displayDesc: displayDesc ?? this.displayDesc,
        superscript: superscript ?? this.superscript,
        codecs: codecs ?? this.codecs,
      );

  factory SupportFormat.fromJson(String str) => SupportFormat.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SupportFormat.fromMap(Map<String, dynamic> json) => SupportFormat(
        quality: json["quality"],
        format: json["format"],
        newDescription: json["new_description"],
        displayDesc: json["display_desc"],
        superscript: json["superscript"],
        codecs: List<String>.from(json["codecs"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "quality": quality,
        "format": format,
        "new_description": newDescription,
        "display_desc": displayDesc,
        "superscript": superscript,
        "codecs": List<dynamic>.from(codecs.map((x) => x)),
      };
}
