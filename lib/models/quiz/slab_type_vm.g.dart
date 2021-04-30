// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slab_type_vm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SlabTypeVM _$SlabTypeVMFromJson(Map<String, dynamic> json) {
  return SlabTypeVM()
    ..userEntity = json['userEntity'] == null
        ? null
        : UserEntityCopy.fromJson(json['userEntity'] as Map<String, dynamic>)
    ..Token = json['Token'] as String
    ..Id = json['Id'] as int
    ..SlabType = json['SlabType'] as String;
}

Map<String, dynamic> _$SlabTypeVMToJson(SlabTypeVM instance) =>
    <String, dynamic>{
      'userEntity': instance.userEntity,
      'Token': instance.Token,
      'Id': instance.Id,
      'SlabType': instance.SlabType,
    };
