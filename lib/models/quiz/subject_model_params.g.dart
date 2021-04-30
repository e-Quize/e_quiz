// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_model_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectModelParams _$SubjectModelParamsFromJson(Map<String, dynamic> json) {
  return SubjectModelParams()
    ..userEntity = json['userEntity'] == null
        ? null
        : UserEntityCopy.fromJson(json['userEntity'] as Map<String, dynamic>)
    ..Token = json['Token'] as String
    ..Id = json['Id'] as int;
}

Map<String, dynamic> _$SubjectModelParamsToJson(SubjectModelParams instance) =>
    <String, dynamic>{
      'userEntity': instance.userEntity,
      'Token': instance.Token,
      'Id': instance.Id,
    };
