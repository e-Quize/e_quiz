import 'package:get/get.dart';
import 'package:e_quiz/controllers/api_controller.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/models/attemptquiz/attempt_quiz_vm.dart';
import 'package:e_quiz/models/attemptquiz/attempted_quiz_model.dart';

class HistoryController extends GetxController {

  var apiController = ApiController();
  var resultUser = Result().obs;
  var result = Result().obs;
  List<AttemptedQuizModel> attemptedQuizModelList;
  int selectedReAtemptedQuestionId;

  updateHistoryBuilder() {
    update();
  }

  updateResult(Result result) {
    this.result.value = result;
  }
  Future<Result> getQuetionsForReAttempQuiz(AttemptQuizVm attemptQuizVM) async {
    Result questionResultForAttempt =
    await apiController.getQuetionListForAttempQuizFromApi(attemptQuizVM);
    updateResult(questionResultForAttempt);
    return questionResultForAttempt;
  }
  Future<Result> getAllAttemptedQuiz() async {
    Result attemptedQuizDataResult =
        await apiController.getAllAttemptedQuizesFromApi();
    updateResult(attemptedQuizDataResult);
    return attemptedQuizDataResult;
  }
}
