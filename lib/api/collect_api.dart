import 'package:bilimusic/api/ajax.dart';
import 'package:bilimusic/api/const_api.dart';
import 'package:bilimusic/models/collect/collect_medias.dart';

class CollectApi {
  static Future<CollectMediasResponseData> getCollectMedias(id, {pn = 1, ps = 20}) async {
    var response = await Ajax()
        .get(ApiConstants.collectListMediasUrl, queryParameters: {"season_id": id, "pn": pn, "ps": ps}, needSign: true);

    var s = CollectMediasResponse.fromMap(response.data).data;
    return s;
  }
}
