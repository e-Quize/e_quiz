import 'package:e_quiz/models/common/base_model.dart';
import 'package:e_quiz/models/subscription/subscription_detail_model.dart';
import 'package:e_quiz/models/user/user_entity_copy.dart';
import 'package:json_annotation/json_annotation.dart';

part 'save_subscription_model.g.dart';

@JsonSerializable()
class SaveSubscriptionModel extends BaseModel {
  @JsonKey()
  List<SubscriptionDetailModel> subscriptions;

  SaveSubscriptionModel();

  factory SaveSubscriptionModel.fromJson(Map<String, dynamic> json) =>
      _$SaveSubscriptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$SaveSubscriptionModelToJson(this);
}
