// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity_copy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntityCopy _$UserEntityCopyFromJson(Map<String, dynamic> json) {
  return UserEntityCopy()
    ..Token = json['Token'] as String
    ..PrivilegesString = json['PrivilegesString'] as String
    ..UserName = json['UserName'] as String
    ..Password = json['Password'] as String
    ..FbUserId = json['FbUserId'] as String
    ..DeviceFCMToken = json['DeviceFCMToken'] as String
    ..SubjectIdsString = json['SubjectIdsString'] as String
    ..ComRes = json['ComRes'] == null
        ? null
        : CommonResult.fromJson(json['ComRes'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UserEntityCopyToJson(UserEntityCopy instance) =>
    <String, dynamic>{
      'Token': instance.Token,
      'PrivilegesString': instance.PrivilegesString,
      'UserName': instance.UserName,
      'Password': instance.Password,
      'FbUserId': instance.FbUserId,
      'DeviceFCMToken': instance.DeviceFCMToken,
      'SubjectIdsString': instance.SubjectIdsString,
      'ComRes': instance.ComRes,
    };
