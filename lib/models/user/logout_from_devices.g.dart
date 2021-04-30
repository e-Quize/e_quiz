// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_from_devices.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogoutFromDevices _$LogoutFromDevicesFromJson(Map<String, dynamic> json) {
  return LogoutFromDevices()
    ..ResponseId = json['ResponseId'] as int
    ..ResponseMessage = json['ResponseMessage'] as String;
}

Map<String, dynamic> _$LogoutFromDevicesToJson(LogoutFromDevices instance) =>
    <String, dynamic>{
      'ResponseId': instance.ResponseId,
      'ResponseMessage': instance.ResponseMessage,
    };
