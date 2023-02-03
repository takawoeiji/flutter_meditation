// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as String?,
      username: json['username'] as String,
      email: json['email'] as String,
      registrationAt: const CreatedAtField().fromJson(json['registrationAt']),
      language: json['language'] as String? ?? 'ja',
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'registrationAt': const CreatedAtField().toJson(instance.registrationAt),
      'language': instance.language,
    };
