import 'package:e_quiz/models/common/base_model.dart';
import 'package:e_quiz/models/quiz/chapter_vm_model.dart';
import 'package:e_quiz/models/subscription/subscription_detail_model.dart';
import 'package:e_quiz/models/user/common_result.dart';
import 'package:e_quiz/models/user/user_entity_copy.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subject_model.g.dart';

@JsonSerializable()
class SubjectModel extends BaseModel {
  bool checked;
  int index;
  @JsonKey()
  String SubjectName;
  @JsonKey()
  bool isAuthenticated;
  @JsonKey()
  int Id;
  @JsonKey()
  DateTime TokenGenerationTime;
  @JsonKey()
  DateTime LastRequestTime;
  @JsonKey()
  String FirstName;
  @JsonKey()
  int CreatedBy;
  @JsonKey()
  DateTime CreatedDate;
  @JsonKey()
  DateTime ModifiedDate;
  @JsonKey()
  int ModifiedBy;
  @JsonKey()
  bool isActive;
  @JsonKey()
  double TotalPayable;
  @JsonKey()
  bool isDeleted;
  @JsonKey()
  double PerMonthAmount;
  @JsonKey()
  double LifeTimeAmount;
  @JsonKey()
  CommonResult ComRes;
  List<ChapterVmModel> chapterList;
  SubscriptionDetailModel userSubscriptionModel;

  SubjectModel();

  factory SubjectModel.fromJson(Map<String, dynamic> json) =>
      _$SubjectModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectModelToJson(this);
}
