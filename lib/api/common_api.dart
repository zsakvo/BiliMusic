import 'package:bilimusic/api/ajax.dart';
import 'package:bilimusic/api/const_api.dart';
import 'package:bilimusic/models/common/player_page_list.dart';
import 'package:bilimusic/models/common/subtitle.dart';
import 'package:bilimusic/models/common/video_info.dart';

class CommonApi {
  static Future<List<PlayerPageListItem>> getPlayPageList(
      {String? aid, String? bvid}) async {
    var queryMap = <String, dynamic>{};
    if (aid != "0") {
      queryMap = {"aid": aid};
    } else {
      queryMap = {"bvid": bvid};
    }
    var response =
        await Ajax().get(ApiConstants.videoParts, queryParameters: queryMap);
    return PlayerPageListResponse.fromMap(response.data).data;
  }

  static Future<VideoInfoResponseData?> getVideoInfo(
      {dynamic aid, String? bvid}) async {
    if (aid == null && bvid == null) {
      return null;
    }
    var response = await Ajax().get(ApiConstants.videoInfo,
        queryParameters: {"aid": aid, "bvid": bvid}, needSign: true);
    return VideoInfoResponse.fromMap(response.data).data;
  }

  static Future<List<Body>> getLyric(String url) async {
    var response = await Ajax().get(url);
    return SubtitleResponse.fromMap(response.data).body;
  }

  static Future<List<Body>> getLyricV2({
    dynamic aid,
    String? bvid,
    required cid,
  }) async {
    var response = await Ajax().get(ApiConstants.newSubtitleUrl,
        queryParameters: {"aid": aid, "bvid": bvid, "cid": cid},
        needSign: true);
    final subtitles =
        response.data["data"]["subtitle"]['subtitles'] as List<dynamic>;
    if (subtitles.isEmpty) {
      return [];
    } else {
      final subtitleUrl = subtitles[0]['subtitle_url'];
      // ignore: prefer_interpolation_to_compose_strings
      response = await Ajax().get("https:" + subtitleUrl);
      return SubtitleResponse.fromMap(response.data).body;
    }
  }
}
