import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:image_galally/models/datetime_annotation.dart';

part 'user_meditations_model.freezed.dart';
part 'user_meditations_model.g.dart';

@freezed
abstract class UserMeditations implements _$UserMeditations {
  const UserMeditations._();

  const factory UserMeditations({
    String? id, //document ID
    // required String userId,
    required int meditationNumber,
    required String meditationId,
    // required DateTime registrationAt,
    @CreatedAtField() DateTime? purchasedAt,
    @UpdatedAtField() DateTime? expiredAt,
    @Default(false) bool isFavarite,
  }) = _UserMeditations;

  factory UserMeditations.empty() => const UserMeditations(
        meditationNumber: 0,
        meditationId: '',
      );

  factory UserMeditations.fromJson(Map<String, dynamic> json) =>
      _$UserMeditationsFromJson(json);

  factory UserMeditations.fromDocument(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return UserMeditations.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}
