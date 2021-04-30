// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) {
  return Student()
    ..checked = json['checked'] as bool??false
    ..UserId = json['UserId'] as int
    ..UserName = json['UserName'] as String
    ..FirstName = json['FirstName'] as String
    ..LastName = json['LastName'] as String
    ..Email = json['Email'] as String
    ..Status = json['Status'] as String
    ..FbUserId = json['FbUserId'] as String;
}

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'checked': instance.checked,
      'UserId': instance.UserId,
      'UserName': instance.UserName,
      'FirstName': instance.FirstName,
      'LastName': instance.LastName,
      'Email': instance.Email,
      'Status': instance.Status,
      'FbUserId': instance.FbUserId,
    };
