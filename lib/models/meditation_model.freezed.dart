// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meditation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Meditation _$MeditationFromJson(Map<String, dynamic> json) {
  return _Meditation.fromJson(json);
}

/// @nodoc
mixin _$Meditation {
  String? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get medNo => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get firestore => throw _privateConstructorUsedError;
  String get localName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MeditationCopyWith<Meditation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeditationCopyWith<$Res> {
  factory $MeditationCopyWith(
          Meditation value, $Res Function(Meditation) then) =
      _$MeditationCopyWithImpl<$Res, Meditation>;
  @useResult
  $Res call(
      {String? id,
      String title,
      int medNo,
      String description,
      String firestore,
      String localName});
}

/// @nodoc
class _$MeditationCopyWithImpl<$Res, $Val extends Meditation>
    implements $MeditationCopyWith<$Res> {
  _$MeditationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? medNo = null,
    Object? description = null,
    Object? firestore = null,
    Object? localName = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      medNo: null == medNo
          ? _value.medNo
          : medNo // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      firestore: null == firestore
          ? _value.firestore
          : firestore // ignore: cast_nullable_to_non_nullable
              as String,
      localName: null == localName
          ? _value.localName
          : localName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MeditationCopyWith<$Res>
    implements $MeditationCopyWith<$Res> {
  factory _$$_MeditationCopyWith(
          _$_Meditation value, $Res Function(_$_Meditation) then) =
      __$$_MeditationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String title,
      int medNo,
      String description,
      String firestore,
      String localName});
}

/// @nodoc
class __$$_MeditationCopyWithImpl<$Res>
    extends _$MeditationCopyWithImpl<$Res, _$_Meditation>
    implements _$$_MeditationCopyWith<$Res> {
  __$$_MeditationCopyWithImpl(
      _$_Meditation _value, $Res Function(_$_Meditation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? medNo = null,
    Object? description = null,
    Object? firestore = null,
    Object? localName = null,
  }) {
    return _then(_$_Meditation(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      medNo: null == medNo
          ? _value.medNo
          : medNo // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      firestore: null == firestore
          ? _value.firestore
          : firestore // ignore: cast_nullable_to_non_nullable
              as String,
      localName: null == localName
          ? _value.localName
          : localName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Meditation extends _Meditation with DiagnosticableTreeMixin {
  const _$_Meditation(
      {this.id,
      required this.title,
      required this.medNo,
      required this.description,
      required this.firestore,
      required this.localName})
      : super._();

  factory _$_Meditation.fromJson(Map<String, dynamic> json) =>
      _$$_MeditationFromJson(json);

  @override
  final String? id;
  @override
  final String title;
  @override
  final int medNo;
  @override
  final String description;
  @override
  final String firestore;
  @override
  final String localName;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Meditation(id: $id, title: $title, medNo: $medNo, description: $description, firestore: $firestore, localName: $localName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Meditation'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('medNo', medNo))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('firestore', firestore))
      ..add(DiagnosticsProperty('localName', localName));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Meditation &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.medNo, medNo) || other.medNo == medNo) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.firestore, firestore) ||
                other.firestore == firestore) &&
            (identical(other.localName, localName) ||
                other.localName == localName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, medNo, description, firestore, localName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MeditationCopyWith<_$_Meditation> get copyWith =>
      __$$_MeditationCopyWithImpl<_$_Meditation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MeditationToJson(
      this,
    );
  }
}

abstract class _Meditation extends Meditation {
  const factory _Meditation(
      {final String? id,
      required final String title,
      required final int medNo,
      required final String description,
      required final String firestore,
      required final String localName}) = _$_Meditation;
  const _Meditation._() : super._();

  factory _Meditation.fromJson(Map<String, dynamic> json) =
      _$_Meditation.fromJson;

  @override
  String? get id;
  @override
  String get title;
  @override
  int get medNo;
  @override
  String get description;
  @override
  String get firestore;
  @override
  String get localName;
  @override
  @JsonKey(ignore: true)
  _$$_MeditationCopyWith<_$_Meditation> get copyWith =>
      throw _privateConstructorUsedError;
}
