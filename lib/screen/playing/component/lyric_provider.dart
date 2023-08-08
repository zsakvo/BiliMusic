import 'package:bilimusic/api/common_api.dart';
import 'package:bilimusic/models/common/subtitle.dart';
import 'package:bilimusic/screen/playing/playing_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final subtitleProvider = FutureProvider<List<Body>>((ref) async {
  final currentPlayingResData = await ref.watch(playingResDataProvider.future);
  if (currentPlayingResData != null) {
    if (currentPlayingResData.subtitle!.list!.isEmpty) {
      return [];
    } else {
      // final url = currentPlayingResData.subtitle!.list!.first.subtitleUrl!;
      return await CommonApi.getLyricV2(
          aid: currentPlayingResData.aid,
          bvid: currentPlayingResData.bvid,
          cid: currentPlayingResData.cid);
    }
  } else {
    return [];
  }
});

final lyricProvider = FutureProvider<List<dynamic>>((ref) async {
  final subtitle = await ref.watch(subtitleProvider.future);
  final contents = subtitle.map((e) => e.content).toList();
  final List<double> timeLine = [];
  for (var element in subtitle) {
    timeLine.add(element.from * 1000.0);
  }
  return [contents, timeLine];
});

final currentLineProvider = StateProvider<int>((ref) {
  return 0;
});
