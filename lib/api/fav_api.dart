import 'package:bilimusic/models/fav/fav_detail.dart';
import 'package:bilimusic/models/home/fav_resc.dart';

import 'ajax.dart';
import 'const_api.dart';

class FavApi {
  static Future<List<FavMedia>> getFavRescList(mediaId, {pn = 1, ps = 20, keyword = "", order = "mtime"}) async {
    var response = await Ajax().get(
      ApiConstants.favResourceList,
      queryParameters: {'media_id': mediaId, 'pn': pn, 'ps': ps, "keyword": keyword, "order": order},
    );
    final favRescResp = FavRescListResponse.fromMap(response.data);
    return favRescResp.data.medias;
  }

  static Future<FavDetailResponseData> getFavDolderDetail(mediaId) async {
    var response =
        await Ajax().get(ApiConstants.favFolderDetail, queryParameters: {'media_id': mediaId}, needSign: true);
    return FavDetailResponse.fromMap(response.data).data;
  }
}
