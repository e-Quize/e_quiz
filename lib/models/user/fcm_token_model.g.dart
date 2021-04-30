// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fcm_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FcmTokenModel _$FcmTokenModelFromJson(Map<String, dynamic> json) {
  return FcmTokenModel()
    ..FCMQuizId = json['FCMQuizId'] as int
    ..Notificationtype = json['Notificationtype'] as int;
}

Map<String, dynamic> _$FcmTokenModelToJson(FcmTokenModel instance) =>
    <String, dynamic>{
      'FCMQuizId': instance.FCMQuizId,
      'Notificationtype': instance.Notificationtype,
    };
