// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobile_connect_copy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MobileConnectResponseCopy _$MobileConnectResponseCopyFromJson(
    Map<String, dynamic> json) {
  return MobileConnectResponseCopy()
    ..SupportEmailAddress = json['SupportEmailAddress'] as String
    ..ApplicationName = json['ApplicationName'] as String
    ..BankAccountInfo = json['BankAccountInfo'] as String
    ..FacebookURL = json['FacebookURL'] as String
    ..TwitterURL = json['TwitterURL'] as String
    ..LinkedInURL = json['LinkedInURL'] as String;
}

Map<String, dynamic> _$MobileConnectResponseCopyToJson(
        MobileConnectResponseCopy instance) =>
    <String, dynamic>{
      'SupportEmailAddress': instance.SupportEmailAddress,
      'ApplicationName': instance.ApplicationName,
      'BankAccountInfo': instance.BankAccountInfo,
      'FacebookURL': instance.FacebookURL,
      'TwitterURL': instance.TwitterURL,
      'LinkedInURL': instance.LinkedInURL,
    };
