import 'package:e_quiz/models/common/base_model.dart';
import 'package:e_quiz/models/user/user_entity_copy.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_subscription.g.dart';

@JsonSerializable()
class UserSubscriptionModel extends BaseModel {
  bool checked;
  @JsonKey()
  int Id;
  @JsonKey()
  int ParentId;
  @JsonKey()
  int UserId;
  @JsonKey()
  int SubjectId;
  @JsonKey()
  String SubjectName;

  @JsonKey()
  int SlabId;
  @JsonKey()
  String SlabName;

  @JsonKey()
  double MonthlyCharges;
  @JsonKey()
  double LifeTimeCharges;
  @JsonKey()
  double TotalAmount;

  @JsonKey()
  double Concession;

  @JsonKey()
  double TotalPayable;
  @JsonKey()
  int PaymentType;

  @JsonKey()
  int NoOfMonths;
  @JsonKey()
  String IBAN;
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

  @JsonKey()
  bool isAdmin;

  @JsonKey()
  DateTime CreatedDate;
  @JsonKey()
  int CreatedBy;

  @JsonKey()
  bool isDeleted;

  @JsonKey()
  int DeletedBy;
  @JsonKey()
  DateTime DeletedDate;

  UserSubscriptionModel();

  factory UserSubscriptionModel.fromJson(Map<String, dynamic> json) =>
      _$UserSubscriptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserSubscriptionModelToJson(this);
}
