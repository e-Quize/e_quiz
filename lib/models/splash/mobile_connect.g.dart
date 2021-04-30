// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobile_connect.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MobileConnectResponse _$MobileConnectResponseFromJson(
    Map<String, dynamic> json) {
  return MobileConnectResponse()
    ..Id = json['Id'] as int
    ..SupportEmailAddress = json['SupportEmailAddress'] as String
    ..File = json['File'] as String
    ..ApplicationLogo = json['ApplicationLogo'] as String
    ..Logo = json['Logo'] as String
    ..MimeType = json['MimeType'] as String
    ..ApplicationName = json['ApplicationName'] as String
    ..ModifiedBy = json['ModifiedBy'] as int
    ..FacebookURL = json['FacebookURL'] as String
    ..TwitterURL = json['TwitterURL'] as String
    ..LinkedInURL = json['LinkedInURL'] as String
    ..BankAccountInfo = json['BankAccountInfo'] as String;
}

Map<String, dynamic> _$MobileConnectResponseToJson(
        MobileConnectResponse instance) =>
    <String, dynamic>{
      'Id': instance.Id,
      'SupportEmailAddress': instance.SupportEmailAddress,
      'File': instance.File,
      'ApplicationLogo': instance.ApplicationLogo,
      'Logo': instance.Logo,
      'MimeType': instance.MimeType,
      'ApplicationName': instance.ApplicationName,
      'ModifiedBy': instance.ModifiedBy,
      'FacebookURL': instance.FacebookURL,
      'TwitterURL': instance.TwitterURL,
      'LinkedInURL': instance.LinkedInURL,
      'BankAccountInfo': instance.BankAccountInfo,
    };
