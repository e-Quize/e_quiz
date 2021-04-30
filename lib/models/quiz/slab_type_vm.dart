import 'package:e_quiz/models/common/base_model.dart';
import 'package:e_quiz/models/user/user_entity_copy.dart';
import 'package:json_annotation/json_annotation.dart';

part 'slab_type_vm.g.dart';

@JsonSerializable()
class SlabTypeVM extends BaseModel {
  @JsonKey()
  int Id;
  @JsonKey()
  String SlabType;

  SlabTypeVM();

  factory SlabTypeVM.fromJson(Map<String, dynamic> json) =>
      _$SlabTypeVMFromJson(json);

  Map<String, dynamic> toJson() => _$SlabTypeVMToJson(this);
}
