// B 站的资源分为视频和音频，统一维护
import 'dart:convert';

import 'package:bilimusic/api/audio_api.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

part 'provider.g.dart';

enum ResType { video, audio }

///统一封装的待播放资源
///
///[type] 资源类型
///
///[title] 名称
///
///[artist] UP 主
///
///[cover] 封面地址
///
///[aid] 视频 aid
///
///[cid] 视频 cid
///
///[intro] 资源简介
///
///
@collection
class PlayRes {
  @enumerated
  final ResType type;
  final String title;
  final String artist;
  final String cover;
  final int? aid;
  final String? bvid;
  final int? cid;
  final String? intro;
  Id id = Isar.autoIncrement;

  PlayRes(
      {required this.type,
      required this.title,
      required this.artist,
      required this.cover,
      this.aid,
      this.bvid,
      this.cid,
      this.intro});

  @ignore
  Future<String> get playUrl async {
    var url = await Api.getAudioCdnUrl(aid: aid, cid: cid);
    return url;
  }

  @ignore
  MediaItem get mediaItem {
    return MediaItem(
        id: md5.convert(utf8.encode(title + artist)).toString(),
        title: title,
        artUri: Uri.parse(cover),
        album: "Music",
        artist: artist);
  }

  @ignore
  String get resId {
    if (aid != null) {
      return "AV$aid";
    } else {
      return bvid!;
    }
  }
}

class PlayResNotifier extends Notifier<List<PlayRes>> {
  @override
  List<PlayRes> build() {
    return [];
  }

  addRes(
      {required String title,
      required String artist,
      required String cover,
      required int aid,
      required int cid,
      required String intro,
      type = ResType.video}) {
    state.add(PlayRes(
        type: type,
        title: title,
        artist: artist,
        cover: cover,
        aid: aid,
        cid: cid,
        intro: intro));
  }

  replaceList(List<PlayRes> list) {
    state = list;
  }
}

final playResProvider = NotifierProvider<PlayResNotifier, List<PlayRes>>(() {
  return PlayResNotifier();
});

final playerStateProvider = StateProvider((ref) => false);

final currentPlayingIndex = StateProvider((ref) => 0);

final currentPlayingRes = StateProvider<PlayRes?>((ref) => null);

final playerDetailControllerProvider =
    StateProvider<PersistentBottomSheetController?>((ref) => null);

final playListProvider = StateProvider((ref) => ConcatenatingAudioSource(
      // Start loading next item just before reaching it
      useLazyPreparation: true,
      // Customise the shuffle algorithm
      shuffleOrder: DefaultShuffleOrder(),
      // Specify the playlist items
      children: [],
    ));
