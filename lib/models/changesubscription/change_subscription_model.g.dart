// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_subscription_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeSubscriptionModel _$ChangeSubscriptionModelFromJson(
    Map<String, dynamic> json) {
  return ChangeSubscriptionModel()
    ..ResponseId = json['ResponseId'] as int
    ..ResponseMessage = json['ResponseMessage'] as String
    ..dt = (json['dt'] as List)
        ?.map((e) => e == null
            ? null
            : SaveModelChange.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ChangeSubscriptionModelToJson(
        ChangeSubscriptionModel instance) =>
    <String, dynamic>{
      'ResponseId': instance.ResponseId,
      'ResponseMessage': instance.ResponseMessage,
      'dt': instance.dt,
    };
