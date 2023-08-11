// To parse this JSON data, do
//
//     final navInfo = navInfoFromMap(jsonString);

import 'dart:convert';

class NavInfo {
  int code;
  String message;
  int ttl;
  Data data;

  NavInfo({
    required this.code,
    required this.message,
    required this.ttl,
    required this.data,
  });

  NavInfo copyWith({
    int? code,
    String? message,
    int? ttl,
    Data? data,
  }) =>
      NavInfo(
        code: code ?? this.code,
        message: message ?? this.message,
        ttl: ttl ?? this.ttl,
        data: data ?? this.data,
      );

  factory NavInfo.fromJson(String str) => NavInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NavInfo.fromMap(Map<String, dynamic> json) => NavInfo(
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
  bool isLogin;
  int? emailVerified;
  String? face;
  int? faceNft;
  int? faceNftType;
  LevelInfo? levelInfo;
  int? mid;
  int? mobileVerified;
  int? money;
  int? moral;
  Official? official;
  OfficialVerify? officialVerify;
  Pendant? pendant;
  int? scores;
  String? uname;
  int? vipDueDate;
  int? vipStatus;
  int? vipType;
  int? vipPayType;
  int? vipThemeType;
  Label? vipLabel;
  int? vipAvatarSubscript;
  String? vipNicknameColor;
  Vip? vip;
  Wallet? wallet;
  bool? hasShop;
  String? shopUrl;
  int? allowanceCount;
  int? answerStatus;
  int? isSeniorMember;
  WbiImg wbiImg;
  bool? isJury;

  Data({
    required this.isLogin,
    this.emailVerified,
    this.face,
    this.faceNft,
    this.faceNftType,
    this.levelInfo,
    this.mid,
    this.mobileVerified,
    this.money,
    this.moral,
    this.official,
    this.officialVerify,
    this.pendant,
    this.scores,
    this.uname,
    this.vipDueDate,
    this.vipStatus,
    this.vipType,
    this.vipPayType,
    this.vipThemeType,
    this.vipLabel,
    this.vipAvatarSubscript,
    this.vipNicknameColor,
    this.vip,
    this.wallet,
    this.hasShop,
    this.shopUrl,
    this.allowanceCount,
    this.answerStatus,
    this.isSeniorMember,
    required this.wbiImg,
    this.isJury,
  });

  Data copyWith({
    bool? isLogin,
    int? emailVerified,
    String? face,
    int? faceNft,
    int? faceNftType,
    LevelInfo? levelInfo,
    int? mid,
    int? mobileVerified,
    int? money,
    int? moral,
    Official? official,
    OfficialVerify? officialVerify,
    Pendant? pendant,
    int? scores,
    String? uname,
    int? vipDueDate,
    int? vipStatus,
    int? vipType,
    int? vipPayType,
    int? vipThemeType,
    Label? vipLabel,
    int? vipAvatarSubscript,
    String? vipNicknameColor,
    Vip? vip,
    Wallet? wallet,
    bool? hasShop,
    String? shopUrl,
    int? allowanceCount,
    int? answerStatus,
    int? isSeniorMember,
    WbiImg? wbiImg,
    bool? isJury,
  }) =>
      Data(
        isLogin: isLogin ?? this.isLogin,
        emailVerified: emailVerified ?? this.emailVerified,
        face: face ?? this.face,
        faceNft: faceNft ?? this.faceNft,
        faceNftType: faceNftType ?? this.faceNftType,
        levelInfo: levelInfo ?? this.levelInfo,
        mid: mid ?? this.mid,
        mobileVerified: mobileVerified ?? this.mobileVerified,
        money: money ?? this.money,
        moral: moral ?? this.moral,
        official: official ?? this.official,
        officialVerify: officialVerify ?? this.officialVerify,
        pendant: pendant ?? this.pendant,
        scores: scores ?? this.scores,
        uname: uname ?? this.uname,
        vipDueDate: vipDueDate ?? this.vipDueDate,
        vipStatus: vipStatus ?? this.vipStatus,
        vipType: vipType ?? this.vipType,
        vipPayType: vipPayType ?? this.vipPayType,
        vipThemeType: vipThemeType ?? this.vipThemeType,
        vipLabel: vipLabel ?? this.vipLabel,
        vipAvatarSubscript: vipAvatarSubscript ?? this.vipAvatarSubscript,
        vipNicknameColor: vipNicknameColor ?? this.vipNicknameColor,
        vip: vip ?? this.vip,
        wallet: wallet ?? this.wallet,
        hasShop: hasShop ?? this.hasShop,
        shopUrl: shopUrl ?? this.shopUrl,
        allowanceCount: allowanceCount ?? this.allowanceCount,
        answerStatus: answerStatus ?? this.answerStatus,
        isSeniorMember: isSeniorMember ?? this.isSeniorMember,
        wbiImg: wbiImg ?? this.wbiImg,
        isJury: isJury ?? this.isJury,
      );

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        pendant:
            json["pendant"] == null ? null : Pendant.fromMap(json["pendant"]),
        money: json["money"],
        faceNftType: json["face_nft_type"],
        mid: json["mid"],
        officialVerify: json["officialVerify"] == null
            ? null
            : OfficialVerify.fromMap(json["officialVerify"]),
        vipPayType: json["vip_pay_type"],
        uname: json["uname"],
        scores: json["scores"],
        mobileVerified: json["mobile_verified"],
        faceNft: json["face_nft"],
        isLogin: json["isLogin"],
        vipDueDate: json["vipDueDate"],
        vipNicknameColor: json["vip_nickname_color"],
        vipType: json["vipType"],
        vipAvatarSubscript: json["vip_avatar_subscript"],
        official: json["official"] == null
            ? null
            : Official.fromMap(json["official"]),
        hasShop: json["has_shop"],
        emailVerified: json["email_verified"],
        answerStatus: json["answer_status"],
        vipStatus: json["vipStatus"],
        isSeniorMember: json["is_senior_member"],
        levelInfo: json["level_info"] == null
            ? null
            : LevelInfo.fromMap(json["level_info"]),
        vipThemeType: json["vip_theme_type"],
        isJury: json["is_jury"],
        moral: json["moral"],
        face: json["face"],
        vipLabel:
            json["vip_label"] == null ? null : Label.fromMap(json["vip_label"]),
        vip: json["vip"] == null ? null : Vip.fromMap(json["vip"]),
        wallet: json["wallet"] == null ? null : Wallet.fromMap(json["wallet"]),
        shopUrl: json["shop_url"],
        wbiImg: WbiImg.fromMap(json["wbi_img"]),
        allowanceCount: json["allowance_count"],
      );

  Map<String, dynamic> toMap() => {
        "isLogin": isLogin,
        "email_verified": emailVerified,
        "face": face,
        "face_nft": faceNft,
        "face_nft_type": faceNftType,
        "level_info": levelInfo?.toMap(),
        "mid": mid,
        "mobile_verified": mobileVerified,
        "money": money,
        "moral": moral,
        "official": official?.toMap(),
        "officialVerify": officialVerify?.toMap(),
        "pendant": pendant?.toMap(),
        "scores": scores,
        "uname": uname,
        "vipDueDate": vipDueDate,
        "vipStatus": vipStatus,
        "vipType": vipType,
        "vip_pay_type": vipPayType,
        "vip_theme_type": vipThemeType,
        "vip_label": vipLabel?.toMap(),
        "vip_avatar_subscript": vipAvatarSubscript,
        "vip_nickname_color": vipNicknameColor,
        "vip": vip?.toMap(),
        "wallet": wallet?.toMap(),
        "has_shop": hasShop,
        "shop_url": shopUrl,
        "allowance_count": allowanceCount,
        "answer_status": answerStatus,
        "is_senior_member": isSeniorMember,
        "wbi_img": wbiImg.toMap(),
        "is_jury": isJury,
      };
}

class LevelInfo {
  int currentLevel;
  int currentMin;
  int currentExp;
  dynamic nextExp;

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
    String? nextExp,
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

class Wallet {
  int mid;
  int bcoinBalance;
  int couponBalance;
  int couponDueTime;

  Wallet({
    required this.mid,
    required this.bcoinBalance,
    required this.couponBalance,
    required this.couponDueTime,
  });

  Wallet copyWith({
    int? mid,
    int? bcoinBalance,
    int? couponBalance,
    int? couponDueTime,
  }) =>
      Wallet(
        mid: mid ?? this.mid,
        bcoinBalance: bcoinBalance ?? this.bcoinBalance,
        couponBalance: couponBalance ?? this.couponBalance,
        couponDueTime: couponDueTime ?? this.couponDueTime,
      );

  factory Wallet.fromJson(String str) => Wallet.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Wallet.fromMap(Map<String, dynamic> json) => Wallet(
        mid: json["mid"],
        bcoinBalance: json["bcoin_balance"],
        couponBalance: json["coupon_balance"],
        couponDueTime: json["coupon_due_time"],
      );

  Map<String, dynamic> toMap() => {
        "mid": mid,
        "bcoin_balance": bcoinBalance,
        "coupon_balance": couponBalance,
        "coupon_due_time": couponDueTime,
      };
}

class WbiImg {
  String imgUrl;
  String subUrl;

  WbiImg({
    required this.imgUrl,
    required this.subUrl,
  });

  WbiImg copyWith({
    String? imgUrl,
    String? subUrl,
  }) =>
      WbiImg(
        imgUrl: imgUrl ?? this.imgUrl,
        subUrl: subUrl ?? this.subUrl,
      );

  factory WbiImg.fromJson(String str) => WbiImg.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory WbiImg.fromMap(Map<String, dynamic> json) => WbiImg(
        imgUrl: json["img_url"],
        subUrl: json["sub_url"],
      );

  Map<String, dynamic> toMap() => {
        "img_url": imgUrl,
        "sub_url": subUrl,
      };
}
