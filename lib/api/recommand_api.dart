import 'package:bilimusic/models/recommand/rank_region.dart';

import 'ajax.dart';
import 'const_api.dart';

class RecommandApi {
  static Future<List<RankingRegionVideosResponseData>> requestRankingRegionVideos(rid) async {
    var response = await Ajax().get(
      ApiConstants.rankingRegion,
      queryParameters: {
        'day': 7,
        'rid': rid,
      },
    );

    return RankingRegionVideosResponse.fromMap(response.data).data;
  }
}
