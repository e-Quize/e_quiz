
import 'package:e_quiz/models/common/base_model.dart';
import 'package:e_quiz/models/user/user_entity_copy.dart';
import 'package:json_annotation/json_annotation.dart';

import 'sync_offline_quiz_model.dart';

part 'sync_offline_quiz.g.dart';

@JsonSerializable()
class SyncOffliveQuiz {
  @JsonKey()
  UserEntityCopy userEntity;
  @JsonKey()
  List<SyncOffliveQuizVM> Records;

  SyncOffliveQuiz();
  factory SyncOffliveQuiz.fromJson(Map<String, dynamic> json) =>
      _$SyncOffliveQuizFromJson(json);
  Map<String, dynamic> toJson() => _$SyncOffliveQuizToJson(this);
}
