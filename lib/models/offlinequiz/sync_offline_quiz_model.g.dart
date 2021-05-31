// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_offline_quiz_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SyncOffliveQuizVM _$SyncOffliveQuizVMFromJson(Map<String, dynamic> json) {
  return SyncOffliveQuizVM()
    ..Questions = (json['Questions'] as List)
        ?.map((e) =>
            e == null ? null : QuizQuestion.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$SyncOffliveQuizVMToJson(SyncOffliveQuizVM instance) =>
    <String, dynamic>{
      'Questions': instance.Questions,
    };
