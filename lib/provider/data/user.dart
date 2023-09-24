import 'package:freezed_annotation/freezed_annotation.dart';

import '../user_status.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const User._();
  const factory User({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'status') required UserStatus status,
    @JsonKey(name: 'createdAt') required DateTime createdAt,
    @JsonKey(name: 'postCount') required int postCount,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
