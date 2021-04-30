
import 'package:json_annotation/json_annotation.dart';

part 'save_model_change.g.dart';

@JsonSerializable()
class SaveModelChange{
  bool checked;
  @JsonKey()
  int Id;
  @JsonKey()
  int ParentId;
  @JsonKey()
  int UserId;
  @JsonKey()
  double LifeTimeCharges;
  @JsonKey()
  double MonthlyCharges;
  @JsonKey()
  double TotalAmount;
  @JsonKey()
  int SubjectId;
  @JsonKey()
  String SubjectName;
  @JsonKey()
  int SlabId;
  @JsonKey()
  double Concession;
  @JsonKey()
  double TotalPayable;
  @JsonKey()
  int PaymentType;
  @JsonKey()
  int NoOfMonths;
  @JsonKey()
  int CreatedBy;
  @JsonKey()
  int DeletedBy;
  @JsonKey()
  String IBAN;
  @JsonKey()
  String StartDate;
  @JsonKey()
  String ExpiryDate;
  @JsonKey()
  bool isApproved;
  @JsonKey()
  bool isActive;
  @JsonKey()
  bool isAdmin;
  @JsonKey()
  String CreatedDate;
  @JsonKey()
  String DeletedDate;
  @JsonKey()
  String Status;
  @JsonKey()
  String Slab;
  @JsonKey()
  String RoleOverTime;

  SaveModelChange();

  factory SaveModelChange.fromJson(Map<String, dynamic> json) =>
      _$SaveModelChangeFromJson(json);

  Map<String, dynamic> toJson() => _$SaveModelChangeToJson(this);
}