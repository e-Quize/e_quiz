import 'package:json_annotation/json_annotation.dart';
import 'package:e_quiz/models/user/common_result.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserEntity {
  @JsonKey()
  String Token;
  @JsonKey()
  bool isAuthenticated;
  @JsonKey()
  int Id;
  @JsonKey()
  String StudentIds;
  @JsonKey()
  DateTime TokenGenerationTime;
  @JsonKey()
  DateTime LastRequestTime;
  @JsonKey()
  String FirstName;

  @JsonKey()
  String LastName;

  @JsonKey()
  String Email;
  @JsonKey()
  String UserName;
  @JsonKey()
  String Password;
  @JsonKey()
  int ResponseId;
  @JsonKey()
  String Message;
  @JsonKey()
  int CreatedBy;
  @JsonKey()
  List Privileges;
  @JsonKey()
  bool RememberMe;
  @JsonKey()
  List RoleIds;

  @JsonKey()
  String ContactNumber;
  @JsonKey()
  int Country;
  @JsonKey()
  DateTime CreatedDate;
  @JsonKey()
  int ModifiedBy;
  @JsonKey()
  DateTime ModifiedDate;
  @JsonKey()
  bool isActive;
  @JsonKey()
  bool isDeleted;
  @JsonKey()
  CommonResult ComRes;
  @JsonKey()
  bool isAdmin;
  @JsonKey()
  String PrivilegesString;
  @JsonKey()
  String RoleIdsString;
  @JsonKey()
  String SubjectIdsString;
  @JsonKey()
  List SubjectIds;
  @JsonKey()
  bool isRegister;
  @JsonKey()
  String EncryptedUserId;
  @JsonKey()
  int TimeZoneId;
  @JsonKey()
  String FbUserId;
  @JsonKey()
  int SubscribedMonth;
  @JsonKey()
  DateTime ExpiryDate;
  @JsonKey()
  @JsonKey()
  DateTime SubscribedDate;
  @JsonKey()
  double TotalPayable;
  @JsonKey()
  double Concession;
  @JsonKey()
  double TotalAmount;
  @JsonKey()
  String BankAccountNumber;
  @JsonKey()
  String LoginTimeStamp;
  @JsonKey()
  bool Competition;
  @JsonKey()
  String CountryName;
  @JsonKey()
  String TimeZoneName;
  @JsonKey()
  String DeviceFCMToken;

  UserEntity();

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}
