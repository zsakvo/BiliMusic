import 'dart:convert';

import 'package:bilimusic/utils/string.dart';
import 'package:crypto/crypto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_audio_background/just_audio_background.dart';

part 'play_list_model.freezed.dart';

@freezed
class PlayListModel with _$PlayListModel {
  const PlayListModel._();
  const factory PlayListModel({
    required String type,
    required int id,
    required String cover,
    required String title,
    required String author,
    required int mediaCount,
    required String desc,
    required List<PlayMedia> medias,
  }) = _PlayListModel;

  String get descLine =>
      desc.split("\n").where((e) => e.trim().isNotEmpty).join("\t\t");
}

@freezed
class PlayMedia with _$PlayMedia {
  const PlayMedia._();
  const factory PlayMedia({
    required int id,
    required String cid,
    required String title,
    required String author,
    required String cover,
    required int duration,
    required String intro,
  }) = _PlayMedia;

  String get durationText => StringFormatUtils.timeLengthFormat(duration);

  String get introLine =>
      intro.split("\n").where((e) => e.trim().isNotEmpty).join("\t\t");

  String get mediaId =>
      md5.convert(utf8.encode(title + author + id.toString() + cid)).toString();

  MediaItem get mediaItem {
    return MediaItem(
      id: mediaId,
      title: title,
      artUri: Uri.parse(cover),
      album: "Music",
      artist: author,
      duration: Duration(seconds: duration),
    );
  }
}
