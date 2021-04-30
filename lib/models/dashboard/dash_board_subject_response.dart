import 'package:json_annotation/json_annotation.dart';


part 'dash_board_subject_response.g.dart';

@JsonSerializable()
class DashBoardSubjectResponse {
  @JsonKey()
  int SubjectId;
  @JsonKey()
  String SubjectName;
  @JsonKey()
  int AttemptedQuestions;
  @JsonKey()
  int USTotalQuestions;
  DashBoardSubjectResponse();

  factory DashBoardSubjectResponse.fromJson(Map<String, dynamic> json) =>
      _$DashBoardSubjectResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DashBoardSubjectResponseToJson(this);
}
