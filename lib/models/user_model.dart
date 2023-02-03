import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:image_galally/models/datetime_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class User implements _$User {
  const User._();

  const factory User({
    String? id,
    required String username,
    required String email,
    // required DateTime registrationAt,
    @CreatedAtField() DateTime? registrationAt,
    @Default('ja') String language,
  }) = _User;

  factory User.empty() =>
      User(username: '', email: '', registrationAt: DateTime.now());

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return User.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}
