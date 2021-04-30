// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_vm_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardVMResponse _$DashboardVMResponseFromJson(Map<String, dynamic> json) {
  return DashboardVMResponse()
    ..StudentId = json['StudentId'] as int
    ..AttemptedQuiz = json['AttemptedQuiz'] as int
    ..PassedQuiz = json['PassedQuiz'] as int
    ..FailedQuiz = json['FailedQuiz'] as int
    ..STotalQuestions = json['STotalQuestions'] as int
    ..CorrectQuestions = json['CorrectQuestions'] as int
    ..IncorrectQuestions = json['IncorrectQuestions'] as int
    ..CorrectPercentage = (json['CorrectPercentage'] as num)?.toDouble()
    ..IncorrectPercentage = (json['IncorrectPercentage'] as num)?.toDouble()
    ..DashBaordSkippedQuestoins = json['DashBaordSkippedQuestoins'] as List
    ..DifficultQuestionsCount = json['DifficultQuestionsCount'] as int
    ..DashBaordSubjects = (json['DashBaordSubjects'] as List)
        ?.map((e) => e == null
            ? null
            : DashBoardSubjectResponse.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..dtQuizzes = json['dtQuizzes'] as List
    ..SkippedQuestionsCount = json['SkippedQuestionsCount'] as int;
}

Map<String, dynamic> _$DashboardVMResponseToJson(
        DashboardVMResponse instance) =>
    <String, dynamic>{
      'StudentId': instance.StudentId,
      'AttemptedQuiz': instance.AttemptedQuiz,
      'PassedQuiz': instance.PassedQuiz,
      'FailedQuiz': instance.FailedQuiz,
      'STotalQuestions': instance.STotalQuestions,
      'CorrectQuestions': instance.CorrectQuestions,
      'IncorrectQuestions': instance.IncorrectQuestions,
      'CorrectPercentage': instance.CorrectPercentage,
      'IncorrectPercentage': instance.IncorrectPercentage,
      'DashBaordSkippedQuestoins': instance.DashBaordSkippedQuestoins,
      'DifficultQuestionsCount': instance.DifficultQuestionsCount,
      'DashBaordSubjects': instance.DashBaordSubjects,
      'dtQuizzes': instance.dtQuizzes,
      'SkippedQuestionsCount': instance.SkippedQuestionsCount,
    };
