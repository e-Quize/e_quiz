import 'package:e_quiz/models/common/base_model.dart';
import 'package:e_quiz/models/user/user_entity_copy.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification_model.g.dart';

@JsonSerializable()
class NotificationModel extends BaseModel {

  @JsonKey()
  int Id;
  @JsonKey()
  bool IsDeleted;
  @JsonKey()
  String Type;
  @JsonKey()
  String Notification;

  @JsonKey()
  int NotificationQuizId;
  @JsonKey()
  String Name;
  @JsonKey()
  bool IsRead;

  NotificationModel();

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}
