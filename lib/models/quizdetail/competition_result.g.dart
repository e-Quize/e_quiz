// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'competition_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompetitionResult _$CompetitionResultFromJson(Map<String, dynamic> json) {
  return CompetitionResult()
    ..userEntity = json['userEntity'] == null
        ? null
        : UserEntityCopy.fromJson(json['userEntity'] as Map<String, dynamic>)
    ..Token = json['Token'] as String
    ..UserName = json['UserName'] as String
    ..ObtainedPercentage = (json['ObtainedPercentage'] as num)?.toDouble();
}

Map<String, dynamic> _$CompetitionResultToJson(CompetitionResult instance) =>
    <String, dynamic>{
      'userEntity': instance.userEntity,
      'Token': instance.Token,
      'UserName': instance.UserName,
      'ObtainedPercentage': instance.ObtainedPercentage,
    };
