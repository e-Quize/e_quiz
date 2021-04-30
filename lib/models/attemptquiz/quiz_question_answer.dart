import 'package:e_quiz/models/common/base_model.dart';
import 'package:e_quiz/models/user/user_entity_copy.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quiz_question_answer.g.dart';

@JsonSerializable()
class QuizQuestionAnswer extends BaseModel {
  bool isChecked;
  @JsonKey()
  int Id;
  @JsonKey()
  int QuestionId;
  @JsonKey()
  String Statement;
  @JsonKey()
  bool isCorrect;

  QuizQuestionAnswer();

  factory QuizQuestionAnswer.fromJson(Map<String, dynamic> json) =>
      _$QuizQuestionAnswerFromJson(json);

  Map<String, dynamic> toJson() => _$QuizQuestionAnswerToJson(this);
}
