// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_subscription_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveSubscriptionResponse _$SaveSubscriptionResponseFromJson(
    Map<String, dynamic> json) {
  return SaveSubscriptionResponse()
    ..Id = json['Id'] as int
    ..Name = json['Name'] as String
    ..Concession = (json['Concession'] as num)?.toDouble()
    ..Duration = json['Duration'] as int
    ..ComRes = json['ComRes'] == null
        ? null
        : CommonResult.fromJson(json['ComRes'] as Map<String, dynamic>)
    ..CreatedBy = json['CreatedBy'] as int
    ..CreatedDate = json['CreatedDate'] == null
        ? null
        : DateTime.parse(json['CreatedDate'] as String)
    ..ModifiedBy = json['ModifiedBy'] as int
    ..ModifiedDate = json['ModifiedDate'] == null
        ? null
        : DateTime.parse(json['ModifiedDate'] as String)
    ..slabTypes = (json['slabTypes'] as List)
        ?.map((e) =>
            e == null ? null : SlabTypeVM.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..SlabType = json['SlabType'] as int
    ..userEntity = json['userEntity'] == null
        ? null
        : UserEntityCopy.fromJson(json['userEntity'] as Map<String, dynamic>)
    ..TotalAmount = (json['TotalAmount'] as num)?.toDouble();
}

Map<String, dynamic> _$SaveSubscriptionResponseToJson(
        SaveSubscriptionResponse instance) =>
    <String, dynamic>{
      'Id': instance.Id,
      'Name': instance.Name,
      'Concession': instance.Concession,
      'Duration': instance.Duration,
      'ComRes': instance.ComRes,
      'CreatedBy': instance.CreatedBy,
      'CreatedDate': instance.CreatedDate?.toIso8601String(),
      'ModifiedBy': instance.ModifiedBy,
      'ModifiedDate': instance.ModifiedDate?.toIso8601String(),
      'slabTypes': instance.slabTypes,
      'SlabType': instance.SlabType,
      'userEntity': instance.userEntity,
      'TotalAmount': instance.TotalAmount,
    };
