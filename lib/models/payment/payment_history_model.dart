import 'package:json_annotation/json_annotation.dart';

part 'payment_history_model.g.dart';

@JsonSerializable()
class PaymentModel {
  @JsonKey()
  int Id;
  @JsonKey()
  String FirstName;
  @JsonKey()
  String LastName;
  @JsonKey()
  String UserName;
  @JsonKey()
  String Email;
  @JsonKey()
  String ContactNumber;
  @JsonKey()
  String Password;
  @JsonKey()
  int Country;
  @JsonKey()
  int CreatedBy;
  @JsonKey()
  String CreatedDate;
  @JsonKey()
  int ModifiedBy;
  @JsonKey()
  String ModifiedDate;
  @JsonKey()
  bool isDeleted;
  @JsonKey()
  bool isActiveUser;
  @JsonKey()
  int SubscriptionId;
  @JsonKey()
  int SubscriptionParentId;
  @JsonKey()
  int SubscribedUserId;
  @JsonKey()
  int SubjectId;
  @JsonKey()
  String SubjectName;
  @JsonKey()
  int SlabId;
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
  String IBAN;
  @JsonKey()
  String StartDate;
  @JsonKey()
  String ExpiryDate;
  @JsonKey()
  String isApproved;
  @JsonKey()
  String RecordStatus;
  @JsonKey()
  String IsAdmin;
  @JsonKey()
  String Status;
  @JsonKey()
  String Subscription;
  @JsonKey()
  String StatusColor;

  PaymentModel();

  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentModelToJson(this);
}
