import 'package:json_annotation/json_annotation.dart';

part 'refresh_token.g.dart';

@JsonSerializable()
class RefreshToken {
  RefreshToken();

  String RefreshOldToken;

  factory RefreshToken.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTokenToJson(this);
}
