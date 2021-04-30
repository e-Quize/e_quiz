import 'package:e_quiz/models/user/common_result.dart';
import 'package:json_annotation/json_annotation.dart';

part 'countries_vm_model.g.dart';

@JsonSerializable()
class CountryVm {
  @JsonKey()
  int Id;
  @JsonKey()
  String Name;
  @JsonKey()
  int OrderBy;
  @JsonKey()
  bool IsDefault;
  @JsonKey()
  String TwoLetterISORegionName;
  @JsonKey()
  bool IsDeleted;
  @JsonKey()
  int CreatedBy;
  @JsonKey()
  int ModifiedBy;
  @JsonKey()
  DateTime CreatedDate;
  @JsonKey()
  DateTime ModifiedDate;
  @JsonKey()
  CommonResult ComRes;

  CountryVm();

  factory CountryVm.fromJson(Map<String, dynamic> json) =>
      _$CountryVmFromJson(json);

  Map<String, dynamic> toJson() => _$CountryVmToJson(this);
}
