import 'package:e_quiz/models/quiz/subject_model.dart';
import 'package:e_quiz/models/user/common_result.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chapter_vm_model.g.dart';

@JsonSerializable()
class ChapterVmModel {
  bool checked;
  int index;
  @JsonKey()
  int Id;
  @JsonKey()
  String ChapterName;
  @JsonKey()
  int SubjectId;
  @JsonKey()
  int CreatedBy;
  @JsonKey()
  DateTime CreatedDate;
  @JsonKey()
  int ModifiedBy;
  @JsonKey()
  DateTime ModifiedDate;
  @JsonKey()
  bool isActive;
  @JsonKey()
  bool isDeleted;
  @JsonKey()
  CommonResult ComRes;
  @JsonKey()
  String SubjectName;
  @JsonKey()
  List<SubjectModel> subjects;

  ChapterVmModel() {
    ComRes = new CommonResult();
    subjects = new List<SubjectModel>();
  }

  factory ChapterVmModel.fromJson(Map<String, dynamic> json) =>
      _$ChapterVmModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChapterVmModelToJson(this);
}
