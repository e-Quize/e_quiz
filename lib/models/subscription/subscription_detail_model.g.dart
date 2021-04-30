// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionDetailModel _$SubscriptionDetailModelFromJson(
    Map<String, dynamic> json) {
  return SubscriptionDetailModel()
    ..userEntity = json['userEntity'] == null
        ? null
        : UserEntityCopy.fromJson(json['userEntity'] as Map<String, dynamic>)
    ..Token = json['Token'] as String
    ..Id = json['Id'] as int
    ..checked = json['checked'] as bool??false
    ..SlabId = json['SlabId'] as int
    ..UserId = json['UserId'] as int
    ..SubjectName = json['SubjectName'] as String
    ..SlabName = json['SlabName'] as String
    ..SubjectId = json['SubjectId'] as int
    ..Concession = (json['Concession'] as num)?.toDouble()
    ..NoOfMonths = json['NoOfMonths'] as int
    ..MonthlyCharges = (json['MonthlyCharges'] as num)?.toDouble()
    ..IBAN = json['IBAN'] as String
    ..LifeTimeCharges = (json['LifeTimeCharges'] as num)?.toDouble()
    ..TotalAmount = (json['TotalAmount'] as num)?.toDouble()
    ..TotalPayable = (json['TotalPayable'] as num)?.toDouble()
    ..PaymentType = json['PaymentType'] as int
    ..StartDate = json['StartDate'] == null
        ? null
        : DateTime.parse(json['StartDate'] as String)
    ..ExpiryDate = json['ExpiryDate'] == null
        ? null
        : DateTime.parse(json['ExpiryDate'] as String)
    ..isActive = json['isActive'] as bool
    ..ApprovedBy = json['ApprovedBy'] as int
    ..ApprovedDate = json['ApprovedDate'] == null
        ? null
        : DateTime.parse(json['ApprovedDate'] as String)
    ..RoleOverTime = json['RoleOverTime'] == null
        ? null
        : DateTime.parse(json['RoleOverTime'] as String);
}

Map<String, dynamic> _$SubscriptionDetailModelToJson(
        SubscriptionDetailModel instance) =>
    <String, dynamic>{
      'userEntity': instance.userEntity,
      'Token': instance.Token,
      'Id': instance.Id,
      'checked': instance.checked,
      'SlabId': instance.SlabId,
      'UserId': instance.UserId,
      'SubjectName': instance.SubjectName,
      'SlabName': instance.SlabName,
      'SubjectId': instance.SubjectId,
      'Concession': instance.Concession,
      'NoOfMonths': instance.NoOfMonths,
      'MonthlyCharges': instance.MonthlyCharges,
      'IBAN': instance.IBAN,
      'LifeTimeCharges': instance.LifeTimeCharges,
      'TotalAmount': instance.TotalAmount,
      'TotalPayable': instance.TotalPayable,
      'PaymentType': instance.PaymentType,
      'StartDate': instance.StartDate?.toIso8601String(),
      'ExpiryDate': instance.ExpiryDate?.toIso8601String(),
      'isActive': instance.isActive,
      'ApprovedBy': instance.ApprovedBy,
      'ApprovedDate': instance.ApprovedDate?.toIso8601String(),
      'RoleOverTime': instance.RoleOverTime?.toIso8601String(),
    };
