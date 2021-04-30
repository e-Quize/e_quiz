import 'package:json_annotation/json_annotation.dart';
import 'package:e_quiz/models/user/common_result.dart';

part 'user_entity_copy.g.dart';

@JsonSerializable()
class UserEntityCopy {
  @JsonKey()
  String Token;
  @JsonKey()
  String PrivilegesString;
  @JsonKey()
  String UserName;
  @JsonKey()
  String Password;
  @JsonKey()
  String FbUserId;
  @JsonKey()
  String DeviceFCMToken;
  @JsonKey()
  String SubjectIdsString;

  @JsonKey()
  CommonResult ComRes;

  UserEntityCopy();

  factory UserEntityCopy.fromJson(Map<String, dynamic> json) =>
      _$UserEntityCopyFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityCopyToJson(this);
}
