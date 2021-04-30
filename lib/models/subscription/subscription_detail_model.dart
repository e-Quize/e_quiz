import 'package:e_quiz/models/common/base_model.dart';
import 'package:e_quiz/models/user/user_entity_copy.dart';
import 'package:json_annotation/json_annotation.dart';


part 'subscription_detail_model.g.dart';
@JsonSerializable()
class SubscriptionDetailModel extends BaseModel {
  @JsonKey()
  int Id;
  bool checked;
  @JsonKey()
  int SlabId;
  @JsonKey()
  int UserId;
  @JsonKey()
  String SubjectName;
  @JsonKey()
  String SlabName;
  @JsonKey()
  int SubjectId;
  @JsonKey()
  double Concession;
  @JsonKey()
  int NoOfMonths;
  @JsonKey()
  double MonthlyCharges;
  @JsonKey()
  String IBAN;
  @JsonKey()
  double LifeTimeCharges;
  @JsonKey()
  double TotalAmount;
  @JsonKey()
  double TotalPayable;
  @JsonKey()
  int PaymentType;
  @JsonKey()
  DateTime StartDate;

  @JsonKey()
  DateTime ExpiryDate;
  @JsonKey()
  bool isActive;
  @JsonKey()
  int ApprovedBy;
  @JsonKey()
  DateTime ApprovedDate;
  @JsonKey()
  DateTime RoleOverTime;

  SubscriptionDetailModel();

  factory SubscriptionDetailModel.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionDetailModelToJson(this);
}
