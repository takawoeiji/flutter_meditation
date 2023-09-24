import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'category_data.freezed.dart';
part 'category_data.g.dart';

@freezed
class CategoryData with _$CategoryData {
  const CategoryData._();
  const factory CategoryData({
    @JsonKey(name: 'category') required String category,
    @JsonKey(name: 'description') required String desctiption,
    // required List<String> medNumbers,
  }) = _CategoryData;

  factory CategoryData.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataFromJson(json);
}
