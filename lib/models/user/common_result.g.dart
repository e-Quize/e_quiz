// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonResult _$CommonResultFromJson(Map<String, dynamic> json) {
  return CommonResult()
    ..ResponseId = json['ResponseId'] as int
    ..ResponseMessage = json['ResponseMessage'] as String;
}

Map<String, dynamic> _$CommonResultToJson(CommonResult instance) =>
    <String, dynamic>{
      'ResponseId': instance.ResponseId,
      'ResponseMessage': instance.ResponseMessage,
    };
