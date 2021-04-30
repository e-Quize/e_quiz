
import 'package:e_quiz/models/common/base_model.dart';
import 'package:e_quiz/models/user/user_entity_copy.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subject_model_params.g.dart';

@JsonSerializable()
class SubjectModelParams extends BaseModel{
  @JsonKey()
  int Id;

  SubjectModelParams();


  factory SubjectModelParams.fromJson(Map<String, dynamic> json) =>
      _$SubjectModelParamsFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectModelParamsToJson(this);
}