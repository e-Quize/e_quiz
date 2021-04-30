import 'package:json_annotation/json_annotation.dart';

part 'fcm_token_model.g.dart';

@JsonSerializable()
class FcmTokenModel {
  @JsonKey()
  int FCMQuizId;
  @JsonKey()
  int Notificationtype;

  FcmTokenModel();

  factory FcmTokenModel.fromJson(Map<String, dynamic> json) =>
      _$FcmTokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$FcmTokenModelToJson(this);
}
