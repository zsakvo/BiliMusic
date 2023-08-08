import 'package:bilimusic/api/ajax.dart';
import 'package:bilimusic/models/global/nav_info.dart';
import 'package:bilimusic/provider.dart';
import 'package:bilimusic/utils/string.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'const_api.dart';

///get请求参数拼接w_rid和wts字段
///
///用在”用户投稿视频“、”用户投稿专栏“、”首页推送“、”推广信息“、”热搜“、”视频信息“、”视频取流“、”搜索“等接口
class WbiSign {
  static const _mixinKeyEncTab = [
    46,
    47,
    18,
    2,
    53,
    8,
    23,
    32,
    15,
    50,
    10,
    31,
    58,
    3,
    45,
    35,
    27,
    43,
    5,
    49,
    33,
    9,
    42,
    19,
    29,
    28,
    14,
    39,
    12,
    38,
    41,
    13,
    37,
    48,
    7,
    16,
    24,
    55,
    40,
    61,
    26,
    17,
    0,
    1,
    60,
    51,
    30,
    4,
    22,
    25,
    54,
    21,
    56,
    59,
    6,
    63,
    57,
    62,
    11,
    36,
    20,
    34,
    44,
    52
  ];

  //获取最新的wbikeys(即img_key和sub_key的拼接)
  static Future<String> getWbiKeys(dynamic providerContainer) async {
    var response = await Ajax().get(ApiConstants.userInfo);
    NavInfo navInfo = NavInfo.fromMap(response.data);
    providerContainer.read(navInfoProvider.notifier).state = navInfo;
    String imgUrl = navInfo.data.wbiImg.imgUrl;
    String subUrl = navInfo.data.wbiImg.subUrl;
    String imgKey = imgUrl
        .substring(imgUrl.lastIndexOf('/') + 1, imgUrl.length)
        .split('.')[0];
    String subKey = subUrl
        .substring(subUrl.lastIndexOf('/') + 1, subUrl.length)
        .split('.')[0];
    return imgKey + subKey;
  }

  ///为请求参数进行wbi签名
  static Future<Map<String, dynamic>> encodeParams(
      Map<String, dynamic> params, ProviderContainer providerContainer) async {
    String wbiKeys;
    var nowDate = DateTime.now();
    //获取最新的wbikeys
    {
      var localWbiKeys = providerContainer.read(wbiKeysProvider);
      [];
      if (localWbiKeys != null &&
          DateTime.fromMillisecondsSinceEpoch(localWbiKeys["time"] as int)
                  .day ==
              nowDate.day) {
        //如果存在本地的wbikeys且没有过期就使用本地的wbiKeys
        wbiKeys = localWbiKeys["keys"] as String;
      } else {
        //否则获取最新的wbikeys
        wbiKeys = await getWbiKeys(providerContainer);
        providerContainer.read(wbiKeysProvider.notifier).state = {
          "keys": wbiKeys,
          "time": nowDate.millisecondsSinceEpoch
        };
      }
    }
    //打乱重排
    String mixinKeys = "";
    for (var element in _mixinKeyEncTab) {
      mixinKeys += wbiKeys[element];
    }
    //取前32个字符
    mixinKeys = mixinKeys.substring(0, 32);
    //将params拼接后转为字符串
    String query = StringFormatUtils.mapToQueryStringSorted(params);
    //wts为当前时间戳
    int wts = nowDate.millisecondsSinceEpoch ~/ 1000;
    query += '&wts=$wts$mixinKeys';
    String wRid = md5.convert(query.codeUnits).toString();
    return params..addAll({'wts': wts.toString(), 'w_rid': wRid});
  }
}
