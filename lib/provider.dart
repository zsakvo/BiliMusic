import 'package:bilimusic/main.dart';
import 'package:bilimusic/models/global/nav_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

import 'api/const_api.dart';

final playerProvider =
    StateProvider((ref) => AudioPlayer(userAgent: ApiConstants.userAgent));

final navInfoProvider = StateProvider<NavInfo?>((ref) {
  return null;
});

final wbiKeysProvider = StateProvider<Map<String, dynamic>?>((ref) => null);

final themeColorProvider =
    StateProvider((ref) => spInstance.getInt("colorTheme") ?? 0);
