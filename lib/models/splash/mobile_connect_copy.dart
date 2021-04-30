import 'package:json_annotation/json_annotation.dart';

part 'mobile_connect_copy.g.dart';

@JsonSerializable()
class MobileConnectResponseCopy{
  @JsonKey()
  String SupportEmailAddress;
  @JsonKey()
  String ApplicationName;
  @JsonKey()
  String BankAccountInfo;
  @JsonKey()
  String FacebookURL;
  @JsonKey()
  String TwitterURL;
  @JsonKey()
  String LinkedInURL;

  MobileConnectResponseCopy();

  factory MobileConnectResponseCopy.fromJson(Map<String, dynamic> json) =>
      _$MobileConnectResponseCopyFromJson(json);

  Map<String, dynamic> toJson() => _$MobileConnectResponseCopyToJson(this);
}