// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_meditations_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserMeditations _$UserMeditationsFromJson(Map<String, dynamic> json) {
  return _UserMeditations.fromJson(json);
}

/// @nodoc
mixin _$UserMeditations {
  String? get id => throw _privateConstructorUsedError; //document ID
// required String userId,
  int get meditationNumber => throw _privateConstructorUsedError;
  String get meditationId =>
      throw _privateConstructorUsedError; // required DateTime registrationAt,
  @CreatedAtField()
  DateTime? get purchasedAt => throw _privateConstructorUsedError;
  @UpdatedAtField()
  DateTime? get expiredAt => throw _privateConstructorUsedError;
  bool get isFavarite => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserMeditationsCopyWith<UserMeditations> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserMeditationsCopyWith<$Res> {
  factory $UserMeditationsCopyWith(
          UserMeditations value, $Res Function(UserMeditations) then) =
      _$UserMeditationsCopyWithImpl<$Res, UserMeditations>;
  @useResult
  $Res call(
      {String? id,
      int meditationNumber,
      String meditationId,
      @CreatedAtField() DateTime? purchasedAt,
      @UpdatedAtField() DateTime? expiredAt,
      bool isFavarite});
}

/// @nodoc
class _$UserMeditationsCopyWithImpl<$Res, $Val extends UserMeditations>
    implements $UserMeditationsCopyWith<$Res> {
  _$UserMeditationsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? meditationNumber = null,
    Object? meditationId = null,
    Object? purchasedAt = freezed,
    Object? expiredAt = freezed,
    Object? isFavarite = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      meditationNumber: null == meditationNumber
          ? _value.meditationNumber
          : meditationNumber // ignore: cast_nullable_to_non_nullable
              as int,
      meditationId: null == meditationId
          ? _value.meditationId
          : meditationId // ignore: cast_nullable_to_non_nullable
              as String,
      purchasedAt: freezed == purchasedAt
          ? _value.purchasedAt
          : purchasedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiredAt: freezed == expiredAt
          ? _value.expiredAt
          : expiredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isFavarite: null == isFavarite
          ? _value.isFavarite
          : isFavarite // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserMeditationsCopyWith<$Res>
    implements $UserMeditationsCopyWith<$Res> {
  factory _$$_UserMeditationsCopyWith(
          _$_UserMeditations value, $Res Function(_$_UserMeditations) then) =
      __$$_UserMeditationsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      int meditationNumber,
      String meditationId,
      @CreatedAtField() DateTime? purchasedAt,
      @UpdatedAtField() DateTime? expiredAt,
      bool isFavarite});
}

/// @nodoc
class __$$_UserMeditationsCopyWithImpl<$Res>
    extends _$UserMeditationsCopyWithImpl<$Res, _$_UserMeditations>
    implements _$$_UserMeditationsCopyWith<$Res> {
  __$$_UserMeditationsCopyWithImpl(
      _$_UserMeditations _value, $Res Function(_$_UserMeditations) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? meditationNumber = null,
    Object? meditationId = null,
    Object? purchasedAt = freezed,
    Object? expiredAt = freezed,
    Object? isFavarite = null,
  }) {
    return _then(_$_UserMeditations(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      meditationNumber: null == meditationNumber
          ? _value.meditationNumber
          : meditationNumber // ignore: cast_nullable_to_non_nullable
              as int,
      meditationId: null == meditationId
          ? _value.meditationId
          : meditationId // ignore: cast_nullable_to_non_nullable
              as String,
      purchasedAt: freezed == purchasedAt
          ? _value.purchasedAt
          : purchasedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiredAt: freezed == expiredAt
          ? _value.expiredAt
          : expiredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isFavarite: null == isFavarite
          ? _value.isFavarite
          : isFavarite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserMeditations extends _UserMeditations with DiagnosticableTreeMixin {
  const _$_UserMeditations(
      {this.id,
      required this.meditationNumber,
      required this.meditationId,
      @CreatedAtField() this.purchasedAt,
      @UpdatedAtField() this.expiredAt,
      this.isFavarite = false})
      : super._();

  factory _$_UserMeditations.fromJson(Map<String, dynamic> json) =>
      _$$_UserMeditationsFromJson(json);

  @override
  final String? id;
//document ID
// required String userId,
  @override
  final int meditationNumber;
  @override
  final String meditationId;
// required DateTime registrationAt,
  @override
  @CreatedAtField()
  final DateTime? purchasedAt;
  @override
  @UpdatedAtField()
  final DateTime? expiredAt;
  @override
  @JsonKey()
  final bool isFavarite;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserMeditations(id: $id, meditationNumber: $meditationNumber, meditationId: $meditationId, purchasedAt: $purchasedAt, expiredAt: $expiredAt, isFavarite: $isFavarite)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserMeditations'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('meditationNumber', meditationNumber))
      ..add(DiagnosticsProperty('meditationId', meditationId))
      ..add(DiagnosticsProperty('purchasedAt', purchasedAt))
      ..add(DiagnosticsProperty('expiredAt', expiredAt))
      ..add(DiagnosticsProperty('isFavarite', isFavarite));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserMeditations &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.meditationNumber, meditationNumber) ||
                other.meditationNumber == meditationNumber) &&
            (identical(other.meditationId, meditationId) ||
                other.meditationId == meditationId) &&
            (identical(other.purchasedAt, purchasedAt) ||
                other.purchasedAt == purchasedAt) &&
            (identical(other.expiredAt, expiredAt) ||
                other.expiredAt == expiredAt) &&
            (identical(other.isFavarite, isFavarite) ||
                other.isFavarite == isFavarite));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, meditationNumber,
      meditationId, purchasedAt, expiredAt, isFavarite);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserMeditationsCopyWith<_$_UserMeditations> get copyWith =>
      __$$_UserMeditationsCopyWithImpl<_$_UserMeditations>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserMeditationsToJson(
      this,
    );
  }
}

abstract class _UserMeditations extends UserMeditations {
  const factory _UserMeditations(
      {final String? id,
      required final int meditationNumber,
      required final String meditationId,
      @CreatedAtField() final DateTime? purchasedAt,
      @UpdatedAtField() final DateTime? expiredAt,
      final bool isFavarite}) = _$_UserMeditations;
  const _UserMeditations._() : super._();

  factory _UserMeditations.fromJson(Map<String, dynamic> json) =
      _$_UserMeditations.fromJson;

  @override
  String? get id;
  @override //document ID
// required String userId,
  int get meditationNumber;
  @override
  String get meditationId;
  @override // required DateTime registrationAt,
  @CreatedAtField()
  DateTime? get purchasedAt;
  @override
  @UpdatedAtField()
  DateTime? get expiredAt;
  @override
  bool get isFavarite;
  @override
  @JsonKey(ignore: true)
  _$$_UserMeditationsCopyWith<_$_UserMeditations> get copyWith =>
      throw _privateConstructorUsedError;
}
