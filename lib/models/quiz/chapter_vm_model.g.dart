// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_vm_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChapterVmModel _$ChapterVmModelFromJson(Map<String, dynamic> json) {
  return ChapterVmModel()
    ..checked = json['checked'] as bool ?? false
    ..index = json['index'] as int
    ..Id = json['Id'] as int
    ..ChapterName = json['ChapterName'] as String
    ..SubjectId = json['SubjectId'] as int
    ..CreatedBy = json['CreatedBy'] as int
    ..CreatedDate = json['CreatedDate'] == null
        ? null
        : DateTime.parse(json['CreatedDate'] as String)
    ..ModifiedBy = json['ModifiedBy'] as int
    ..ModifiedDate = json['ModifiedDate'] == null
        ? null
        : DateTime.parse(json['ModifiedDate'] as String)
    ..isActive = json['isActive'] as bool
    ..isDeleted = json['isDeleted'] as bool
    ..ComRes = json['ComRes'] == null
        ? null
        : CommonResult.fromJson(json['ComRes'] as Map<String, dynamic>)
    ..SubjectName = json['SubjectName'] as String
    ..subjects = (json['subjects'] as List)
        ?.map((e) =>
            e == null ? null : SubjectModel.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ChapterVmModelToJson(ChapterVmModel instance) =>
    <String, dynamic>{
      'checked': instance.checked,
      'index': instance.index,
      'Id': instance.Id,
      'ChapterName': instance.ChapterName,
      'SubjectId': instance.SubjectId,
      'CreatedBy': instance.CreatedBy,
      'CreatedDate': instance.CreatedDate?.toIso8601String(),
      'ModifiedBy': instance.ModifiedBy,
      'ModifiedDate': instance.ModifiedDate?.toIso8601String(),
      'isActive': instance.isActive,
      'isDeleted': instance.isDeleted,
      'ComRes': instance.ComRes,
      'SubjectName': instance.SubjectName,
      'subjects': instance.subjects,
    };
