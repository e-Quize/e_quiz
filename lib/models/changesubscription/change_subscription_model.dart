import 'package:e_quiz/models/changesubscription/save_model_change.dart';
import 'package:json_annotation/json_annotation.dart';

part 'change_subscription_model.g.dart';

@JsonSerializable()
class ChangeSubscriptionModel {

  @JsonKey()
  int ResponseId;
  @JsonKey()
  String ResponseMessage;
  @JsonKey()
  List<SaveModelChange> dt;

  ChangeSubscriptionModel();

  factory ChangeSubscriptionModel.fromJson(Map<String, dynamic> json) =>
      _$ChangeSubscriptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChangeSubscriptionModelToJson(this);
}