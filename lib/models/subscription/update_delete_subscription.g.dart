// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_delete_subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateDeleteSubscription _$UpdateDeleteSubscriptionFromJson(
    Map<String, dynamic> json) {
  return UpdateDeleteSubscription()
    ..userEntity = json['userEntity'] == null
        ? null
        : UserEntityCopy.fromJson(json['userEntity'] as Map<String, dynamic>)
    ..Token = json['Token'] as String
    ..SubscriptionIds = json['SubscriptionIds'] as String
    ..Delete = json['Delete'] as bool
    ..Approve = json['Approve'] as bool
    ..Revert = json['Revert'] as bool;
}

Map<String, dynamic> _$UpdateDeleteSubscriptionToJson(
        UpdateDeleteSubscription instance) =>
    <String, dynamic>{
      'userEntity': instance.userEntity,
      'Token': instance.Token,
      'SubscriptionIds': instance.SubscriptionIds,
      'Delete': instance.Delete,
      'Approve': instance.Approve,
      'Revert': instance.Revert,
    };
