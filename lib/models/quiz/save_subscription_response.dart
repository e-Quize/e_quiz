import 'package:e_quiz/models/user/user_entity_copy.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:e_quiz/models/user/common_result.dart';
import 'package:e_quiz/models/quiz/slab_type_vm.dart';

part 'save_subscription_response.g.dart';

@JsonSerializable()
class SaveSubscriptionResponse {
  @JsonKey()
  int Id;
  @JsonKey()
  String Name;
  @JsonKey()
  double Concession;
  @JsonKey()
  int Duration;
  @JsonKey()
  CommonResult ComRes;
  @JsonKey()
  int CreatedBy;
  @JsonKey()
  DateTime CreatedDate;
  @JsonKey()
  int ModifiedBy;
  @JsonKey()
  DateTime ModifiedDate;
  @JsonKey()
  List<SlabTypeVM> slabTypes;
  @JsonKey()
  int SlabType;
  @JsonKey()
  UserEntityCopy userEntity;
  @JsonKey()
  double TotalAmount;

  SaveSubscriptionResponse();

  factory SaveSubscriptionResponse.fromJson(Map<String, dynamic> json) =>
      _$SaveSubscriptionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SaveSubscriptionResponseToJson(this);
}
