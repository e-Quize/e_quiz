// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countries_vm_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryVm _$CountryVmFromJson(Map<String, dynamic> json) {
  return CountryVm()
    ..Id = json['Id'] as int
    ..Name = json['Name'] as String
    ..OrderBy = json['OrderBy'] as int
    ..IsDefault = json['IsDefault'] as bool
    ..TwoLetterISORegionName = json['TwoLetterISORegionName'] as String
    ..IsDeleted = json['IsDeleted'] as bool
    ..CreatedBy = json['CreatedBy'] as int
    ..ModifiedBy = json['ModifiedBy'] as int
    ..CreatedDate = json['CreatedDate'] == null
        ? null
        : DateTime.parse(json['CreatedDate'] as String)
    ..ModifiedDate = json['ModifiedDate'] == null
        ? null
        : DateTime.parse(json['ModifiedDate'] as String)
    ..ComRes = json['ComRes'] == null
        ? null
        : CommonResult.fromJson(json['ComRes'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CountryVmToJson(CountryVm instance) => <String, dynamic>{
      'Id': instance.Id,
      'Name': instance.Name,
      'OrderBy': instance.OrderBy,
      'IsDefault': instance.IsDefault,
      'TwoLetterISORegionName': instance.TwoLetterISORegionName,
      'IsDeleted': instance.IsDeleted,
      'CreatedBy': instance.CreatedBy,
      'ModifiedBy': instance.ModifiedBy,
      'CreatedDate': instance.CreatedDate?.toIso8601String(),
      'ModifiedDate': instance.ModifiedDate?.toIso8601String(),
      'ComRes': instance.ComRes,
    };
