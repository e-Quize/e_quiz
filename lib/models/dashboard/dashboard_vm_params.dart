import 'package:e_quiz/models/user/user_entity_copy.dart';
import 'package:e_quiz/models/user/user_model.dart';
import 'package:e_quiz/models/common/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dashboard_vm_params.g.dart';

@JsonSerializable()
class DashboardVMParams extends BaseModel {
  DashboardVMParams();
  factory DashboardVMParams.fromJson(Map<String, dynamic> json) =>
      _$DashboardVMParamsFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardVMParamsToJson(this);
}
