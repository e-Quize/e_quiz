import 'package:json_annotation/json_annotation.dart';

part 'general_settings_vm.g.dart';

@JsonSerializable()
class GeneralSettingsVM {
  @JsonKey()
  bool isMobileConnect = true;

  GeneralSettingsVM();

  factory GeneralSettingsVM.fromJson(Map<String, dynamic> json) =>
      _$GeneralSettingsVMFromJson(json);

  Map<String, dynamic> toJson() => _$GeneralSettingsVMToJson(this);
}
