import 'dart:io';

import 'package:bilimusic/utils/log.dart';
import 'package:clipboard/clipboard.dart';

class MiscUtil {
  static share(String text) async {
    var shareString = "Hi~ 我发现了一个有趣的列表，现在分享给你：$text";
    FlutterClipboard.copy(shareString).then((value) => Log.d('copied'));
  }

  static isDesktop() {
    return (Platform.isLinux || Platform.isMacOS || Platform.isWindows);
  }
}
