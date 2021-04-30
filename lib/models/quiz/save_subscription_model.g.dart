// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_subscription_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveSubscriptionModel _$SaveSubscriptionModelFromJson(
    Map<String, dynamic> json) {
  return SaveSubscriptionModel()
    ..userEntity = json['userEntity'] == null
        ? null
        : UserEntityCopy.fromJson(json['userEntity'] as Map<String, dynamic>)
    ..Token = json['Token'] as String
    ..subscriptions = (json['subscriptions'] as List)
        ?.map((e) => e == null
            ? null
            : SubscriptionDetailModel.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$SaveSubscriptionModelToJson(
        SaveSubscriptionModel instance) =>
    <String, dynamic>{
      'userEntity': instance.userEntity,
      'Token': instance.Token,
      'subscriptions': instance.subscriptions,
    };
