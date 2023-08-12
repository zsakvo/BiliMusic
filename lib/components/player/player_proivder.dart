import 'package:bilimusic/components/player/player_model.dart';
import 'package:bilimusic/screen/local_fav/local_fav_provider.dart';
import 'package:bilimusic/screen/play_list/play_list_model.dart';
import 'package:bilimusic/utils/log.dart';
import 'package:bilimusic/utils/play.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

class PlayerComponentNotifier extends FamilyNotifier<PlayerModel, Player> {
  _positionStreamListener(Duration event) {
    state = state.copyWith(progress: event);
  }

  _bufferedPositionStreamListener(Duration event) {
    state = state.copyWith(
        buffered: event, total: arg.playerInstance.duration ?? Duration.zero);
  }

  _sequenceStateStreamListener(SequenceState? sequenceState) {
    String? mediaId = sequenceState?.currentSource?.tag?.id;
    PlayMedia? media = arg.playMediaList
        .where((element) => element.mediaId == mediaId)
        .firstOrNull;
    state = state.copyWith(media: media);
  }

  // _currentIndexStreamListener(int ?index){
  //   state = state.copyWith(media: );
  // }

  _playerStateStreamListener(PlayerState? playerState) {
    state = state.copyWith(isPlaying: playerState?.playing ?? false);
    switch (playerState?.processingState) {
      case ProcessingState.buffering:
        break;
      case ProcessingState.ready:
        break;
      case ProcessingState.loading:
        break;
      case ProcessingState.completed:
        break;
      case ProcessingState.idle:
        break;
      default:
    }
  }

  @override
  PlayerModel build(Player arg) {
    arg.playerInstance.positionStream.listen(_positionStreamListener);
    arg.playerInstance.bufferedPositionStream
        .listen(_bufferedPositionStreamListener);
    arg.playerInstance.sequenceStateStream.listen(_sequenceStateStreamListener);
    // arg.playerInstance.currentIndexStream.listen(_currentIndexStreamListener);
    arg.playerInstance.playerStateStream.listen(_playerStateStreamListener);

    return const PlayerModel();
  }

  playPreviousHandler() {
    if (state.media != null) {
      arg.playerInstance.seekToPrevious();
    }
  }

  playHandler() {
    if (state.media != null) {
      arg.playerInstance.playerState.playing
          ? arg.playerInstance.pause()
          : arg.playerInstance.play();
      state = state.copyWith(isPlaying: arg.playerInstance.playerState.playing);
    }
  }

  playNextHandler() {
    if (state.media != null) {
      arg.playerInstance.seekToNext();
    }
  }

  favoriteHandler() {
    if (state.media != null) {
      ref
          .read(localFavItemsProvider.notifier)
          .toggleItem(state.media as dynamic);
      state = state.copyWith(isFavorite: !state.isFavorite);
    }
  }

  toggleLoopMode() {
    switch (arg.playerInstance.loopMode) {
      case LoopMode.off:
        arg.playerInstance.setLoopMode(LoopMode.one);
        break;
      case LoopMode.one:
        arg.playerInstance.setLoopMode(LoopMode.all);
        break;
      case LoopMode.all:
        arg.playerInstance.setLoopMode(LoopMode.off);
        break;
    }
    state = state.copyWith(loopMode: arg.playerInstance.loopMode);
  }

  onProgressBarDragStart() {
    // arg.playerInstance.pause();
  }

  onProgressBarDragEnd() {
    // arg.playerInstance.play();
    if (state.media == null) {
      arg.playerInstance.seek(const Duration(milliseconds: 0));
    }
  }

  onProgressBarSeek(Duration duration) {
    Log.d('onProgressBarSeek: $duration');
    Log.e('onProgressBarSeek: ${arg.playerInstance.duration}');
    if (state.media != null) {
      arg.playerInstance.seek(duration);
    }
  }
}

final playerComponentProvider =
    NotifierProvider.family<PlayerComponentNotifier, PlayerModel, Player>(
        PlayerComponentNotifier.new);
