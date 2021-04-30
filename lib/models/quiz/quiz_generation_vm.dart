import 'package:e_quiz/models/common/base_model.dart';
import 'package:e_quiz/models/user/user_entity_copy.dart';
import 'package:e_quiz/utils/widgetproperties.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:intl/intl.dart';

part 'quiz_generation_vm.g.dart';

@JsonSerializable()
class QuizGenerationVM extends BaseModel {
  bool checked;
  int index;

  @JsonKey()
  int Id;

  @JsonKey()
  String SubjectIds;

  @JsonKey()
  String ChapterIds;

  @JsonKey()
  String StartTime;

  @JsonKey()
  String QuizIds;

  @JsonKey()
  bool isCompetition;

  @JsonKey()
  int ChoosenNumberofQuestions;
  @JsonKey()
  bool SeeAnsSimaltaneously;
  @JsonKey()
  bool GenerateFromDifficult;
  @JsonKey()
  String TopicIds;
  @JsonKey()
  String Invitees;
  @JsonKey()
  bool GenerateFromWrong;
  @JsonKey()
  bool GenerateFromSkipped;


  @JsonKey()
  QuizGenerationVM() {
    userEntity = new UserEntityCopy();
    StartTime = WidgetProperties.utcTimeToString();
  }

  factory QuizGenerationVM.fromJson(Map<String, dynamic> json) =>
      _$QuizGenerationVMFromJson(json);

  Map<String, dynamic> toJson() => _$QuizGenerationVMToJson(this);
}
