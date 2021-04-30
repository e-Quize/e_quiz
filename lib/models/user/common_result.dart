import 'package:json_annotation/json_annotation.dart';
part 'common_result.g.dart';


@JsonSerializable()
class CommonResult {

  @JsonKey()
  int ResponseId;
  @JsonKey()
  String ResponseMessage;

  CommonResult();

  factory CommonResult.fromJson(Map<String, dynamic> json) =>
      _$CommonResultFromJson(json);

  Map<String, dynamic> toJson() => _$CommonResultToJson(this);
}
