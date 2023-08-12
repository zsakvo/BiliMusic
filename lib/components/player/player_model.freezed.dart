// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlayerModel {
  PlayMedia? get media => throw _privateConstructorUsedError;
  Duration get total => throw _privateConstructorUsedError;
  Duration get progress => throw _privateConstructorUsedError;
  Duration get buffered => throw _privateConstructorUsedError;
  bool get isPlaying => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;
  LoopMode get loopMode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlayerModelCopyWith<PlayerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerModelCopyWith<$Res> {
  factory $PlayerModelCopyWith(
          PlayerModel value, $Res Function(PlayerModel) then) =
      _$PlayerModelCopyWithImpl<$Res, PlayerModel>;
  @useResult
  $Res call(
      {PlayMedia? media,
      Duration total,
      Duration progress,
      Duration buffered,
      bool isPlaying,
      bool isFavorite,
      LoopMode loopMode});

  $PlayMediaCopyWith<$Res>? get media;
}

/// @nodoc
class _$PlayerModelCopyWithImpl<$Res, $Val extends PlayerModel>
    implements $PlayerModelCopyWith<$Res> {
  _$PlayerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? media = freezed,
    Object? total = null,
    Object? progress = null,
    Object? buffered = null,
    Object? isPlaying = null,
    Object? isFavorite = null,
    Object? loopMode = null,
  }) {
    return _then(_value.copyWith(
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as PlayMedia?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as Duration,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as Duration,
      buffered: null == buffered
          ? _value.buffered
          : buffered // ignore: cast_nullable_to_non_nullable
              as Duration,
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      loopMode: null == loopMode
          ? _value.loopMode
          : loopMode // ignore: cast_nullable_to_non_nullable
              as LoopMode,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PlayMediaCopyWith<$Res>? get media {
    if (_value.media == null) {
      return null;
    }

    return $PlayMediaCopyWith<$Res>(_value.media!, (value) {
      return _then(_value.copyWith(media: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PlayerModelCopyWith<$Res>
    implements $PlayerModelCopyWith<$Res> {
  factory _$$_PlayerModelCopyWith(
          _$_PlayerModel value, $Res Function(_$_PlayerModel) then) =
      __$$_PlayerModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PlayMedia? media,
      Duration total,
      Duration progress,
      Duration buffered,
      bool isPlaying,
      bool isFavorite,
      LoopMode loopMode});

  @override
  $PlayMediaCopyWith<$Res>? get media;
}

/// @nodoc
class __$$_PlayerModelCopyWithImpl<$Res>
    extends _$PlayerModelCopyWithImpl<$Res, _$_PlayerModel>
    implements _$$_PlayerModelCopyWith<$Res> {
  __$$_PlayerModelCopyWithImpl(
      _$_PlayerModel _value, $Res Function(_$_PlayerModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? media = freezed,
    Object? total = null,
    Object? progress = null,
    Object? buffered = null,
    Object? isPlaying = null,
    Object? isFavorite = null,
    Object? loopMode = null,
  }) {
    return _then(_$_PlayerModel(
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as PlayMedia?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as Duration,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as Duration,
      buffered: null == buffered
          ? _value.buffered
          : buffered // ignore: cast_nullable_to_non_nullable
              as Duration,
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      loopMode: null == loopMode
          ? _value.loopMode
          : loopMode // ignore: cast_nullable_to_non_nullable
              as LoopMode,
    ));
  }
}

/// @nodoc

class _$_PlayerModel extends _PlayerModel {
  const _$_PlayerModel(
      {this.media,
      this.total = Duration.zero,
      this.progress = Duration.zero,
      this.buffered = Duration.zero,
      this.isPlaying = false,
      this.isFavorite = false,
      this.loopMode = LoopMode.all})
      : super._();

  @override
  final PlayMedia? media;
  @override
  @JsonKey()
  final Duration total;
  @override
  @JsonKey()
  final Duration progress;
  @override
  @JsonKey()
  final Duration buffered;
  @override
  @JsonKey()
  final bool isPlaying;
  @override
  @JsonKey()
  final bool isFavorite;
  @override
  @JsonKey()
  final LoopMode loopMode;

  @override
  String toString() {
    return 'PlayerModel(media: $media, total: $total, progress: $progress, buffered: $buffered, isPlaying: $isPlaying, isFavorite: $isFavorite, loopMode: $loopMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlayerModel &&
            (identical(other.media, media) || other.media == media) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.buffered, buffered) ||
                other.buffered == buffered) &&
            (identical(other.isPlaying, isPlaying) ||
                other.isPlaying == isPlaying) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.loopMode, loopMode) ||
                other.loopMode == loopMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, media, total, progress, buffered,
      isPlaying, isFavorite, loopMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlayerModelCopyWith<_$_PlayerModel> get copyWith =>
      __$$_PlayerModelCopyWithImpl<_$_PlayerModel>(this, _$identity);
}

abstract class _PlayerModel extends PlayerModel {
  const factory _PlayerModel(
      {final PlayMedia? media,
      final Duration total,
      final Duration progress,
      final Duration buffered,
      final bool isPlaying,
      final bool isFavorite,
      final LoopMode loopMode}) = _$_PlayerModel;
  const _PlayerModel._() : super._();

  @override
  PlayMedia? get media;
  @override
  Duration get total;
  @override
  Duration get progress;
  @override
  Duration get buffered;
  @override
  bool get isPlaying;
  @override
  bool get isFavorite;
  @override
  LoopMode get loopMode;
  @override
  @JsonKey(ignore: true)
  _$$_PlayerModelCopyWith<_$_PlayerModel> get copyWith =>
      throw _privateConstructorUsedError;
}
