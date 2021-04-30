// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) {
  return UserEntity()
    ..Token = json['Token'] as String
    ..isAuthenticated = json['isAuthenticated'] as bool
    ..Id = json['Id'] as int
    ..StudentIds = json['StudentIds'] as String
    ..TokenGenerationTime = json['TokenGenerationTime'] == null
        ? null
        : DateTime.parse(json['TokenGenerationTime'] as String)
    ..LastRequestTime = json['LastRequestTime'] == null
        ? null
        : DateTime.parse(json['LastRequestTime'] as String)
    ..FirstName = json['FirstName'] as String
    ..LastName = json['LastName'] as String
    ..Email = json['Email'] as String
    ..UserName = json['UserName'] as String
    ..Password = json['Password'] as String
    ..ResponseId = json['ResponseId'] as int
    ..Message = json['Message'] as String
    ..CreatedBy = json['CreatedBy'] as int
    ..Privileges = json['Privileges'] as List
    ..RememberMe = json['RememberMe'] as bool
    ..RoleIds = json['RoleIds'] as List
    ..ContactNumber = json['ContactNumber'] as String
    ..Country = json['Country'] as int
    ..CreatedDate = json['CreatedDate'] == null
        ? null
        : DateTime.parse(json['CreatedDate'] as String)
    ..ModifiedBy = json['ModifiedBy'] as int
    ..ModifiedDate = json['ModifiedDate'] == null
        ? null
        : DateTime.parse(json['ModifiedDate'] as String)
    ..isActive = json['isActive'] as bool
    ..isDeleted = json['isDeleted'] as bool
    ..ComRes = json['ComRes'] == null
        ? null
        : CommonResult.fromJson(json['ComRes'] as Map<String, dynamic>)
    ..isAdmin = json['isAdmin'] as bool
    ..PrivilegesString = json['PrivilegesString'] as String
    ..RoleIdsString = json['RoleIdsString'] as String
    ..SubjectIdsString = json['SubjectIdsString'] as String
    ..SubjectIds = json['SubjectIds'] as List
    ..isRegister = json['isRegister'] as bool
    ..EncryptedUserId = json['EncryptedUserId'] as String
    ..TimeZoneId = json['TimeZoneId'] as int
    ..FbUserId = json['FbUserId'] as String
    ..SubscribedMonth = json['SubscribedMonth'] as int
    ..ExpiryDate = json['ExpiryDate'] == null
        ? null
        : DateTime.parse(json['ExpiryDate'] as String)
    ..SubscribedDate = json['SubscribedDate'] == null
        ? null
        : DateTime.parse(json['SubscribedDate'] as String)
    ..TotalPayable = (json['TotalPayable'] as num)?.toDouble()
    ..Concession = (json['Concession'] as num)?.toDouble()
    ..TotalAmount = (json['TotalAmount'] as num)?.toDouble()
    ..BankAccountNumber = json['BankAccountNumber'] as String
    ..LoginTimeStamp = json['LoginTimeStamp'] as String
    ..Competition = json['Competition'] as bool
    ..CountryName = json['CountryName'] as String
    ..TimeZoneName = json['TimeZoneName'] as String
    ..DeviceFCMToken = json['DeviceFCMToken'] as String;
}

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'Token': instance.Token,
      'isAuthenticated': instance.isAuthenticated,
      'Id': instance.Id,
      'StudentIds': instance.StudentIds,
      'TokenGenerationTime': instance.TokenGenerationTime?.toIso8601String(),
      'LastRequestTime': instance.LastRequestTime?.toIso8601String(),
      'FirstName': instance.FirstName,
      'LastName': instance.LastName,
      'Email': instance.Email,
      'UserName': instance.UserName,
      'Password': instance.Password,
      'ResponseId': instance.ResponseId,
      'Message': instance.Message,
      'CreatedBy': instance.CreatedBy,
      'Privileges': instance.Privileges,
      'RememberMe': instance.RememberMe,
      'RoleIds': instance.RoleIds,
      'ContactNumber': instance.ContactNumber,
      'Country': instance.Country,
      'CreatedDate': instance.CreatedDate?.toIso8601String(),
      'ModifiedBy': instance.ModifiedBy,
      'ModifiedDate': instance.ModifiedDate?.toIso8601String(),
      'isActive': instance.isActive,
      'isDeleted': instance.isDeleted,
      'ComRes': instance.ComRes,
      'isAdmin': instance.isAdmin,
      'PrivilegesString': instance.PrivilegesString,
      'RoleIdsString': instance.RoleIdsString,
      'SubjectIdsString': instance.SubjectIdsString,
      'SubjectIds': instance.SubjectIds,
      'isRegister': instance.isRegister,
      'EncryptedUserId': instance.EncryptedUserId,
      'TimeZoneId': instance.TimeZoneId,
      'FbUserId': instance.FbUserId,
      'SubscribedMonth': instance.SubscribedMonth,
      'ExpiryDate': instance.ExpiryDate?.toIso8601String(),
      'SubscribedDate': instance.SubscribedDate?.toIso8601String(),
      'TotalPayable': instance.TotalPayable,
      'Concession': instance.Concession,
      'TotalAmount': instance.TotalAmount,
      'BankAccountNumber': instance.BankAccountNumber,
      'LoginTimeStamp': instance.LoginTimeStamp,
      'Competition': instance.Competition,
      'CountryName': instance.CountryName,
      'TimeZoneName': instance.TimeZoneName,
      'DeviceFCMToken': instance.DeviceFCMToken,
    };
