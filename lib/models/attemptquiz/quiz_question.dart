import 'package:e_quiz/models/common/base_model.dart';
import 'package:e_quiz/models/attemptquiz/quiz_question_answer.dart';
import 'package:e_quiz/models/user/user_entity_copy.dart';
import 'package:e_quiz/utils/widgetproperties.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quiz_question.g.dart';

@JsonSerializable()
class QuizQuestion extends BaseModel {

  @JsonKey()
  int Serial;

  bool isUserAnswer;
  bool isAttempted;
  @JsonKey()

  int QuizId;

  @JsonKey()
  String StartTime;

  @JsonKey()
  int TotalQuestion;
  @JsonKey()
  double TotalMarks;

  @JsonKey()
  double PassingPercentage;

  @JsonKey()
  double EachQuestionMarks;

  @JsonKey()
  int EachQuestionTimeLimit;

  @JsonKey()
  int TotalTime;

  @JsonKey()
  bool isDemo;

  @JsonKey()
  bool CheckAnswersSimultaneously;

  @JsonKey()
  int QuestionId;

  @JsonKey()
  String Statement;

  @JsonKey()
  String Explanation;

  @JsonKey()
  bool FlaggedAsDifficult;

  @JsonKey()
  bool FlaggedAsSkipped;

  @JsonKey()
  bool HasSeenExplanation;

  @JsonKey()
  bool isCorrect;

  @JsonKey()
  int SelectedAnswerId;

  @JsonKey()
  int ActualAnswerId;

  @JsonKey()
  int AttemptedQuizId;

  @JsonKey()
  int AttemptedQuizDetailId;

  @JsonKey()
  List<QuizQuestionAnswer> QuestionAnswerList;

  QuizQuestion() {}

  factory QuizQuestion.fromJson(Map<String, dynamic> json) =>
      _$QuizQuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuizQuestionToJson(this);
}
