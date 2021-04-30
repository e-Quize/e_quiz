// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_generation_vm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizGenerationVM _$QuizGenerationVMFromJson(Map<String, dynamic> json) {
  return QuizGenerationVM()
    ..userEntity = json['userEntity'] == null
        ? null
        : UserEntityCopy.fromJson(json['userEntity'] as Map<String, dynamic>)
    ..Token = json['Token'] as String
    ..checked = json['checked'] as bool??false
    ..index = json['index'] as int
    ..Id = json['Id'] as int
    ..SubjectIds = json['SubjectIds'] as String
    ..ChapterIds = json['ChapterIds'] as String
    ..StartTime = json['StartTime'] as String
    ..QuizIds = json['QuizIds'] as String
    ..isCompetition = json['isCompetition'] as bool
    ..ChoosenNumberofQuestions = json['ChoosenNumberofQuestions'] as int
    ..SeeAnsSimaltaneously = json['SeeAnsSimaltaneously'] as bool
    ..GenerateFromDifficult = json['GenerateFromDifficult'] as bool
    ..TopicIds = json['TopicIds'] as String
    ..Invitees = json['Invitees'] as String
    ..GenerateFromWrong = json['GenerateFromWrong'] as bool
    ..GenerateFromSkipped = json['GenerateFromSkipped'] as bool;
}

Map<String, dynamic> _$QuizGenerationVMToJson(QuizGenerationVM instance) =>
    <String, dynamic>{
      'userEntity': instance.userEntity,
      'Token': instance.Token,
      'checked': instance.checked,
      'index': instance.index,
      'Id': instance.Id,
      'SubjectIds': instance.SubjectIds,
      'ChapterIds': instance.ChapterIds,
      'StartTime': instance.StartTime,
      'QuizIds': instance.QuizIds,
      'isCompetition': instance.isCompetition,
      'ChoosenNumberofQuestions': instance.ChoosenNumberofQuestions,
      'SeeAnsSimaltaneously': instance.SeeAnsSimaltaneously,
      'GenerateFromDifficult': instance.GenerateFromDifficult,
      'TopicIds': instance.TopicIds,
      'Invitees': instance.Invitees,
      'GenerateFromWrong': instance.GenerateFromWrong,
      'GenerateFromSkipped': instance.GenerateFromSkipped,
    };
