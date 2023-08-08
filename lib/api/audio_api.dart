import 'package:bilimusic/models/audio/video_dash.dart';

import 'ajax.dart';
import 'const_api.dart';

class Api {
  static Future<dynamic> getAudioCdnUrl(
      {required dynamic aid,
      required dynamic cid,
      qn = 112,
      fnver = 0,
      fourk = 1}) async {
    var response = await Ajax().get(ApiConstants.videoPlay,
        queryParameters: {
          'avid': aid,
          'cid': cid,
          'qn': qn,
          "fnval": "16",
          "fnver": fnver,
          "fourk": fourk
        },
        needSign: true);

    var videoDashResp = VideoDashResponse.fromMap(response.data);
    return videoDashResp.data.dash.audio.last.baseUrl;
  }
}
