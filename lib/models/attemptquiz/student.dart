import 'package:json_annotation/json_annotation.dart';

part 'student.g.dart';

@JsonSerializable()
class Student {
  bool checked;
  @JsonKey()
  int UserId;
  @JsonKey()
  String UserName;
  @JsonKey()
  String FirstName;
  @JsonKey()
  String LastName;
  @JsonKey()
  String Email;
  @JsonKey()
  String Status;
  @JsonKey()
  String FbUserId;

  Student();

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);

  Map<String, dynamic> toJson() => _$StudentToJson(this);
}
