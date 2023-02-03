import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';
// https://www.launchclub.io/blog/build-flutter-apps-fast

@freezed
abstract class Category implements _$Category {
  const Category._();

  const factory Category({
    String? id,
    required String title,
    required String description,
    required List<String> medNumbers,
    // @Default(false) bool obtained,
  }) = _Category;

  factory Category.empty() =>
      Category(title: '', description: '', medNumbers: ['']);

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  factory Category.fromDocument(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();
    return Category.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}
