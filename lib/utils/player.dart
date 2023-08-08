import 'package:bilimusic/components/player/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

class PlayerUtils {
  static playRes(AudioPlayer player, WidgetRef ref, PlayRes res,
      {append = true}) async {
    if (!append) {
      ref.read(playResProvider.notifier).replaceList([res]);
      ref.read(currentPlayingIndex.notifier).state = 0;
      ref.read(currentPlayingRes.notifier).state = res;
      await ref.read(playListProvider).clear();
      await ref.read(playListProvider).add(AudioSource.uri(
          Uri.parse(
            "http://127.0.0.1:43374/v.m4a?aid=${res.aid}&bvid=${res.bvid}&cid=${res.cid}",
          ),
          tag: res.mediaItem));
      await player.setAudioSource(ref.read(playListProvider),
          initialIndex: 0, initialPosition: Duration.zero);
    }
    player.play();
  }

  static playList(AudioPlayer player, WidgetRef ref, List<PlayRes> resList,
      {replace = true, initialIndex = 0}) async {
    ref.read(playResProvider.notifier).replaceList(resList);
    ref.read(currentPlayingIndex.notifier).state = initialIndex;
    ref.read(currentPlayingRes.notifier).state = resList[initialIndex];
    await ref.read(playListProvider).clear();
    final resolvingAudioSource = [
      for (PlayRes video in resList)
        AudioSource.uri(
            Uri.parse(
                "http://127.0.0.1:43374/v.m4a?aid=${video.aid}&bvid=${video.bvid}&cid=${video.cid}"),
            tag: video.mediaItem),
    ];
    ref.read(playListProvider).addAll(resolvingAudioSource);
    await player.setAudioSource(ref.read(playListProvider),
        initialIndex: initialIndex, initialPosition: Duration.zero);
    player.play();
  }
}
