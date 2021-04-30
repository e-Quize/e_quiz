import 'package:e_quiz/models/common/base_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:e_quiz/models/user/user_entity_copy.dart';
import 'package:e_quiz/models/user/common_result.dart';
import 'package:e_quiz/models/quiz/slab_type_vm.dart';

part 'slab_vm.g.dart';

@JsonSerializable()
class SlabVm extends BaseModel{
  @JsonKey()
  int Id;
  @JsonKey()
  String Name;
  @JsonKey()
  double Concession;
  @JsonKey()
  int Duration;
  @JsonKey()
  int SubscribedMonth;
  @JsonKey()
  DateTime SubscribedDate;
  @JsonKey()
  DateTime ModifiedDate;
  @JsonKey()
  double TotalPayable;
  @JsonKey()
  int CreatedBy;
  @JsonKey()
  String BankAccountNumber;
  @JsonKey()
  int PaymentType;
  @JsonKey()
  int ModifiedBy;
  @JsonKey()
  int SlabType;
  @JsonKey()
  List<SlabTypeVM> slabTypes;
  @JsonKey()
  double TotalAmount;
  @JsonKey()
  UserEntityCopy userEntity;
  @JsonKey()
  CommonResult ComRes;
  @JsonKey()
  DateTime ExpiryDate;

  @JsonKey()
  int RoleId;

  @JsonKey()
  bool isApproved;

  SlabVm();

  factory SlabVm.fromJson(Map<String, dynamic> json) =>
      _$SlabVmFromJson(json);

  Map<String, dynamic> toJson() => _$SlabVmToJson(this);
}
