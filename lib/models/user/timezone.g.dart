// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timezone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeZone _$TimeZoneFromJson(Map<String, dynamic> json) {
  return TimeZone()
    ..CountryID = json['CountryID'] as int
    ..TimeZoneID = json['TimeZoneID'] as int
    ..TimeZoneIDs = json['TimeZoneIDs'] as String
    ..DisplayName = json['DisplayName'] as String
    ..IsDeleted = json['IsDeleted'] as bool
    ..CreatedBy = json['CreatedBy'] as int
    ..CreatedDate = json['CreatedDate'] == null
        ? null
        : DateTime.parse(json['CreatedDate'] as String)
    ..ModifiedBy = json['ModifiedBy'] as int
    ..ModifiedDate = json['ModifiedDate'] == null
        ? null
        : DateTime.parse(json['ModifiedDate'] as String)
    ..commonResult = json['commonResult'] == null
        ? null
        : CommonResult.fromJson(json['commonResult'] as Map<String, dynamic>);
}

Map<String, dynamic> _$TimeZoneToJson(TimeZone instance) => <String, dynamic>{
      'CountryID': instance.CountryID,
      'TimeZoneID': instance.TimeZoneID,
      'TimeZoneIDs': instance.TimeZoneIDs,
      'DisplayName': instance.DisplayName,
      'IsDeleted': instance.IsDeleted,
      'CreatedBy': instance.CreatedBy,
      'CreatedDate': instance.CreatedDate?.toIso8601String(),
      'ModifiedBy': instance.ModifiedBy,
      'ModifiedDate': instance.ModifiedDate?.toIso8601String(),
      'commonResult': instance.commonResult,
    };
