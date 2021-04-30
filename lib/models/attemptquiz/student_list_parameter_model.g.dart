// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_list_parameter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentListParameterModel _$StudentListParameterModelFromJson(
    Map<String, dynamic> json) {
  return StudentListParameterModel()
    ..userEntity = json['userEntity'] == null
        ? null
        : UserEntityCopy.fromJson(json['userEntity'] as Map<String, dynamic>)
    ..Token = json['Token'] as String
    ..SubjectIdsString = json['SubjectIdsString'] as String;
}

Map<String, dynamic> _$StudentListParameterModelToJson(
        StudentListParameterModel instance) =>
    <String, dynamic>{
      'userEntity': instance.userEntity,
      'Token': instance.Token,
      'SubjectIdsString': instance.SubjectIdsString,
    };
