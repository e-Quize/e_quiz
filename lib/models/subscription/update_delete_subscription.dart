import 'package:e_quiz/models/common/base_model.dart';
import 'package:e_quiz/models/user/user_entity_copy.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_delete_subscription.g.dart';

@JsonSerializable()
class UpdateDeleteSubscription extends BaseModel {


  @JsonKey()
  String SubscriptionIds;

  @JsonKey()
  bool Delete;

  @JsonKey()
  bool Approve;

  @JsonKey()
  bool Revert;

  UpdateDeleteSubscription();

  factory UpdateDeleteSubscription.fromJson(Map<String, dynamic> json) =>
      _$UpdateDeleteSubscriptionFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateDeleteSubscriptionToJson(this);
}
