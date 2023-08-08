import 'package:bilimusic/api/common_api.dart';

class VideoUtil {
  static formatTimeLength(int milliseconds) {
    Duration duration = Duration(milliseconds: milliseconds);
    int minutes = duration.inMinutes.remainder(60);
    int seconds = duration.inSeconds.remainder(60);
    int hours = duration.inHours.remainder(60);

    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');
    String hoursStr = hours.toString().padLeft(2, '0');

    return milliseconds >= 3600 ? '$hoursStr:$minutesStr:$secondsStr' : '$minutesStr:$secondsStr';
  }

  static idToCid({String? bvid, String? aid}) async {
    var list = await CommonApi.getPlayPageList(aid: aid, bvid: bvid);
    return list.first.cid.toString();
  }
}
