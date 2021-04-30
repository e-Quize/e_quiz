// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseModel _$BaseModelFromJson(Map<String, dynamic> json) {
  return BaseModel()
    ..userEntity = json['userEntity'] == null
        ? null
        : UserEntityCopy.fromJson(json['userEntity'] as Map<String, dynamic>)
    ..Token = json['Token'] as String;
}

Map<String, dynamic> _$BaseModelToJson(BaseModel instance) => <String, dynamic>{
      'userEntity': instance.userEntity,
      'Token': instance.Token,
    };
