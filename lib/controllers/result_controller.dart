import 'package:e_quiz/common/exception_manager/generic_result.dart';
import 'package:e_quiz/controllers/api_controller.dart';
import 'package:e_quiz/models/attemptquiz/quiz_question.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/models/dashboard/competition_quiz_result_model.dart';
import 'package:get/get.dart';

import 'api_controller.dart';

class ResultController extends GetxController {
  List<QuizQuestion> quizQuestionList;
  List<QuizQuestion> skippedQuestionObjectList;
  ApiController apiController = ApiController();
  var result = Result().obs;

  Future<Result> getQuizDetailList(
      CompetitionQuizResultModel competitionQuizResultModel) async {
    Result listQuizDetailResult = await apiController
        .getQuizDetailForPieFromApi(competitionQuizResultModel);
    updateResult(listQuizDetailResult);
    return listQuizDetailResult;
  }

  ini() {
    quizQuestionList = [];
    skippedQuestionObjectList = [];
  }

  updateResult(Result result) {
    this.result.value = result;
  }

  updateBuilder() {
    update();
  }
}
