import 'package:e_quiz/models/common/base_model.dart';
import 'package:e_quiz/models/user/user_entity_copy.dart';
import 'package:json_annotation/json_annotation.dart';

part 'attempted_quiz_model.g.dart';

@JsonSerializable()
class AttemptedQuizModel extends BaseModel {
  @JsonKey()
  int QuizId;
  @JsonKey()
  String Subejcts;
  @JsonKey()
  bool isCompetition;
  @JsonKey()
  String AttemptedDate;
  @JsonKey()
  double ObtainedPercentage;

  AttemptedQuizModel();

  factory AttemptedQuizModel.fromJson(Map<String, dynamic> json) =>
      _$AttemptedQuizModelFromJson(json);

  Map<String, dynamic> toJson() => _$AttemptedQuizModelToJson(this);
}
