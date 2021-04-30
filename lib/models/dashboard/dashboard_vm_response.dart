import 'package:json_annotation/json_annotation.dart';
import 'package:e_quiz/models/dashboard/dash_board_subject_response.dart';

part 'dashboard_vm_response.g.dart';

@JsonSerializable()
class DashboardVMResponse {
  @JsonKey()
  int StudentId;
  @JsonKey()
  int AttemptedQuiz;
  @JsonKey()
  int PassedQuiz;
  @JsonKey()
  int FailedQuiz;
  @JsonKey()
  int STotalQuestions;
  @JsonKey()
  int CorrectQuestions;
  @JsonKey()
  int IncorrectQuestions;
  @JsonKey()
  double CorrectPercentage;
  @JsonKey()
  double IncorrectPercentage;
  @JsonKey()
  List DashBaordSkippedQuestoins;
  @JsonKey()
  int DifficultQuestionsCount;
  @JsonKey()
  List<DashBoardSubjectResponse> DashBaordSubjects;
  @JsonKey()
  List dtQuizzes;
  @JsonKey()
  int SkippedQuestionsCount;

  DashboardVMResponse();

  factory DashboardVMResponse.fromJson(Map<String, dynamic> json) =>
      _$DashboardVMResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardVMResponseToJson(this);
}
