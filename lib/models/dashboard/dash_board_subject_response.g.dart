// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dash_board_subject_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashBoardSubjectResponse _$DashBoardSubjectResponseFromJson(
    Map<String, dynamic> json) {
  return DashBoardSubjectResponse()
    ..SubjectId = json['SubjectId'] as int
    ..SubjectName = json['SubjectName'] as String
    ..AttemptedQuestions = json['AttemptedQuestions'] as int
    ..USTotalQuestions = json['USTotalQuestions'] as int;
}

Map<String, dynamic> _$DashBoardSubjectResponseToJson(
        DashBoardSubjectResponse instance) =>
    <String, dynamic>{
      'SubjectId': instance.SubjectId,
      'SubjectName': instance.SubjectName,
      'AttemptedQuestions': instance.AttemptedQuestions,
      'USTotalQuestions': instance.USTotalQuestions,
    };
