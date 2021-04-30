// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'competition_quiz_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompetitionQuizResultModel _$CompetitionQuizResultModelFromJson(
    Map<String, dynamic> json) {
  return CompetitionQuizResultModel()
    ..userEntity = json['userEntity'] == null
        ? null
        : UserEntityCopy.fromJson(json['userEntity'] as Map<String, dynamic>)
    ..Token = json['Token'] as String
    ..StudentId = json['StudentId'] as int
    ..QuizId = json['QuizId'] as int;
}

Map<String, dynamic> _$CompetitionQuizResultModelToJson(
        CompetitionQuizResultModel instance) =>
    <String, dynamic>{
      'userEntity': instance.userEntity,
      'Token': instance.Token,
      'StudentId': instance.StudentId,
      'QuizId': instance.QuizId,
    };
