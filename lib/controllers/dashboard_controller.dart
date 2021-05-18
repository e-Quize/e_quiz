import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:e_quiz/common/exception_manager/exception_codes_messages.dart';
import 'package:e_quiz/common/exception_manager/exception_handler.dart';
import 'package:e_quiz/controllers/api_controller.dart';
import 'package:e_quiz/controllers/quiz_controller.dart';
import 'package:e_quiz/db/user_crud.dart';
import 'package:e_quiz/models/attemptquiz/attempt_quiz_vm.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/models/push_notification/push_notification_model.dart';
import 'package:e_quiz/models/user/fcm_token_model.dart';
import 'package:e_quiz/service/rest_client_api.dart';
import 'package:e_quiz/utils/widgetproperties.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {

  int currentIndex;
  bool isChecked;
  var apiController = ApiController();
  var resultUser = Result().obs;
  var result = Result().obs;


  @override
  void onInit() {

  }

  Future<Result> logoutUser() async {
    WidgetProperties.showLoader();
    Result logoutUserResult = await apiController.logoutUserFromApi();
    updateResult(logoutUserResult);
    WidgetProperties.closeLoader();
    return logoutUserResult;
  }

  getQuestions(int id) async {
    QuizController _quizController = Get.find<QuizController>();
    var attemptQuizVM = AttemptQuizVm();
    attemptQuizVM.Date = WidgetProperties.utcTimeToString();
    attemptQuizVM.QuizId = id;

    Result res = await getQuetionListForAttempQuizFromApi(attemptQuizVM);
    if (res != null) _quizController.quizQuestionList = res.body;
    if (_quizController.quizQuestionList != null)
      _quizController.quizQuestionList
          .sort((a, b) => a.Serial.compareTo(b.Serial));
    _quizController.updateUserBuilder();
  }

  Future<Result> getQuetionListForAttempQuizFromApi(
      AttemptQuizVm attemptQuizVM) async {
    var res = Result();
    try {
      var dbUser = await UserCrud.getUserCopy();
      attemptQuizVM.userEntity = dbUser;
      final dio = Dio();
      dio.options.headers["Token"] = dbUser.Token;
      RestClientApi api = RestClientApi(dio);
      var response = await api.GetQuetionsForAttempQuiz(attemptQuizVM);
      res.code = Exceptions.SUCCESS;
      res.message = Exceptions.SUCCESS_MESSAGE;
      res.body = response;
    } catch (o) {
      res = ExceptionHandler.onError(o);
    }
    return res;
  }

  DashboardController() {
    this.currentIndex = 0;
    this.isChecked = true;
    // getstudentDashboardData();
  }

  updateUserBuilder() {
    update();
  }

  updateScreenIndex(int currentIndex) async {
    this.currentIndex = currentIndex;
    this.isChecked = true;
    update();
  }

  updateResult(Result result) {
    this.result.value = result;
  }
}
