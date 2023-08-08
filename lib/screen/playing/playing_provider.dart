import 'package:bilimusic/api/common_api.dart';
import 'package:bilimusic/models/common/video_info.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:bilimusic/components/player/provider.dart';

class Playing {
  PlayRes? res;
  Playing({this.res});

  Playing copyWith({
    PlayRes? res,
  }) {
    return Playing(
      res: res ?? this.res,
    );
  }
}

class PlayingNotifier extends StateNotifier<Playing> {
  StateNotifierProviderRef<PlayingNotifier, Playing> ref;
  PlayingNotifier(this.ref) : super(Playing(res: ref.watch(currentPlayingRes)));
  updateCurrentRes(PlayRes res) {
    state = state.copyWith(res: res);
  }
}

final playingNotifier = StateNotifierProvider<PlayingNotifier, Playing>((ref) {
  return PlayingNotifier(ref);
});

final playingResDataProvider = FutureProvider<VideoInfoResponseData?>((ref) async {
  final currentPlaying = ref.watch(currentPlayingRes);
  return CommonApi.getVideoInfo(aid: currentPlaying?.aid, bvid: currentPlaying?.bvid);
});
