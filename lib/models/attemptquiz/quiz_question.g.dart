// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizQuestion _$QuizQuestionFromJson(Map<String, dynamic> json) {
  return QuizQuestion()
    ..userEntity = json['userEntity'] == null
        ? null
        : UserEntityCopy.fromJson(json['userEntity'] as Map<String, dynamic>)
    ..Token = json['Token'] as String
    ..Serial = json['Serial'] as int
    ..isUserAnswer = json['isUserAnswer'] as bool??false
    ..isAttempted = json['isAttempted'] as bool ?? false
    ..QuizId = json['QuizId'] as int
    ..StartTime = json['StartTime'] as String
    ..TotalQuestion = json['TotalQuestion'] as int
    ..TotalMarks = (json['TotalMarks'] as num)?.toDouble()
    ..PassingPercentage = (json['PassingPercentage'] as num)?.toDouble()
    ..EachQuestionMarks = (json['EachQuestionMarks'] as num)?.toDouble()
    ..EachQuestionTimeLimit = json['EachQuestionTimeLimit'] as int
    ..TotalTime = json['TotalTime'] as int
    ..isDemo = json['isDemo'] as bool
    ..CheckAnswersSimultaneously = json['CheckAnswersSimultaneously'] as bool
    ..QuestionId = json['QuestionId'] as int
    ..Statement = json['Statement'] as String
    ..Explanation = json['Explanation'] as String
    ..FlaggedAsDifficult = json['FlaggedAsDifficult'] as bool
    ..FlaggedAsSkipped = json['FlaggedAsSkipped'] as bool
    ..HasSeenExplanation = json['HasSeenExplanation'] as bool
    ..isCorrect = json['isCorrect'] as bool ?? false
    ..SelectedAnswerId = json['SelectedAnswerId'] as int
    ..ActualAnswerId = json['ActualAnswerId'] as int
    ..AttemptedQuizId = json['AttemptedQuizId'] as int
    ..AttemptedQuizDetailId = json['AttemptedQuizDetailId'] as int
    ..QuestionAnswerList = (json['QuestionAnswerList'] as List)
        ?.map((e) => e == null
            ? null
            : QuizQuestionAnswer.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$QuizQuestionToJson(QuizQuestion instance) =>
    <String, dynamic>{
      'userEntity': instance.userEntity,
      'Token': instance.Token,
      'Serial': instance.Serial,
      'isUserAnswer': instance.isUserAnswer,
      'isAttempted': instance.isAttempted,
      'QuizId': instance.QuizId,
      'StartTime': instance.StartTime,
      'TotalQuestion': instance.TotalQuestion,
      'TotalMarks': instance.TotalMarks,
      'PassingPercentage': instance.PassingPercentage,
      'EachQuestionMarks': instance.EachQuestionMarks,
      'EachQuestionTimeLimit': instance.EachQuestionTimeLimit,
      'TotalTime': instance.TotalTime,
      'isDemo': instance.isDemo,
      'CheckAnswersSimultaneously': instance.CheckAnswersSimultaneously,
      'QuestionId': instance.QuestionId,
      'Statement': instance.Statement,
      'Explanation': instance.Explanation,
      'FlaggedAsDifficult': instance.FlaggedAsDifficult,
      'FlaggedAsSkipped': instance.FlaggedAsSkipped,
      'HasSeenExplanation': instance.HasSeenExplanation,
      'isCorrect': instance.isCorrect,
      'SelectedAnswerId': instance.SelectedAnswerId,
      'ActualAnswerId': instance.ActualAnswerId,
      'AttemptedQuizId': instance.AttemptedQuizId,
      'AttemptedQuizDetailId': instance.AttemptedQuizDetailId,
      'QuestionAnswerList': instance.QuestionAnswerList,
    };
