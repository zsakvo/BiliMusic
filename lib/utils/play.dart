import 'package:bilimusic/screen/play_list/play_list_model.dart';
import 'package:bilimusic/utils/log.dart';
import 'package:just_audio/just_audio.dart';
import 'package:memory_cache/memory_cache.dart';

class Player {
  static final Player _instance = Player._internal();
  factory Player() => _instance;
  static late final AudioPlayer _player;
  static late final ConcatenatingAudioSource _source;
  static List<PlayMedia> _playMediaList = [];

  AudioPlayer get playerInstance => _player;
  List<PlayMedia> get playMediaList => _playMediaList;

  Player._internal() {
    _player = AudioPlayer(
        audioLoadConfiguration: AudioLoadConfiguration(
            androidLoadControl: AndroidLoadControl(
              minBufferDuration: const Duration(seconds: 10),
            ),
            darwinLoadControl: DarwinLoadControl(
                preferredForwardBufferDuration: const Duration(seconds: 10))));
    _source = ConcatenatingAudioSource(
      useLazyPreparation: false,
      shuffleOrder: DefaultShuffleOrder(),
      children: [],
    );
  }

  init() async {
    await _player.setAudioSource(_source,
        preload: false, initialIndex: 0, initialPosition: Duration.zero);
  }

  play(List<PlayMedia> resList, {index = 0}) async {
    Log.e(index, "playIndex");
    _playMediaList = resList;
    final listKey = resList.hashCode;
    final currentKey = MemoryCache.instance.read("_currentListKey");
    if (currentKey != listKey) {
      currentKey == null
          ? MemoryCache.instance.create("_currentListKey", listKey)
          : MemoryCache.instance.update("_currentListKey", listKey);
      final audioSourceList = [
        for (PlayMedia video in resList)
          LockCachingAudioSource(
              Uri.parse(
                  "http://127.0.0.1:43374/v.m4a?aid=${video.aid}&cid=${video.cid}"),
              tag: video.mediaItem),
      ];
      await _source.clear();
      await _source.addAll(audioSourceList);
      _player.seek(Duration.zero, index: index);
      // _player.seek(Duration.zero, index: index);
      _player.play();
    } else {
      _player.seek(Duration.zero, index: index);
    }
  }
}
