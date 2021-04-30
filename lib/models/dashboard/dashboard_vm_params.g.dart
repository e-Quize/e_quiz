// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_vm_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardVMParams _$DashboardVMParamsFromJson(Map<String, dynamic> json) {
  return DashboardVMParams()
    ..userEntity = json['userEntity'] == null
        ? null
        : UserEntityCopy.fromJson(json['userEntity'] as Map<String, dynamic>)
    ..Token = json['Token'] as String;
}

Map<String, dynamic> _$DashboardVMParamsToJson(DashboardVMParams instance) =>
    <String, dynamic>{
      'userEntity': instance.userEntity,
      'Token': instance.Token,
    };
