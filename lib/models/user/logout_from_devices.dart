import 'package:json_annotation/json_annotation.dart';

part 'logout_from_devices.g.dart';

@JsonSerializable()
class LogoutFromDevices {
  @JsonKey()
  int ResponseId;
  @JsonKey()
  String ResponseMessage;

  LogoutFromDevices();

  factory LogoutFromDevices.fromJson(Map<String, dynamic> json) =>
      _$LogoutFromDevicesFromJson(json);

  Map<String, dynamic> toJson() => _$LogoutFromDevicesToJson(this);
}
