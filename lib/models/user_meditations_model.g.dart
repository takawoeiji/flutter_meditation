// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_meditations_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserMeditations _$$_UserMeditationsFromJson(Map<String, dynamic> json) =>
    _$_UserMeditations(
      id: json['id'] as String?,
      meditationNumber: json['meditationNumber'] as int,
      meditationId: json['meditationId'] as String,
      purchasedAt: const CreatedAtField().fromJson(json['purchasedAt']),
      expiredAt: const UpdatedAtField().fromJson(json['expiredAt']),
      isFavarite: json['isFavarite'] as bool? ?? false,
    );

Map<String, dynamic> _$$_UserMeditationsToJson(_$_UserMeditations instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meditationNumber': instance.meditationNumber,
      'meditationId': instance.meditationId,
      'purchasedAt': const CreatedAtField().toJson(instance.purchasedAt),
      'expiredAt': const UpdatedAtField().toJson(instance.expiredAt),
      'isFavarite': instance.isFavarite,
    };
