import 'package:e_quiz/models/user/common_result.dart';
import 'package:json_annotation/json_annotation.dart';

part 'timezone.g.dart';

@JsonSerializable()
class TimeZone {
  @JsonKey()
  int CountryID;
  @JsonKey()
  int TimeZoneID;
  @JsonKey()
  String TimeZoneIDs;
  @JsonKey()
  String DisplayName;
  @JsonKey()
  bool IsDeleted;
  @JsonKey()
  int CreatedBy;
  @JsonKey()
  DateTime CreatedDate;
  @JsonKey()
  int ModifiedBy;
  @JsonKey()
  DateTime ModifiedDate;
  @JsonKey()
  CommonResult commonResult;

  TimeZone();

  factory TimeZone.fromJson(Map<String, dynamic> json) =>
      _$TimeZoneFromJson(json);

  Map<String, dynamic> toJson() => _$TimeZoneToJson(this);
}
