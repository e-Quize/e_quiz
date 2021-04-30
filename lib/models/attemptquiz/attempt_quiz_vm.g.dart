// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attempt_quiz_vm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttemptQuizVm _$AttemptQuizVmFromJson(Map<String, dynamic> json) {
  return AttemptQuizVm()
    ..userEntity = json['userEntity'] == null
        ? null
        : UserEntityCopy.fromJson(json['userEntity'] as Map<String, dynamic>)
    ..Token = json['Token'] as String
    ..QuizId = json['QuizId'] as int
    ..QuestionId = json['QuestionId'] as int
    ..AnswerId = json['AnswerId'] as int
    ..AttemptedQuizDetailId = json['AttemptedQuizDetailId'] as int
    ..FlaggedAsDifficult = json['FlaggedAsDifficult'] as bool
    ..FlaggedAsSkipped = json['FlaggedAsSkipped'] as bool
    ..HasSeenExplanation = json['HasSeenExplanation'] as bool
    ..ReAttempt = json['ReAttempt'] as bool
    ..Date = json['Date'] as String;
}

Map<String, dynamic> _$AttemptQuizVmToJson(AttemptQuizVm instance) =>
    <String, dynamic>{
      'userEntity': instance.userEntity,
      'Token': instance.Token,
      'QuizId': instance.QuizId,
      'QuestionId': instance.QuestionId,
      'AnswerId': instance.AnswerId,
      'AttemptedQuizDetailId': instance.AttemptedQuizDetailId,
      'FlaggedAsDifficult': instance.FlaggedAsDifficult,
      'FlaggedAsSkipped': instance.FlaggedAsSkipped,
      'HasSeenExplanation': instance.HasSeenExplanation,
      'ReAttempt': instance.ReAttempt,
      'Date': instance.Date,
    };
