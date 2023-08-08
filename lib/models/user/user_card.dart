// To parse this JSON data, do
//
//     final userCardResponse = userCardResponseFromMap(jsonString);

import 'dart:convert';

class UserCardResponse {
  int code;
  String message;
  int ttl;
  UserCardResponseData data;

  UserCardResponse({
    required this.code,
    required this.message,
    required this.ttl,
    required this.data,
  });

  UserCardResponse copyWith({
    int? code,
    String? message,
    int? ttl,
    UserCardResponseData? data,
  }) =>
      UserCardResponse(
        code: code ?? this.code,
        message: message ?? this.message,
        ttl: ttl ?? this.ttl,
        data: data ?? this.data,
      );

  factory UserCardResponse.fromJson(String str) =>
      UserCardResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserCardResponse.fromMap(Map<String, dynamic> json) =>
      UserCardResponse(
        code: json["code"],
        message: json["message"],
        ttl: json["ttl"],
        data: UserCardResponseData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "ttl": ttl,
        "data": data.toMap(),
      };
}

class UserCardResponseData {
  Card card;
  bool following;
  int archiveCount;
  int articleCount;
  int follower;
  int likeNum;

  UserCardResponseData({
    required this.card,
    required this.following,
    required this.archiveCount,
    required this.articleCount,
    required this.follower,
    required this.likeNum,
  });

  UserCardResponseData copyWith({
    Card? card,
    bool? following,
    int? archiveCount,
    int? articleCount,
    int? follower,
    int? likeNum,
  }) =>
      UserCardResponseData(
        card: card ?? this.card,
        following: following ?? this.following,
        archiveCount: archiveCount ?? this.archiveCount,
        articleCount: articleCount ?? this.articleCount,
        follower: follower ?? this.follower,
        likeNum: likeNum ?? this.likeNum,
      );

  factory UserCardResponseData.fromJson(String str) =>
      UserCardResponseData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserCardResponseData.fromMap(Map<String, dynamic> json) =>
      UserCardResponseData(
        card: Card.fromMap(json["card"]),
        following: json["following"],
        archiveCount: json["archive_count"],
        articleCount: json["article_count"],
        follower: json["follower"],
        likeNum: json["like_num"],
      );

  Map<String, dynamic> toMap() => {
        "card": card.toMap(),
        "following": following,
        "archive_count": archiveCount,
        "article_count": articleCount,
        "follower": follower,
        "like_num": likeNum,
      };
}

class Card {
  String mid;
  String name;
  bool approve;
  String sex;
  String rank;
  String face;
  int faceNft;
  int faceNftType;
  String displayRank;
  int regtime;
  int spacesta;
  String birthday;
  String place;
  String description;
  int article;
  List<dynamic> attentions;
  int fans;
  int friend;
  int attention;
  String sign;
  LevelInfo levelInfo;
  Pendant pendant;
  Nameplate nameplate;
  Official official;
  OfficialVerify officialVerify;
  Vip vip;
  int isSeniorMember;

  Card({
    required this.mid,
    required this.name,
    required this.approve,
    required this.sex,
    required this.rank,
    required this.face,
    required this.faceNft,
    required this.faceNftType,
    required this.displayRank,
    required this.regtime,
    required this.spacesta,
    required this.birthday,
    required this.place,
    required this.description,
    required this.article,
    required this.attentions,
    required this.fans,
    required this.friend,
    required this.attention,
    required this.sign,
    required this.levelInfo,
    required this.pendant,
    required this.nameplate,
    required this.official,
    required this.officialVerify,
    required this.vip,
    required this.isSeniorMember,
  });

  Card copyWith({
    String? mid,
    String? name,
    bool? approve,
    String? sex,
    String? rank,
    String? face,
    int? faceNft,
    int? faceNftType,
    String? displayRank,
    int? regtime,
    int? spacesta,
    String? birthday,
    String? place,
    String? description,
    int? article,
    List<dynamic>? attentions,
    int? fans,
    int? friend,
    int? attention,
    String? sign,
    LevelInfo? levelInfo,
    Pendant? pendant,
    Nameplate? nameplate,
    Official? official,
    OfficialVerify? officialVerify,
    Vip? vip,
    int? isSeniorMember,
  }) =>
      Card(
        mid: mid ?? this.mid,
        name: name ?? this.name,
        approve: approve ?? this.approve,
        sex: sex ?? this.sex,
        rank: rank ?? this.rank,
        face: face ?? this.face,
        faceNft: faceNft ?? this.faceNft,
        faceNftType: faceNftType ?? this.faceNftType,
        displayRank: displayRank ?? this.displayRank,
        regtime: regtime ?? this.regtime,
        spacesta: spacesta ?? this.spacesta,
        birthday: birthday ?? this.birthday,
        place: place ?? this.place,
        description: description ?? this.description,
        article: article ?? this.article,
        attentions: attentions ?? this.attentions,
        fans: fans ?? this.fans,
        friend: friend ?? this.friend,
        attention: attention ?? this.attention,
        sign: sign ?? this.sign,
        levelInfo: levelInfo ?? this.levelInfo,
        pendant: pendant ?? this.pendant,
        nameplate: nameplate ?? this.nameplate,
        official: official ?? this.official,
        officialVerify: officialVerify ?? this.officialVerify,
        vip: vip ?? this.vip,
        isSeniorMember: isSeniorMember ?? this.isSeniorMember,
      );

  factory Card.fromJson(String str) => Card.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Card.fromMap(Map<String, dynamic> json) => Card(
        mid: json["mid"],
        name: json["name"],
        approve: json["approve"],
        sex: json["sex"],
        rank: json["rank"],
        face: json["face"],
        faceNft: json["face_nft"],
        faceNftType: json["face_nft_type"],
        displayRank: json["DisplayRank"],
        regtime: json["regtime"],
        spacesta: json["spacesta"],
        birthday: json["birthday"],
        place: json["place"],
        description: json["description"],
        article: json["article"],
        attentions: List<dynamic>.from(json["attentions"].map((x) => x)),
        fans: json["fans"],
        friend: json["friend"],
        attention: json["attention"],
        sign: json["sign"],
        levelInfo: LevelInfo.fromMap(json["level_info"]),
        pendant: Pendant.fromMap(json["pendant"]),
        nameplate: Nameplate.fromMap(json["nameplate"]),
        official: Official.fromMap(json["Official"]),
        officialVerify: OfficialVerify.fromMap(json["official_verify"]),
        vip: Vip.fromMap(json["vip"]),
        isSeniorMember: json["is_senior_member"],
      );

  Map<String, dynamic> toMap() => {
        "mid": mid,
        "name": name,
        "approve": approve,
        "sex": sex,
        "rank": rank,
        "face": face,
        "face_nft": faceNft,
        "face_nft_type": faceNftType,
        "DisplayRank": displayRank,
        "regtime": regtime,
        "spacesta": spacesta,
        "birthday": birthday,
        "place": place,
        "description": description,
        "article": article,
        "attentions": List<dynamic>.from(attentions.map((x) => x)),
        "fans": fans,
        "friend": friend,
        "attention": attention,
        "sign": sign,
        "level_info": levelInfo.toMap(),
        "pendant": pendant.toMap(),
        "nameplate": nameplate.toMap(),
        "Official": official.toMap(),
        "official_verify": officialVerify.toMap(),
        "vip": vip.toMap(),
        "is_senior_member": isSeniorMember,
      };
}

class LevelInfo {
  int currentLevel;
  int currentMin;
  int currentExp;
  int nextExp;

  LevelInfo({
    required this.currentLevel,
    required this.currentMin,
    required this.currentExp,
    required this.nextExp,
  });

  LevelInfo copyWith({
    int? currentLevel,
    int? currentMin,
    int? currentExp,
    int? nextExp,
  }) =>
      LevelInfo(
        currentLevel: currentLevel ?? this.currentLevel,
        currentMin: currentMin ?? this.currentMin,
        currentExp: currentExp ?? this.currentExp,
        nextExp: nextExp ?? this.nextExp,
      );

  factory LevelInfo.fromJson(String str) => LevelInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LevelInfo.fromMap(Map<String, dynamic> json) => LevelInfo(
        currentLevel: json["current_level"],
        currentMin: json["current_min"],
        currentExp: json["current_exp"],
        nextExp: json["next_exp"],
      );

  Map<String, dynamic> toMap() => {
        "current_level": currentLevel,
        "current_min": currentMin,
        "current_exp": currentExp,
        "next_exp": nextExp,
      };
}

class Nameplate {
  int nid;
  String name;
  String image;
  String imageSmall;
  String level;
  String condition;

  Nameplate({
    required this.nid,
    required this.name,
    required this.image,
    required this.imageSmall,
    required this.level,
    required this.condition,
  });

  Nameplate copyWith({
    int? nid,
    String? name,
    String? image,
    String? imageSmall,
    String? level,
    String? condition,
  }) =>
      Nameplate(
        nid: nid ?? this.nid,
        name: name ?? this.name,
        image: image ?? this.image,
        imageSmall: imageSmall ?? this.imageSmall,
        level: level ?? this.level,
        condition: condition ?? this.condition,
      );

  factory Nameplate.fromJson(String str) => Nameplate.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Nameplate.fromMap(Map<String, dynamic> json) => Nameplate(
        nid: json["nid"],
        name: json["name"],
        image: json["image"],
        imageSmall: json["image_small"],
        level: json["level"],
        condition: json["condition"],
      );

  Map<String, dynamic> toMap() => {
        "nid": nid,
        "name": name,
        "image": image,
        "image_small": imageSmall,
        "level": level,
        "condition": condition,
      };
}

class Official {
  int role;
  String title;
  String desc;
  int type;

  Official({
    required this.role,
    required this.title,
    required this.desc,
    required this.type,
  });

  Official copyWith({
    int? role,
    String? title,
    String? desc,
    int? type,
  }) =>
      Official(
        role: role ?? this.role,
        title: title ?? this.title,
        desc: desc ?? this.desc,
        type: type ?? this.type,
      );

  factory Official.fromJson(String str) => Official.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Official.fromMap(Map<String, dynamic> json) => Official(
        role: json["role"],
        title: json["title"],
        desc: json["desc"],
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "role": role,
        "title": title,
        "desc": desc,
        "type": type,
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

class Pendant {
  int pid;
  String name;
  String image;
  int expire;
  String imageEnhance;
  String imageEnhanceFrame;

  Pendant({
    required this.pid,
    required this.name,
    required this.image,
    required this.expire,
    required this.imageEnhance,
    required this.imageEnhanceFrame,
  });

  Pendant copyWith({
    int? pid,
    String? name,
    String? image,
    int? expire,
    String? imageEnhance,
    String? imageEnhanceFrame,
  }) =>
      Pendant(
        pid: pid ?? this.pid,
        name: name ?? this.name,
        image: image ?? this.image,
        expire: expire ?? this.expire,
        imageEnhance: imageEnhance ?? this.imageEnhance,
        imageEnhanceFrame: imageEnhanceFrame ?? this.imageEnhanceFrame,
      );

  factory Pendant.fromJson(String str) => Pendant.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pendant.fromMap(Map<String, dynamic> json) => Pendant(
        pid: json["pid"],
        name: json["name"],
        image: json["image"],
        expire: json["expire"],
        imageEnhance: json["image_enhance"],
        imageEnhanceFrame: json["image_enhance_frame"],
      );

  Map<String, dynamic> toMap() => {
        "pid": pid,
        "name": name,
        "image": image,
        "expire": expire,
        "image_enhance": imageEnhance,
        "image_enhance_frame": imageEnhanceFrame,
      };
}

class Vip {
  int type;
  int status;
  int dueDate;
  int vipPayType;
  int themeType;
  Label label;
  int avatarSubscript;
  String nicknameColor;
  int role;
  String avatarSubscriptUrl;
  int tvVipStatus;
  int tvVipPayType;
  int tvDueDate;
  int vipType;
  int vipStatus;

  Vip({
    required this.type,
    required this.status,
    required this.dueDate,
    required this.vipPayType,
    required this.themeType,
    required this.label,
    required this.avatarSubscript,
    required this.nicknameColor,
    required this.role,
    required this.avatarSubscriptUrl,
    required this.tvVipStatus,
    required this.tvVipPayType,
    required this.tvDueDate,
    required this.vipType,
    required this.vipStatus,
  });

  Vip copyWith({
    int? type,
    int? status,
    int? dueDate,
    int? vipPayType,
    int? themeType,
    Label? label,
    int? avatarSubscript,
    String? nicknameColor,
    int? role,
    String? avatarSubscriptUrl,
    int? tvVipStatus,
    int? tvVipPayType,
    int? tvDueDate,
    int? vipType,
    int? vipStatus,
  }) =>
      Vip(
        type: type ?? this.type,
        status: status ?? this.status,
        dueDate: dueDate ?? this.dueDate,
        vipPayType: vipPayType ?? this.vipPayType,
        themeType: themeType ?? this.themeType,
        label: label ?? this.label,
        avatarSubscript: avatarSubscript ?? this.avatarSubscript,
        nicknameColor: nicknameColor ?? this.nicknameColor,
        role: role ?? this.role,
        avatarSubscriptUrl: avatarSubscriptUrl ?? this.avatarSubscriptUrl,
        tvVipStatus: tvVipStatus ?? this.tvVipStatus,
        tvVipPayType: tvVipPayType ?? this.tvVipPayType,
        tvDueDate: tvDueDate ?? this.tvDueDate,
        vipType: vipType ?? this.vipType,
        vipStatus: vipStatus ?? this.vipStatus,
      );

  factory Vip.fromJson(String str) => Vip.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Vip.fromMap(Map<String, dynamic> json) => Vip(
        type: json["type"],
        status: json["status"],
        dueDate: json["due_date"],
        vipPayType: json["vip_pay_type"],
        themeType: json["theme_type"],
        label: Label.fromMap(json["label"]),
        avatarSubscript: json["avatar_subscript"],
        nicknameColor: json["nickname_color"],
        role: json["role"],
        avatarSubscriptUrl: json["avatar_subscript_url"],
        tvVipStatus: json["tv_vip_status"],
        tvVipPayType: json["tv_vip_pay_type"],
        tvDueDate: json["tv_due_date"],
        vipType: json["vipType"],
        vipStatus: json["vipStatus"],
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "status": status,
        "due_date": dueDate,
        "vip_pay_type": vipPayType,
        "theme_type": themeType,
        "label": label.toMap(),
        "avatar_subscript": avatarSubscript,
        "nickname_color": nicknameColor,
        "role": role,
        "avatar_subscript_url": avatarSubscriptUrl,
        "tv_vip_status": tvVipStatus,
        "tv_vip_pay_type": tvVipPayType,
        "tv_due_date": tvDueDate,
        "vipType": vipType,
        "vipStatus": vipStatus,
      };
}

class Label {
  String path;
  String text;
  String labelTheme;
  String textColor;
  int bgStyle;
  String bgColor;
  String borderColor;
  bool useImgLabel;
  String imgLabelUriHans;
  String imgLabelUriHant;
  String imgLabelUriHansStatic;
  String imgLabelUriHantStatic;

  Label({
    required this.path,
    required this.text,
    required this.labelTheme,
    required this.textColor,
    required this.bgStyle,
    required this.bgColor,
    required this.borderColor,
    required this.useImgLabel,
    required this.imgLabelUriHans,
    required this.imgLabelUriHant,
    required this.imgLabelUriHansStatic,
    required this.imgLabelUriHantStatic,
  });

  Label copyWith({
    String? path,
    String? text,
    String? labelTheme,
    String? textColor,
    int? bgStyle,
    String? bgColor,
    String? borderColor,
    bool? useImgLabel,
    String? imgLabelUriHans,
    String? imgLabelUriHant,
    String? imgLabelUriHansStatic,
    String? imgLabelUriHantStatic,
  }) =>
      Label(
        path: path ?? this.path,
        text: text ?? this.text,
        labelTheme: labelTheme ?? this.labelTheme,
        textColor: textColor ?? this.textColor,
        bgStyle: bgStyle ?? this.bgStyle,
        bgColor: bgColor ?? this.bgColor,
        borderColor: borderColor ?? this.borderColor,
        useImgLabel: useImgLabel ?? this.useImgLabel,
        imgLabelUriHans: imgLabelUriHans ?? this.imgLabelUriHans,
        imgLabelUriHant: imgLabelUriHant ?? this.imgLabelUriHant,
        imgLabelUriHansStatic:
            imgLabelUriHansStatic ?? this.imgLabelUriHansStatic,
        imgLabelUriHantStatic:
            imgLabelUriHantStatic ?? this.imgLabelUriHantStatic,
      );

  factory Label.fromJson(String str) => Label.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Label.fromMap(Map<String, dynamic> json) => Label(
        path: json["path"],
        text: json["text"],
        labelTheme: json["label_theme"],
        textColor: json["text_color"],
        bgStyle: json["bg_style"],
        bgColor: json["bg_color"],
        borderColor: json["border_color"],
        useImgLabel: json["use_img_label"],
        imgLabelUriHans: json["img_label_uri_hans"],
        imgLabelUriHant: json["img_label_uri_hant"],
        imgLabelUriHansStatic: json["img_label_uri_hans_static"],
        imgLabelUriHantStatic: json["img_label_uri_hant_static"],
      );

  Map<String, dynamic> toMap() => {
        "path": path,
        "text": text,
        "label_theme": labelTheme,
        "text_color": textColor,
        "bg_style": bgStyle,
        "bg_color": bgColor,
        "border_color": borderColor,
        "use_img_label": useImgLabel,
        "img_label_uri_hans": imgLabelUriHans,
        "img_label_uri_hant": imgLabelUriHant,
        "img_label_uri_hans_static": imgLabelUriHansStatic,
        "img_label_uri_hant_static": imgLabelUriHantStatic,
      };
}
