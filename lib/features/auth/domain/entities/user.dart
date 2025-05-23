import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_role.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    String? email,
    String? name,
    String? photoUrl,
    @Default(UserRole.surfer) UserRole role,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
} 