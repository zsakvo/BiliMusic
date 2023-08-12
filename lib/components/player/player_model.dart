import 'package:bilimusic/screen/play_list/play_list_model.dart';
import 'package:bilimusic/utils/string.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_audio/just_audio.dart';

part 'player_model.freezed.dart';

@freezed
class PlayerModel with _$PlayerModel {
  const PlayerModel._();
  const factory PlayerModel({
    PlayMedia? media,
    @Default(Duration.zero) Duration total,
    @Default(Duration.zero) Duration progress,
    @Default(Duration.zero) Duration buffered,
    @Default(false) bool isPlaying,
    @Default(false) bool isFavorite,
    @Default(LoopMode.all) LoopMode loopMode,
  }) = _PlayerModel;

  String get totalText => StringFormatUtils.timeLengthFormat(total.inSeconds);
  String get progressText =>
      StringFormatUtils.timeLengthFormat(progress.inSeconds);
}
