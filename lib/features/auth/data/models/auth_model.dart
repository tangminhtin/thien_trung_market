import 'package:json_annotation/json_annotation.dart';
import 'package:thien_trung_market/features/auth/domain/entities/auth.dart';

part 'auth_model.g.dart';

@JsonSerializable()
class AuthModel extends Auth {
  const AuthModel({
    required String userId,
    required String email,
    required String password,
    required String token,
  }) : super(
          userId: userId,
          email: email,
          password: password,
          token: token,
        );
  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthModelToJson(this);
}
