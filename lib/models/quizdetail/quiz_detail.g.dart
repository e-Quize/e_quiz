// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizDetail _$QuizDetailFromJson(Map<String, dynamic> json) {
  return QuizDetail()
    ..UserName = json['UserName'] as String
    ..ObtainedPercentage = (json['ObtainedPercentage'] as num)?.toDouble();
}

Map<String, dynamic> _$QuizDetailToJson(QuizDetail instance) =>
    <String, dynamic>{
      'UserName': instance.UserName,
      'ObtainedPercentage': instance.ObtainedPercentage,
    };
