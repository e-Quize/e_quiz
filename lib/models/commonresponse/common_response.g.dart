// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonResponse _$CommonResponseFromJson(Map<String, dynamic> json) {
  return CommonResponse()
    ..ResponseId = json['ResponseId'] as int
    ..ResponseMessage = json['ResponseMessage'] as String
    ..SubjectId = json['SubjectId'] as int;
}

Map<String, dynamic> _$CommonResponseToJson(CommonResponse instance) =>
    <String, dynamic>{
      'ResponseId': instance.ResponseId,
      'ResponseMessage': instance.ResponseMessage,
      'SubjectId': instance.SubjectId,
    };
