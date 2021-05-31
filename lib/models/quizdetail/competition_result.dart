import 'package:json_annotation/json_annotation.dart';

import '../common/base_model.dart';
import '../user/user_entity_copy.dart';

part 'competition_result.g.dart';

@JsonSerializable()
class CompetitionResult extends BaseModel {
  @JsonKey()
  String UserName;
  @JsonKey()
  double ObtainedPercentage;
  @JsonKey()
  double ObtainedMarks;

  CompetitionResult();

  factory CompetitionResult.fromJson(Map<String, dynamic> json) =>
      _$CompetitionResultFromJson(json);

  Map<String, dynamic> toJson() => _$CompetitionResultToJson(this);
}
