import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'meditation_model.freezed.dart';
part 'meditation_model.g.dart';

@freezed
abstract class Meditation implements _$Meditation {
  const Meditation._();

  const factory Meditation({
    String? id,
    required String title,
    required int medNo,
    required String description,
    required String firestore,
    required String localName,
    // @Default(false) bool obtained,
  }) = _Meditation;

  factory Meditation.empty() => const Meditation(
      title: '', medNo: 0, description: '', firestore: '', localName: '');

  factory Meditation.fromJson(Map<String, dynamic> json) =>
      _$MeditationFromJson(json);

  factory Meditation.fromDocument(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();
    return Meditation.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}
