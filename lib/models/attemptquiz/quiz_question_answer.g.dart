// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_question_answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizQuestionAnswer _$QuizQuestionAnswerFromJson(Map<String, dynamic> json) {
  return QuizQuestionAnswer()
    ..userEntity = json['userEntity'] == null
        ? null
        : UserEntityCopy.fromJson(json['userEntity'] as Map<String, dynamic>)
    ..Token = json['Token'] as String
    ..isChecked = json['isChecked'] as bool??false
    ..Id = json['Id'] as int
    ..QuestionId = json['QuestionId'] as int
    ..Statement = json['Statement'] as String
    ..isCorrect = json['isCorrect'] as bool;
}

Map<String, dynamic> _$QuizQuestionAnswerToJson(QuizQuestionAnswer instance) =>
    <String, dynamic>{
      'userEntity': instance.userEntity,
      'Token': instance.Token,
      'isChecked': instance.isChecked,
      'Id': instance.Id,
      'QuestionId': instance.QuestionId,
      'Statement': instance.Statement,
      'isCorrect': instance.isCorrect,
    };
