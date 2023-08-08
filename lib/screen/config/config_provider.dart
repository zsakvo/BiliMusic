import 'dart:io';

import 'package:bilimusic/main.dart';

import 'package:bilimusic/utils/string.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

final filterKeysProvider =
    StateProvider((ref) => spInstance.getStringList('filterKeys') ?? []);

final filterBlackProvider =
    StateProvider((ref) => spInstance.getBool('filterBlack') ?? true);

Future<Directory> getAudioCacheDir() async =>
    Directory(p.join((await getTemporaryDirectory()).path, 'just_audio_cache'));

Future<Directory> getPicCacheDir() async => Directory(
    p.join((await getTemporaryDirectory()).path, 'libCachedImageData'));

Future<int> getDirSize(Directory dir) async {
  // final dir = await getAudioCacheDir();
  // Log.e(dir.path);
  if (!await dir.exists()) {
    return 0;
  }
  final list = await dir.list().toList();
  int size = 0;
  for (final item in list) {
    size += item.statSync().size;
  }
  return size;
}

Future<String> getCacheSize() async {
  final audioDir = await getAudioCacheDir();
  final picDir = await getPicCacheDir();
  final audioSize = await getDirSize(audioDir);
  final picSize = await getDirSize(picDir);
  return StringFormatUtils.byteToSizeString(audioSize + picSize);
}

// 清除缓存
Future<void> clearCache() async {
  final picDir = await getPicCacheDir();
  await picDir.delete(recursive: true);
  if (await picDir.exists()) {
    await AudioPlayer.clearAssetCache();
  }
}
