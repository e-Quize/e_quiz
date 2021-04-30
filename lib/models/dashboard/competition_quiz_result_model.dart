
import 'package:e_quiz/models/common/base_model.dart';
import 'package:e_quiz/models/user/user_entity_copy.dart';
import 'package:json_annotation/json_annotation.dart';
part 'competition_quiz_result_model.g.dart';


@JsonSerializable()
class CompetitionQuizResultModel extends BaseModel {

  @JsonKey()
  int StudentId;
  @JsonKey()
  int QuizId;

  CompetitionQuizResultModel();

  factory CompetitionQuizResultModel.fromJson(Map<String, dynamic> json) =>
      _$CompetitionQuizResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompetitionQuizResultModelToJson(this);
}
