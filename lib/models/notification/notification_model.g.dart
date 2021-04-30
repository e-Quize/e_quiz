// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) {
  return NotificationModel()
    ..userEntity = json['userEntity'] == null
        ? null
        : UserEntityCopy.fromJson(json['userEntity'] as Map<String, dynamic>)
    ..Token = json['Token'] as String
    ..Id = json['Id'] as int
    ..IsDeleted = json['IsDeleted'] as bool
    ..Type = json['Type'] as String
    ..Notification = json['Notification'] as String
    ..NotificationQuizId = json['NotificationQuizId'] as int
    ..Name = json['Name'] as String
    ..IsRead = json['IsRead'] as bool;
}

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'userEntity': instance.userEntity,
      'Token': instance.Token,
      'Id': instance.Id,
      'IsDeleted': instance.IsDeleted,
      'Type': instance.Type,
      'Notification': instance.Notification,
      'NotificationQuizId': instance.NotificationQuizId,
      'Name': instance.Name,
      'IsRead': instance.IsRead,
    };
