import 'package:json_annotation/json_annotation.dart';

part 'mobile_connect.g.dart';

@JsonSerializable()
class MobileConnectResponse {
  @JsonKey()
  int Id;
  @JsonKey()
  String SupportEmailAddress;
  @JsonKey()
  String File;
  @JsonKey()
  String ApplicationLogo;
  @JsonKey()
  String Logo;
  @JsonKey()
  String MimeType;
  @JsonKey()
  String ApplicationName;
  @JsonKey()
  int ModifiedBy;
  @JsonKey()
  String FacebookURL;
  @JsonKey()
  String TwitterURL;
  @JsonKey()
  String LinkedInURL;
  @JsonKey()
  String BankAccountInfo;

  MobileConnectResponse();

  factory MobileConnectResponse.fromJson(Map<String, dynamic> json) =>
      _$MobileConnectResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MobileConnectResponseToJson(this);
}
