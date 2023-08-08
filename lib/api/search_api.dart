import 'package:bilimusic/api/ajax.dart';
import 'package:bilimusic/api/const_api.dart';
import 'package:bilimusic/models/search/search_user.dart';
import 'package:bilimusic/models/search/search_video.dart';
import 'package:bilimusic/utils/log.dart';

class SearchApi {
  // 添加一个合并的搜索方法
  static Future<List<dynamic>> search(
      String keyword, Map<String, dynamic> extraParams,
      {page = 1, searchType = "video"}) async {
    if (keyword.isEmpty) return [];
    // 打印 extraParams
    final params = {
      ...extraParams,
      "keyword": keyword,
      "page": page,
      "search_type": searchType
    };
    Log.d("params: $params");
    final response =
        await Ajax().get(ApiConstants.searchWithType, queryParameters: params);
    return searchType == "video"
        ? SearchVideoResultResponse.fromMap(response.data).data.result
        : SearchUserResponse.fromMap(response.data).data.result ?? [];
  }
}
