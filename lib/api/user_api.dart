import 'package:bilimusic/models/user/user_card.dart';
import 'package:bilimusic/models/user/user_video.dart';
import 'package:bilimusic/utils/log.dart';

import 'ajax.dart';
import 'const_api.dart';

class UserApi {
  static Future userInfo(dynamic mid) async {
    var response = await Ajax().get(ApiConstants.userInfoUrl,
        queryParameters: {
          "mid": mid,
          "token": "",
          "platform": "web",
          "web_location": 1550101
        },
        needSign: true);
    Log.e(response, 'resp');
    return response.data;
  }

  static Future<UserCardResponseData> userCard(dynamic mid) async {
    var response = await Ajax()
        .get(ApiConstants.userCardUrl, queryParameters: {"mid": mid});
    Log.e(response, 'resp');
    return UserCardResponse.fromMap(response.data).data;
  }

  // 获取用户数据
  static Future<dynamic> navStat() async {
    var response = await Ajax().get(ApiConstants.userStat);
    return response.data['data'];
  }

  // 获取用户投稿
  static Future<List<Vlist>> userVideos(dynamic mid, {pn = 1, ps = 30}) async {
    var response = await Ajax().get(ApiConstants.userVideosUrl,
        queryParameters: {
          "mid": mid,
          "pn": pn,
          "ps": ps,
          "keyword": "",
          "tid": 0,
          "platform": "web",
          "order": "pubdate",
          "order_avoided": true,
          "web_location": 1550101
        },
        needSign: true);
    return UserVideoResponse.fromMap(response.data).data.list.vlist;
  }
}
