// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) {
  return PaymentModel()
    ..Id = json['Id'] as int
    ..FirstName = json['FirstName'] as String
    ..LastName = json['LastName'] as String
    ..UserName = json['UserName'] as String
    ..Email = json['Email'] as String
    ..ContactNumber = json['ContactNumber'] as String
    ..Password = json['Password'] as String
    ..Country = json['Country'] as int
    ..CreatedBy = json['CreatedBy'] as int
    ..CreatedDate = json['CreatedDate'] as String
    ..ModifiedBy = json['ModifiedBy'] as int
    ..ModifiedDate = json['ModifiedDate'] as String
    ..isDeleted = json['isDeleted'] as bool
    ..isActiveUser = json['isActiveUser'] as bool
    ..SubscriptionId = json['SubscriptionId'] as int
    ..SubscriptionParentId = json['SubscriptionParentId'] as int
    ..SubscribedUserId = json['SubscribedUserId'] as int
    ..SubjectId = json['SubjectId'] as int
    ..SubjectName = json['SubjectName'] as String
    ..SlabId = json['SlabId'] as int
    ..MonthlyCharges = (json['MonthlyCharges'] as num)?.toDouble()
    ..LifeTimeCharges = (json['LifeTimeCharges'] as num)?.toDouble()
    ..TotalAmount = (json['TotalAmount'] as num)?.toDouble()
    ..Concession = (json['Concession'] as num)?.toDouble()
    ..TotalPayable = (json['TotalPayable'] as num)?.toDouble()
    ..IBAN = json['IBAN'] as String
    ..StartDate = json['StartDate'] as String
    ..ExpiryDate = json['ExpiryDate'] as String
    ..isApproved = json['isApproved'] as String
    ..RecordStatus = json['RecordStatus'] as String
    ..IsAdmin = json['IsAdmin'] as String
    ..Status = json['Status'] as String
    ..Subscription = json['Subscription'] as String
    ..StatusColor = json['StatusColor'] as String;
}

Map<String, dynamic> _$PaymentModelToJson(PaymentModel instance) =>
    <String, dynamic>{
      'Id': instance.Id,
      'FirstName': instance.FirstName,
      'LastName': instance.LastName,
      'UserName': instance.UserName,
      'Email': instance.Email,
      'ContactNumber': instance.ContactNumber,
      'Password': instance.Password,
      'Country': instance.Country,
      'CreatedBy': instance.CreatedBy,
      'CreatedDate': instance.CreatedDate,
      'ModifiedBy': instance.ModifiedBy,
      'ModifiedDate': instance.ModifiedDate,
      'isDeleted': instance.isDeleted,
      'isActiveUser': instance.isActiveUser,
      'SubscriptionId': instance.SubscriptionId,
      'SubscriptionParentId': instance.SubscriptionParentId,
      'SubscribedUserId': instance.SubscribedUserId,
      'SubjectId': instance.SubjectId,
      'SubjectName': instance.SubjectName,
      'SlabId': instance.SlabId,
      'MonthlyCharges': instance.MonthlyCharges,
      'LifeTimeCharges': instance.LifeTimeCharges,
      'TotalAmount': instance.TotalAmount,
      'Concession': instance.Concession,
      'TotalPayable': instance.TotalPayable,
      'IBAN': instance.IBAN,
      'StartDate': instance.StartDate,
      'ExpiryDate': instance.ExpiryDate,
      'isApproved': instance.isApproved,
      'RecordStatus': instance.RecordStatus,
      'IsAdmin': instance.IsAdmin,
      'Status': instance.Status,
      'Subscription': instance.Subscription,
      'StatusColor': instance.StatusColor,
    };
