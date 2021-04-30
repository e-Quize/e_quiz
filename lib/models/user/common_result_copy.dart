import 'package:json_annotation/json_annotation.dart';

part 'common_result_copy.g.dart';

@JsonSerializable()
class CommonResultCopy {
  @JsonKey()
  int ResponseId;

  CommonResultCopy();

  factory CommonResultCopy.fromJson(Map<String, dynamic> json) =>
      _$CommonResultCopyFromJson(json);

  Map<String, dynamic> toJson() => _$CommonResultCopyToJson(this);
}
