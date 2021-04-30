// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_model_change.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveModelChange _$SaveModelChangeFromJson(Map<String, dynamic> json) {
  return SaveModelChange()
    ..checked = json['checked'] as bool??false
    ..Id = json['Id'] as int
    ..ParentId = json['ParentId'] as int
    ..UserId = json['UserId'] as int
    ..LifeTimeCharges = (json['LifeTimeCharges'] as num)?.toDouble()
    ..MonthlyCharges = (json['MonthlyCharges'] as num)?.toDouble()
    ..TotalAmount = (json['TotalAmount'] as num)?.toDouble()
    ..SubjectId = json['SubjectId'] as int
    ..SubjectName = json['SubjectName'] as String
    ..SlabId = json['SlabId'] as int
    ..Concession = (json['Concession'] as num)?.toDouble()
    ..TotalPayable = (json['TotalPayable'] as num)?.toDouble()
    ..PaymentType = json['PaymentType'] as int
    ..NoOfMonths = json['NoOfMonths'] as int
    ..CreatedBy = json['CreatedBy'] as int
    ..DeletedBy = json['DeletedBy'] as int
    ..IBAN = json['IBAN'] as String
    ..StartDate = json['StartDate'] as String
    ..ExpiryDate = json['ExpiryDate'] as String
    ..isApproved = json['isApproved'] as bool
    ..isActive = json['isActive'] as bool
    ..isAdmin = json['isAdmin'] as bool
    ..CreatedDate = json['CreatedDate'] as String
    ..DeletedDate = json['DeletedDate'] as String
    ..Status = json['Status'] as String
    ..Slab = json['Slab'] as String
    ..RoleOverTime = json['RoleOverTime'] as String;
}

Map<String, dynamic> _$SaveModelChangeToJson(SaveModelChange instance) =>
    <String, dynamic>{
      'checked': instance.checked,
      'Id': instance.Id,
      'ParentId': instance.ParentId,
      'UserId': instance.UserId,
      'LifeTimeCharges': instance.LifeTimeCharges,
      'MonthlyCharges': instance.MonthlyCharges,
      'TotalAmount': instance.TotalAmount,
      'SubjectId': instance.SubjectId,
      'SubjectName': instance.SubjectName,
      'SlabId': instance.SlabId,
      'Concession': instance.Concession,
      'TotalPayable': instance.TotalPayable,
      'PaymentType': instance.PaymentType,
      'NoOfMonths': instance.NoOfMonths,
      'CreatedBy': instance.CreatedBy,
      'DeletedBy': instance.DeletedBy,
      'IBAN': instance.IBAN,
      'StartDate': instance.StartDate,
      'ExpiryDate': instance.ExpiryDate,
      'isApproved': instance.isApproved,
      'isActive': instance.isActive,
      'isAdmin': instance.isAdmin,
      'CreatedDate': instance.CreatedDate,
      'DeletedDate': instance.DeletedDate,
      'Status': instance.Status,
      'Slab': instance.Slab,
      'RoleOverTime': instance.RoleOverTime,
    };
