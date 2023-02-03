// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meditation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Meditation _$$_MeditationFromJson(Map<String, dynamic> json) =>
    _$_Meditation(
      id: json['id'] as String?,
      title: json['title'] as String,
      medNo: json['medNo'] as int,
      description: json['description'] as String,
      firestore: json['firestore'] as String,
      localName: json['localName'] as String,
    );

Map<String, dynamic> _$$_MeditationToJson(_$_Meditation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'medNo': instance.medNo,
      'description': instance.description,
      'firestore': instance.firestore,
      'localName': instance.localName,
    };
