
import 'package:e_quiz/models/common/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quiz_detail.g.dart';

@JsonSerializable()

class QuizDetail{
  @JsonKey()
  String UserName;
  @JsonKey()
  double ObtainedPercentage;
  QuizDetail();

  factory QuizDetail.fromJson(Map<String, dynamic> json) =>
      _$QuizDetailFromJson(json);

  Map<String, dynamic> toJson() => _$QuizDetailToJson(this);
}