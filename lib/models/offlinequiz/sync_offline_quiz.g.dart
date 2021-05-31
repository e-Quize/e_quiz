// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_offline_quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SyncOffliveQuiz _$SyncOffliveQuizFromJson(Map<String, dynamic> json) {
  return SyncOffliveQuiz()
    ..userEntity = json['userEntity'] == null
        ? null
        : UserEntityCopy.fromJson(json['userEntity'] as Map<String, dynamic>)
    ..Records = (json['Records'] as List)
        ?.map((e) => e == null
            ? null
            : SyncOffliveQuizVM.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$SyncOffliveQuizToJson(SyncOffliveQuiz instance) =>
    <String, dynamic>{
      'userEntity': instance.userEntity,
      'Records': instance.Records,
    };
