import 'package:json_annotation/json_annotation.dart';

part 'common_response.g.dart';

@JsonSerializable()
class CommonResponse {
  @JsonKey()
  int ResponseId;
  @JsonKey()
  String ResponseMessage;

  // @JsonKey()
  // DataTable dt;
  @JsonKey()
  int SubjectId;

  CommonResponse();

  factory CommonResponse.fromJson(Map<String, dynamic> json) =>
      _$CommonResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CommonResponseToJson(this);
}
