import 'package:bilimusic/api/ajax.dart';
import 'package:bilimusic/api/const_api.dart';
import 'package:bilimusic/models/discover/collect_list.dart';
import 'package:bilimusic/models/discover/swipe_data.dart';
import 'package:bilimusic/utils/log.dart';

class DiscoverApi {
  static Future<List<SwipeCard>> getDiscoverSipeData() async {
    var response = await Ajax().get(ApiConstants.swipeDataUrl);
    return DiscoverSwipeDataResponse.fromMap(response.data).data.the4979;
  }

  static Future<List<CollectListResponseListElement>> getCollectList(
      {required int? upMid, pn = 1, ps = 14}) async {
    if (upMid == null) return [];
    var response = await Ajax().get(ApiConstants.collectListUrl,
        queryParameters: {
          "platform": "web",
          "pn": pn,
          "ps": ps,
          "up_mid": upMid
        });
    return CollectListResponse.fromMap(response.data).data.list;
  }
}
