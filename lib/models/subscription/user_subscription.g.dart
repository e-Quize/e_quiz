// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSubscriptionModel _$UserSubscriptionModelFromJson(
    Map<String, dynamic> json) {
  return UserSubscriptionModel()
    ..userEntity = json['userEntity'] == null
        ? null
        : UserEntityCopy.fromJson(json['userEntity'] as Map<String, dynamic>)
    ..Token = json['Token'] as String
    ..checked = json['checked'] as bool
    ..Id = json['Id'] as int
    ..ParentId = json['ParentId'] as int
    ..UserId = json['UserId'] as int
    ..SubjectId = json['SubjectId'] as int
    ..SubjectName = json['SubjectName'] as String
    ..SlabId = json['SlabId'] as int
    ..SlabName = json['SlabName'] as String
    ..MonthlyCharges = (json['MonthlyCharges'] as num)?.toDouble()
    ..LifeTimeCharges = (json['LifeTimeCharges'] as num)?.toDouble()
    ..TotalAmount = (json['TotalAmount'] as num)?.toDouble()
    ..Concession = (json['Concession'] as num)?.toDouble()
    ..TotalPayable = (json['TotalPayable'] as num)?.toDouble()
    ..PaymentType = json['PaymentType'] as int
    ..NoOfMonths = json['NoOfMonths'] as int
    ..IBAN = json['IBAN'] as String
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
        : DateTime.parse(json['RoleOverTime'] as String)
    ..isAdmin = json['isAdmin'] as bool
    ..CreatedDate = json['CreatedDate'] == null
        ? null
        : DateTime.parse(json['CreatedDate'] as String)
    ..CreatedBy = json['CreatedBy'] as int
    ..isDeleted = json['isDeleted'] as bool
    ..DeletedBy = json['DeletedBy'] as int
    ..DeletedDate = json['DeletedDate'] == null
        ? null
        : DateTime.parse(json['DeletedDate'] as String);
}

Map<String, dynamic> _$UserSubscriptionModelToJson(
        UserSubscriptionModel instance) =>
    <String, dynamic>{
      'userEntity': instance.userEntity,
      'Token': instance.Token,
      'checked': instance.checked,
      'Id': instance.Id,
      'ParentId': instance.ParentId,
      'UserId': instance.UserId,
      'SubjectId': instance.SubjectId,
      'SubjectName': instance.SubjectName,
      'SlabId': instance.SlabId,
      'SlabName': instance.SlabName,
      'MonthlyCharges': instance.MonthlyCharges,
      'LifeTimeCharges': instance.LifeTimeCharges,
      'TotalAmount': instance.TotalAmount,
      'Concession': instance.Concession,
      'TotalPayable': instance.TotalPayable,
      'PaymentType': instance.PaymentType,
      'NoOfMonths': instance.NoOfMonths,
      'IBAN': instance.IBAN,
      'StartDate': instance.StartDate?.toIso8601String(),
      'ExpiryDate': instance.ExpiryDate?.toIso8601String(),
      'isActive': instance.isActive,
      'ApprovedBy': instance.ApprovedBy,
      'ApprovedDate': instance.ApprovedDate?.toIso8601String(),
      'RoleOverTime': instance.RoleOverTime?.toIso8601String(),
      'isAdmin': instance.isAdmin,
      'CreatedDate': instance.CreatedDate?.toIso8601String(),
      'CreatedBy': instance.CreatedBy,
      'isDeleted': instance.isDeleted,
      'DeletedBy': instance.DeletedBy,
      'DeletedDate': instance.DeletedDate?.toIso8601String(),
    };
