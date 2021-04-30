import 'package:e_quiz/models/user/user_entity_copy.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_model.g.dart';

@JsonSerializable()
class BaseModel{
  UserEntityCopy userEntity;

  String Token;


  BaseModel();


  factory BaseModel.fromJson(Map<String, dynamic> json) =>
      _$BaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseModelToJson(this);
}