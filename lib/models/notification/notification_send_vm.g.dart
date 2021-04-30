// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_send_vm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationVM _$NotificationVMFromJson(Map<String, dynamic> json) {
  return NotificationVM()
    ..userEntity = json['userEntity'] == null
        ? null
        : UserEntityCopy.fromJson(json['userEntity'] as Map<String, dynamic>)
    ..Token = json['Token'] as String
    ..NotificationTypeId = json['NotificationTypeId'] as int
    ..IsDeleted = json['IsDeleted'] as bool
    ..StudentIds = json['StudentIds'] as String
    ..NotificationDesc = json['NotificationDesc'] as String
    ..NotificationQuizId = json['NotificationQuizId'] as int
    ..Name = json['Name'] as String
    ..IsRead = json['IsRead'] as bool;
}

Map<String, dynamic> _$NotificationVMToJson(NotificationVM instance) =>
    <String, dynamic>{
      'userEntity': instance.userEntity,
      'Token': instance.Token,
      'NotificationTypeId': instance.NotificationTypeId,
      'IsDeleted': instance.IsDeleted,
      'StudentIds': instance.StudentIds,
      'NotificationDesc': instance.NotificationDesc,
      'NotificationQuizId': instance.NotificationQuizId,
      'Name': instance.Name,
      'IsRead': instance.IsRead,
    };
