// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attempted_quiz_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttemptedQuizModel _$AttemptedQuizModelFromJson(Map<String, dynamic> json) {
  return AttemptedQuizModel()
    ..userEntity = json['userEntity'] == null
        ? null
        : UserEntityCopy.fromJson(json['userEntity'] as Map<String, dynamic>)
    ..Token = json['Token'] as String
    ..QuizId = json['QuizId'] as int
    ..Subejcts = json['Subejcts'] as String
    ..isCompetition = json['isCompetition'] as bool
    ..AttemptedDate = json['AttemptedDate'] as String
    ..ObtainedPercentage = (json['ObtainedPercentage'] as num)?.toDouble();
}

Map<String, dynamic> _$AttemptedQuizModelToJson(AttemptedQuizModel instance) =>
    <String, dynamic>{
      'userEntity': instance.userEntity,
      'Token': instance.Token,
      'QuizId': instance.QuizId,
      'Subejcts': instance.Subejcts,
      'isCompetition': instance.isCompetition,
      'AttemptedDate': instance.AttemptedDate,
      'ObtainedPercentage': instance.ObtainedPercentage,
    };
