// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'play_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlayListModel {
  String get type => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get cover => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  int get mediaCount => throw _privateConstructorUsedError;
  String get desc => throw _privateConstructorUsedError;
  List<PlayMedia> get medias => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlayListModelCopyWith<PlayListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayListModelCopyWith<$Res> {
  factory $PlayListModelCopyWith(
          PlayListModel value, $Res Function(PlayListModel) then) =
      _$PlayListModelCopyWithImpl<$Res, PlayListModel>;
  @useResult
  $Res call(
      {String type,
      int id,
      String cover,
      String title,
      String author,
      int mediaCount,
      String desc,
      List<PlayMedia> medias});
}

/// @nodoc
class _$PlayListModelCopyWithImpl<$Res, $Val extends PlayListModel>
    implements $PlayListModelCopyWith<$Res> {
  _$PlayListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? cover = null,
    Object? title = null,
    Object? author = null,
    Object? mediaCount = null,
    Object? desc = null,
    Object? medias = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cover: null == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      mediaCount: null == mediaCount
          ? _value.mediaCount
          : mediaCount // ignore: cast_nullable_to_non_nullable
              as int,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      medias: null == medias
          ? _value.medias
          : medias // ignore: cast_nullable_to_non_nullable
              as List<PlayMedia>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlayListModelCopyWith<$Res>
    implements $PlayListModelCopyWith<$Res> {
  factory _$$_PlayListModelCopyWith(
          _$_PlayListModel value, $Res Function(_$_PlayListModel) then) =
      __$$_PlayListModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String type,
      int id,
      String cover,
      String title,
      String author,
      int mediaCount,
      String desc,
      List<PlayMedia> medias});
}

/// @nodoc
class __$$_PlayListModelCopyWithImpl<$Res>
    extends _$PlayListModelCopyWithImpl<$Res, _$_PlayListModel>
    implements _$$_PlayListModelCopyWith<$Res> {
  __$$_PlayListModelCopyWithImpl(
      _$_PlayListModel _value, $Res Function(_$_PlayListModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? cover = null,
    Object? title = null,
    Object? author = null,
    Object? mediaCount = null,
    Object? desc = null,
    Object? medias = null,
  }) {
    return _then(_$_PlayListModel(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cover: null == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      mediaCount: null == mediaCount
          ? _value.mediaCount
          : mediaCount // ignore: cast_nullable_to_non_nullable
              as int,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      medias: null == medias
          ? _value._medias
          : medias // ignore: cast_nullable_to_non_nullable
              as List<PlayMedia>,
    ));
  }
}

/// @nodoc

class _$_PlayListModel extends _PlayListModel {
  const _$_PlayListModel(
      {required this.type,
      required this.id,
      required this.cover,
      required this.title,
      required this.author,
      required this.mediaCount,
      required this.desc,
      required final List<PlayMedia> medias})
      : _medias = medias,
        super._();

  @override
  final String type;
  @override
  final int id;
  @override
  final String cover;
  @override
  final String title;
  @override
  final String author;
  @override
  final int mediaCount;
  @override
  final String desc;
  final List<PlayMedia> _medias;
  @override
  List<PlayMedia> get medias {
    if (_medias is EqualUnmodifiableListView) return _medias;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_medias);
  }

  @override
  String toString() {
    return 'PlayListModel(type: $type, id: $id, cover: $cover, title: $title, author: $author, mediaCount: $mediaCount, desc: $desc, medias: $medias)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlayListModel &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cover, cover) || other.cover == cover) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.mediaCount, mediaCount) ||
                other.mediaCount == mediaCount) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            const DeepCollectionEquality().equals(other._medias, _medias));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, id, cover, title, author,
      mediaCount, desc, const DeepCollectionEquality().hash(_medias));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlayListModelCopyWith<_$_PlayListModel> get copyWith =>
      __$$_PlayListModelCopyWithImpl<_$_PlayListModel>(this, _$identity);
}

abstract class _PlayListModel extends PlayListModel {
  const factory _PlayListModel(
      {required final String type,
      required final int id,
      required final String cover,
      required final String title,
      required final String author,
      required final int mediaCount,
      required final String desc,
      required final List<PlayMedia> medias}) = _$_PlayListModel;
  const _PlayListModel._() : super._();

  @override
  String get type;
  @override
  int get id;
  @override
  String get cover;
  @override
  String get title;
  @override
  String get author;
  @override
  int get mediaCount;
  @override
  String get desc;
  @override
  List<PlayMedia> get medias;
  @override
  @JsonKey(ignore: true)
  _$$_PlayListModelCopyWith<_$_PlayListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PlayMedia {
  int get aid => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  String get cover => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  String get intro => throw _privateConstructorUsedError;
  String? get cid => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlayMediaCopyWith<PlayMedia> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayMediaCopyWith<$Res> {
  factory $PlayMediaCopyWith(PlayMedia value, $Res Function(PlayMedia) then) =
      _$PlayMediaCopyWithImpl<$Res, PlayMedia>;
  @useResult
  $Res call(
      {int aid,
      String title,
      String author,
      String cover,
      int duration,
      String intro,
      String? cid,
      int id});
}

/// @nodoc
class _$PlayMediaCopyWithImpl<$Res, $Val extends PlayMedia>
    implements $PlayMediaCopyWith<$Res> {
  _$PlayMediaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aid = null,
    Object? title = null,
    Object? author = null,
    Object? cover = null,
    Object? duration = null,
    Object? intro = null,
    Object? cid = freezed,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      aid: null == aid
          ? _value.aid
          : aid // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      cover: null == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      intro: null == intro
          ? _value.intro
          : intro // ignore: cast_nullable_to_non_nullable
              as String,
      cid: freezed == cid
          ? _value.cid
          : cid // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlayMediaCopyWith<$Res> implements $PlayMediaCopyWith<$Res> {
  factory _$$_PlayMediaCopyWith(
          _$_PlayMedia value, $Res Function(_$_PlayMedia) then) =
      __$$_PlayMediaCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int aid,
      String title,
      String author,
      String cover,
      int duration,
      String intro,
      String? cid,
      int id});
}

/// @nodoc
class __$$_PlayMediaCopyWithImpl<$Res>
    extends _$PlayMediaCopyWithImpl<$Res, _$_PlayMedia>
    implements _$$_PlayMediaCopyWith<$Res> {
  __$$_PlayMediaCopyWithImpl(
      _$_PlayMedia _value, $Res Function(_$_PlayMedia) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aid = null,
    Object? title = null,
    Object? author = null,
    Object? cover = null,
    Object? duration = null,
    Object? intro = null,
    Object? cid = freezed,
    Object? id = null,
  }) {
    return _then(_$_PlayMedia(
      aid: null == aid
          ? _value.aid
          : aid // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      cover: null == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      intro: null == intro
          ? _value.intro
          : intro // ignore: cast_nullable_to_non_nullable
              as String,
      cid: freezed == cid
          ? _value.cid
          : cid // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_PlayMedia extends _PlayMedia {
  const _$_PlayMedia(
      {required this.aid,
      required this.title,
      required this.author,
      required this.cover,
      required this.duration,
      required this.intro,
      this.cid,
      this.id = Isar.autoIncrement})
      : super._();

  @override
  final int aid;
  @override
  final String title;
  @override
  final String author;
  @override
  final String cover;
  @override
  final int duration;
  @override
  final String intro;
  @override
  final String? cid;
  @override
  @JsonKey()
  final int id;

  @override
  String toString() {
    return 'PlayMedia(aid: $aid, title: $title, author: $author, cover: $cover, duration: $duration, intro: $intro, cid: $cid, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlayMedia &&
            (identical(other.aid, aid) || other.aid == aid) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.cover, cover) || other.cover == cover) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.intro, intro) || other.intro == intro) &&
            (identical(other.cid, cid) || other.cid == cid) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, aid, title, author, cover, duration, intro, cid, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlayMediaCopyWith<_$_PlayMedia> get copyWith =>
      __$$_PlayMediaCopyWithImpl<_$_PlayMedia>(this, _$identity);
}

abstract class _PlayMedia extends PlayMedia {
  const factory _PlayMedia(
      {required final int aid,
      required final String title,
      required final String author,
      required final String cover,
      required final int duration,
      required final String intro,
      final String? cid,
      final int id}) = _$_PlayMedia;
  const _PlayMedia._() : super._();

  @override
  int get aid;
  @override
  String get title;
  @override
  String get author;
  @override
  String get cover;
  @override
  int get duration;
  @override
  String get intro;
  @override
  String? get cid;
  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_PlayMediaCopyWith<_$_PlayMedia> get copyWith =>
      throw _privateConstructorUsedError;
}
