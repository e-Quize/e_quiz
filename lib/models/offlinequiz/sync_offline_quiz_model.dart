import 'package:e_quiz/models/attemptquiz/quiz_question.dart';
import 'package:e_quiz/models/common/base_model.dart';
import 'package:e_quiz/models/user/user_entity_copy.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sync_offline_quiz_model.g.dart';

@JsonSerializable()
class SyncOffliveQuizVM {
  @JsonKey()
  List<QuizQuestion> Questions;

  SyncOffliveQuizVM();
  factory SyncOffliveQuizVM.fromJson(Map<String, dynamic> json) =>
      _$SyncOffliveQuizVMFromJson(json);
  Map<String, dynamic> toJson() => _$SyncOffliveQuizVMToJson(this);
}
