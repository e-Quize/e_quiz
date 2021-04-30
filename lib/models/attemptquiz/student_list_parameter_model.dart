

import 'package:e_quiz/models/common/base_model.dart';
import 'package:e_quiz/models/user/user_entity_copy.dart';
import 'package:json_annotation/json_annotation.dart';

part 'student_list_parameter_model.g.dart';
@JsonSerializable()
class StudentListParameterModel extends BaseModel{

  StudentListParameterModel();

  String SubjectIdsString;


  factory StudentListParameterModel.fromJson(Map<String, dynamic> json) =>
      _$StudentListParameterModelFromJson(json);

  Map<String, dynamic> toJson() => _$StudentListParameterModelToJson(this);
}