import 'package:e_quiz/models/common/base_model.dart';
import 'package:e_quiz/models/user/user_entity_copy.dart';
import 'package:json_annotation/json_annotation.dart';

part 'attempt_quiz_vm.g.dart';

@JsonSerializable()
class AttemptQuizVm extends BaseModel {
  @JsonKey()
  int QuizId;
  @JsonKey()
  int QuestionId;
  @JsonKey()
  int AnswerId;
  @JsonKey()
  int AttemptedQuizDetailId;
  @JsonKey()
  bool FlaggedAsDifficult;
  @JsonKey()
  bool FlaggedAsSkipped;
  @JsonKey()
  bool HasSeenExplanation;
  @JsonKey()
  bool ReAttempt;
  @JsonKey()
  String Date;

  AttemptQuizVm() {}

  factory AttemptQuizVm.fromJson(Map<String, dynamic> json) =>
      _$AttemptQuizVmFromJson(json);

  Map<String, dynamic> toJson() => _$AttemptQuizVmToJson(this);
}
