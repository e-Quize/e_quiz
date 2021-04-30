import 'package:e_quiz/models/common/base_model.dart';
import 'package:e_quiz/models/user/user_entity_copy.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification_send_vm.g.dart';

@JsonSerializable()
class NotificationVM extends BaseModel {
  @JsonKey()
  int NotificationTypeId;
  @JsonKey()
  bool IsDeleted;
  @JsonKey()
  String StudentIds;
  @JsonKey()
  String NotificationDesc;
  @JsonKey()
  int NotificationQuizId;
  @JsonKey()
  String Name;
  @JsonKey()
  bool IsRead;

  NotificationVM();

  factory NotificationVM.fromJson(Map<String, dynamic> json) =>
      _$NotificationVMFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationVMToJson(this);
}
