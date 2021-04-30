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
import 'package:e_quiz/singleton_notification.dart';
import 'package:e_quiz/utils/widgetproperties.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {

  int currentIndex;
  bool isChecked;
  var apiController = ApiController();
  var resultUser = Result().obs;
  var result = Result().obs;
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  QuizController _quizController = Get.put(QuizController());

  @override
  void onInit() {
    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
      String aa = message['notification']['body'];
      print("kajsdghfakjshdf" + aa);
      _quizController.ini();
      Map model = jsonDecode(aa);
      var pushNotificationModel = PushNotificationModel.fromJson(model);
      FcmTokenModel fcmTokenModel = FcmTokenModel();
      fcmTokenModel.FCMQuizId = pushNotificationModel.QuizId;
      fcmTokenModel.Notificationtype = pushNotificationModel.NotificationType;
      await UserCrud.insertFcmQuizId(fcmTokenModel);
      print(pushNotificationModel.QuizId.toString());
      _quizController.fcmQuizId = pushNotificationModel.QuizId;
      _quizController.responseId = pushNotificationModel.QuizId;

      NotificationSingleton.instance.notify();
      NotificationSingleton.instance
          .showNotification(pushNotificationModel.Description);
    }, onResume: (Map<String, dynamic> message) async {
      String aa = message['notification']['body'];
      print("kajsdghfakjshdf  Resume" + aa);
      _quizController.ini();
      Map model = jsonDecode(aa);
      var pushNotificationModel = PushNotificationModel.fromJson(model);
      FcmTokenModel fcmTokenModel = FcmTokenModel();
      fcmTokenModel.FCMQuizId = pushNotificationModel.QuizId;
      fcmTokenModel.Notificationtype = pushNotificationModel.NotificationType;
      await UserCrud.insertFcmQuizId(fcmTokenModel);
      print(pushNotificationModel.QuizId.toString());
      _quizController.fcmQuizId = pushNotificationModel.QuizId;
      _quizController.responseId = pushNotificationModel.QuizId;

      NotificationSingleton.instance.notify();
      NotificationSingleton.instance
          .showNotification(pushNotificationModel.Description);
    }, onLaunch: (message) async {
      String aa = message['notification']['body'];
      print("kajsdghfakjshdf  Launch" + aa);
      _quizController.ini();
      Map model = jsonDecode(aa);
      var pushNotificationModel = PushNotificationModel.fromJson(model);
      FcmTokenModel fcmTokenModel = FcmTokenModel();
      fcmTokenModel.FCMQuizId = pushNotificationModel.QuizId;
      fcmTokenModel.Notificationtype = pushNotificationModel.NotificationType;
      await UserCrud.insertFcmQuizId(fcmTokenModel);
      print(pushNotificationModel.QuizId.toString());
      _quizController.fcmQuizId = pushNotificationModel.QuizId;
      _quizController.responseId = pushNotificationModel.QuizId;

      NotificationSingleton.instance.notify();
      NotificationSingleton.instance
          .showNotification(pushNotificationModel.Description);
    });
  }

  Future<Result> logoutUser() async {
    WidgetProperties.showLoader();
    Result logoutUserResult = await apiController.logoutUserFromApi();
    updateResult(logoutUserResult);
    WidgetProperties.closeLoader();
    return logoutUserResult;
  }

  getQuestions(int id) async {
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
