// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slab_vm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SlabVm _$SlabVmFromJson(Map<String, dynamic> json) {
  return SlabVm()
    ..Token = json['Token'] as String
    ..Id = json['Id'] as int
    ..Name = json['Name'] as String
    ..Concession = (json['Concession'] as num)?.toDouble()
    ..Duration = json['Duration'] as int
    ..SubscribedMonth = json['SubscribedMonth'] as int
    ..SubscribedDate = json['SubscribedDate'] == null
        ? null
        : DateTime.parse(json['SubscribedDate'] as String)
    ..ModifiedDate = json['ModifiedDate'] == null
        ? null
        : DateTime.parse(json['ModifiedDate'] as String)
    ..TotalPayable = (json['TotalPayable'] as num)?.toDouble()
    ..CreatedBy = json['CreatedBy'] as int
    ..BankAccountNumber = json['BankAccountNumber'] as String
    ..PaymentType = json['PaymentType'] as int
    ..ModifiedBy = json['ModifiedBy'] as int
    ..SlabType = json['SlabType'] as int
    ..slabTypes = (json['slabTypes'] as List)
        ?.map((e) =>
            e == null ? null : SlabTypeVM.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..TotalAmount = (json['TotalAmount'] as num)?.toDouble()
    ..userEntity = json['userEntity'] == null
        ? null
        : UserEntityCopy.fromJson(json['userEntity'] as Map<String, dynamic>)
    ..ComRes = json['ComRes'] == null
        ? null
        : CommonResult.fromJson(json['ComRes'] as Map<String, dynamic>)
    ..ExpiryDate = json['ExpiryDate'] == null
        ? null
        : DateTime.parse(json['ExpiryDate'] as String)
    ..RoleId = json['RoleId'] as int
    ..isApproved = json['isApproved'] as bool;
}

Map<String, dynamic> _$SlabVmToJson(SlabVm instance) => <String, dynamic>{
      'Token': instance.Token,
      'Id': instance.Id,
      'Name': instance.Name,
      'Concession': instance.Concession,
      'Duration': instance.Duration,
      'SubscribedMonth': instance.SubscribedMonth,
      'SubscribedDate': instance.SubscribedDate?.toIso8601String(),
      'ModifiedDate': instance.ModifiedDate?.toIso8601String(),
      'TotalPayable': instance.TotalPayable,
      'CreatedBy': instance.CreatedBy,
      'BankAccountNumber': instance.BankAccountNumber,
      'PaymentType': instance.PaymentType,
      'ModifiedBy': instance.ModifiedBy,
      'SlabType': instance.SlabType,
      'slabTypes': instance.slabTypes,
      'TotalAmount': instance.TotalAmount,
      'userEntity': instance.userEntity,
      'ComRes': instance.ComRes,
      'ExpiryDate': instance.ExpiryDate?.toIso8601String(),
      'RoleId': instance.RoleId,
      'isApproved': instance.isApproved,
    };
