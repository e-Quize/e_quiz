// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectModel _$SubjectModelFromJson(Map<String, dynamic> json) {
  return SubjectModel()
    ..userEntity = json['userEntity'] == null
        ? null
        : UserEntityCopy.fromJson(json['userEntity'] as Map<String, dynamic>)
    ..Token = json['Token'] as String
    ..checked = json['checked'] as bool ?? false
    ..index = json['index'] as int
    ..SubjectName = json['SubjectName'] as String
    ..isAuthenticated = json['isAuthenticated'] as bool
    ..Id = json['Id'] as int
    ..TokenGenerationTime = json['TokenGenerationTime'] == null
        ? null
        : DateTime.parse(json['TokenGenerationTime'] as String)
    ..LastRequestTime = json['LastRequestTime'] == null
        ? null
        : DateTime.parse(json['LastRequestTime'] as String)
    ..FirstName = json['FirstName'] as String
    ..CreatedBy = json['CreatedBy'] as int
    ..CreatedDate = json['CreatedDate'] == null
        ? null
        : DateTime.parse(json['CreatedDate'] as String)
    ..ModifiedDate = json['ModifiedDate'] == null
        ? null
        : DateTime.parse(json['ModifiedDate'] as String)
    ..ModifiedBy = json['ModifiedBy'] as int
    ..isActive = json['isActive'] as bool
    ..TotalPayable = (json['TotalPayable'] as num)?.toDouble()
    ..isDeleted = json['isDeleted'] as bool
    ..PerMonthAmount = (json['PerMonthAmount'] as num)?.toDouble()
    ..LifeTimeAmount = (json['LifeTimeAmount'] as num)?.toDouble()
    ..ComRes = json['ComRes'] == null
        ? null
        : CommonResult.fromJson(json['ComRes'] as Map<String, dynamic>)
    ..chapterList = (json['chapterList'] as List)
        ?.map((e) => e == null
            ? null
            : ChapterVmModel.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..userSubscriptionModel = json['userSubscriptionModel'] == null
        ? null
        : SubscriptionDetailModel.fromJson(
            json['userSubscriptionModel'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SubjectModelToJson(SubjectModel instance) =>
    <String, dynamic>{
      'userEntity': instance.userEntity,
      'Token': instance.Token,
      'checked': instance.checked,
      'index': instance.index,
      'SubjectName': instance.SubjectName,
      'isAuthenticated': instance.isAuthenticated,
      'Id': instance.Id,
      'TokenGenerationTime': instance.TokenGenerationTime?.toIso8601String(),
      'LastRequestTime': instance.LastRequestTime?.toIso8601String(),
      'FirstName': instance.FirstName,
      'CreatedBy': instance.CreatedBy,
      'CreatedDate': instance.CreatedDate?.toIso8601String(),
      'ModifiedDate': instance.ModifiedDate?.toIso8601String(),
      'ModifiedBy': instance.ModifiedBy,
      'isActive': instance.isActive,
      'TotalPayable': instance.TotalPayable,
      'isDeleted': instance.isDeleted,
      'PerMonthAmount': instance.PerMonthAmount,
      'LifeTimeAmount': instance.LifeTimeAmount,
      'ComRes': instance.ComRes,
      'chapterList': instance.chapterList,
      'userSubscriptionModel': instance.userSubscriptionModel,
    };
