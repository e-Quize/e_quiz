import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:e_quiz/common/exception_manager/exception_codes_messages.dart';
import 'package:e_quiz/common/exception_manager/exception_handler.dart';
import 'package:e_quiz/models/dashboard/competition_quiz_result_model.dart';
import 'package:e_quiz/db/user_crud.dart';
import 'package:e_quiz/models/attemptquiz/attempt_quiz_vm.dart';
import 'package:e_quiz/models/attemptquiz/student_list_parameter_model.dart';
import 'package:e_quiz/models/common/general_settings_vm.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/models/dashboard/dashboard_vm_params.dart';
import 'package:e_quiz/models/notification/notification_send_vm.dart';
import 'package:e_quiz/models/quiz/quiz_generation_vm.dart';
import 'package:e_quiz/models/quiz/save_subscription_model.dart';
import 'package:e_quiz/models/quiz/subject_model_params.dart';
import 'package:e_quiz/models/splash/mobile_connect_copy.dart';
import 'package:e_quiz/models/subscription/update_delete_subscription.dart';
import 'package:e_quiz/models/user/common_result_copy.dart';
import 'package:e_quiz/models/user/countries_vm_model.dart';
import 'package:e_quiz/models/user/refresh_token.dart';
import 'package:e_quiz/models/user/user_entity_copy.dart';
import 'package:e_quiz/models/user/user_model.dart';
import 'package:e_quiz/service/rest_client_api.dart';
import 'package:get/get.dart';

import '../models/attemptquiz/attempted_quiz_model.dart';

class ApiController extends GetxController {
  Future<Result> validateUserCredentialsFromApi(UserEntity userEntity) async {
    var res = Result();
    var userEntityCopy = UserEntityCopy();
    try {
      RestClientApi api = RestClientApi(Dio());
      var response = await api.ValidateUserCredentials(userEntity);
      userEntityCopy.Token = response.Token;
      userEntityCopy.PrivilegesString = response.PrivilegesString;
      userEntityCopy.UserName = response.UserName;
      userEntityCopy.SubjectIdsString = response.SubjectIdsString;
      userEntityCopy.FbUserId = response.FbUserId;
      userEntityCopy.DeviceFCMToken = response.DeviceFCMToken;
      await UserCrud.insertUser(userEntityCopy);
      res.body = response;
    } catch (o) {
      res = ExceptionHandler.onError(o);
    }
    return res;
  }

  Future<Result> registerUserFromApi(UserEntity userEntity) async {
    var res = Result();
    try {
      final dio = Dio();
      RestClientApi api = RestClientApi(dio);
      var response = await api.RegisterUser(userEntity);
      res.message = response.Message;
      res.body = response;
    } catch (o) {
      res = ExceptionHandler.onError(o);
    }
    return res;
  }

  Future<Result> sendNotificationFromApi(NotificationVM notificationVM) async {
    var res = Result();
    try {
      UserEntityCopy userEntityCopy = await UserCrud.getUserCopy();
      final dio = Dio();
      dio.options.headers["Token"] = userEntityCopy.Token;
      RestClientApi api = RestClientApi(dio);
      var response = await api.SendNotification(notificationVM);
      res.body = response;
    } catch (o) {
      res = ExceptionHandler.onError(o);
    }
    return res;
  }

  Future<Result> getCountryTimeZoneListFromApi(CountryVm countryVm) async {
    var res = Result();
    var response;
    try {
      final dio = Dio();
      RestClientApi api = RestClientApi(dio);
      response = await api.GetCountryTimeZones(countryVm);
      res.code = Exceptions.SUCCESS;
      res.body = response;
    } catch (o) {
      res = ExceptionHandler.onError(o);
    }
    return res;
  }

  Future<Result> getPaymentHistoryFromApi() async {
    var res = Result();
    var response;
    try {
      UserEntityCopy userEntityCopy = await UserCrud.getUserCopy();
      final dio = Dio();
      dio.options.headers["Token"] = userEntityCopy.Token;
      RestClientApi api = RestClientApi(dio);
      response = await api.LoadAllUser(userEntityCopy);
      res.code = Exceptions.SUCCESS;
      res.body = response;
    } catch (o) {
      res = ExceptionHandler.onError(o);
    }
    return res;
  }

  Future<Result> getNotificationInitFromApi() async {
    var res = Result();
    var response;
    try {
      UserEntityCopy userEntityCopy = await UserCrud.getUserCopy();
      final dio = Dio();
      dio.options.headers["Token"] = userEntityCopy.Token;
      RestClientApi api = RestClientApi(dio);
      response = await api.NotificationInit(userEntityCopy);
      res.code = Exceptions.SUCCESS;
      res.body = response;
    } catch (o) {
      res = ExceptionHandler.onError(o);
    }
    return res;
  }

  Future<Result> getAllAttemptedQuizesFromApi() async {
    var res = Result();
    var userEntity = UserEntity();
    var response;
    try {
      UserEntityCopy userEntityCopy = await UserCrud.getUserCopy();
      final dio = Dio();
      dio.options.headers["Token"] = userEntityCopy.Token;
      userEntity.Token = userEntityCopy.Token;
      RestClientApi api = RestClientApi(dio);
      response = await api.GetAllAttemptedQuizes(userEntity);
      res.code = Exceptions.SUCCESS;
      res.body = response;
    } catch (o) {
      res = ExceptionHandler.onError(o);
    }
    return res;
  }

  Future<Result> getAdminsForChatFromApi() async {
    var res = Result();
    var userEntity = UserEntity();
    var response;
    try {
      UserEntityCopy userEntityCopy = await UserCrud.getUserCopy();
      final dio = Dio();
      dio.options.headers["Token"] = userEntityCopy.Token;
      userEntity.Token = userEntityCopy.Token;
      RestClientApi api = RestClientApi(dio);
      response = await api.GetAdminsForChat(userEntity);
      res.code = Exceptions.SUCCESS;
      res.body = response;
    } catch (o) {
      res = ExceptionHandler.onError(o);
    }
    return res;
  }

  Future<Result> getQuizPercentagesForGraphFromApi() async {
    var res = Result();
    var userEntity = UserEntity();
    var response;
    try {
      UserEntityCopy userEntityCopy = await UserCrud.getUserCopy();
      final dio = Dio();
      dio.options.headers["Token"] = userEntityCopy.Token;
      userEntity.Token = userEntityCopy.Token;
      RestClientApi api = RestClientApi(dio);
      response = await api.GetQuizPercentagesForGraph(userEntity);
      res.code = Exceptions.SUCCESS;
      res.body = response;
    } catch (o) {
      res = ExceptionHandler.onError(o);
    }
    return res;
  }

  Future<Result> getChaptersPercentageForPieFromApi(
      UserEntity userEntity) async {
    var res = Result();
    var response;
    try {
      UserEntityCopy userEntityCopy = await UserCrud.getUserCopy();
      final dio = Dio();
      dio.options.headers["Token"] = userEntityCopy.Token;
      userEntity.Token = userEntityCopy.Token;
      RestClientApi api = RestClientApi(dio);
      response = await api.GetChaptersPercentageForPie(userEntity);
      res.code = Exceptions.SUCCESS;
      res.body = response;
    } catch (o) {
      res = ExceptionHandler.onError(o);
    }
    return res;
  }

  Future<Result> getQuizDetailForPieFromApi(
      CompetitionQuizResultModel competitionQuizResultModel) async {
    var res = Result();

    var response;
    try {
      UserEntityCopy userEntityCopy = await UserCrud.getUserCopy();
      final dio = Dio();
      dio.options.headers["Token"] = userEntityCopy.Token;
      competitionQuizResultModel.userEntity = userEntityCopy;
      RestClientApi api = RestClientApi(dio);
      response = await api.GetQuizDetail(competitionQuizResultModel);
      res.code = Exceptions.SUCCESS;
      res.body = response;
    } catch (o) {
      res = ExceptionHandler.onError(o);
    }
    return res;
  }

  Future<Result> notificationIsReadFromApi() async {
    var res = Result();
    var commonResultCopy = CommonResultCopy();
    var userEntity = UserEntity();
    var response;
    try {
      UserEntityCopy userEntityCopy = await UserCrud.getUserCopy();
      final dio = Dio();
      dio.options.headers["Token"] = userEntityCopy.Token;
      userEntity.Token = userEntityCopy.Token;
      RestClientApi api = RestClientApi(dio);
      response = await api.NotificationIsRead(userEntity);
      commonResultCopy.ResponseId = response.ResponseId;
      await UserCrud.insertCommonResultCopy(commonResultCopy);
      res.code = Exceptions.SUCCESS;
      res.body = response;
    } catch (o) {
      res = ExceptionHandler.onError(o);
    }
    return res;
  }

  Future<Result> getSiteSettingFromApi() async {
    var res = Result();
    var mobileConnectResponseCopy = MobileConnectResponseCopy();
    var response;
    try {
      final dio = Dio();
      RestClientApi api = RestClientApi(dio);
      response = await api.GetSiteSettings(GeneralSettingsVM());
      mobileConnectResponseCopy.BankAccountInfo = response.BankAccountInfo;
      mobileConnectResponseCopy.SupportEmailAddress =
          response.SupportEmailAddress;
      mobileConnectResponseCopy.ApplicationName = response.ApplicationName;
      mobileConnectResponseCopy.FacebookURL = response.FacebookURL;
      mobileConnectResponseCopy.TwitterURL = response.TwitterURL;
      mobileConnectResponseCopy.LinkedInURL = response.LinkedInURL;
      if (response != null) UserCrud.insertSettings(mobileConnectResponseCopy);
      res.code = Exceptions.SUCCESS;
      res.message = "Success";
      res.body = response;
    } catch (o) {
      res = ExceptionHandler.onError(o);
    }
    return res;
  }

  Future<Result> getCountryListFromApi() async {
    var res = Result();
    var userEntity = UserEntity();
    try {
      final dio = Dio();
      RestClientApi api = RestClientApi(dio);
      var response = await api.getCountriesList(userEntity);
      res.code = Exceptions.SUCCESS;
      res.message = Exceptions.SUCCESS_MESSAGE;
      res.body = response;
    } catch (o) {
      res = ExceptionHandler.onError(o);
    }
    return res;
  }

  Future<Result> loadSubjectListFromApi() async {
    var res = Result();
    try {
      UserEntityCopy userEntityCopy = await UserCrud.getUserCopy();
      final dio = Dio();
      dio.options.headers["Token"] = userEntityCopy.Token;
      RestClientApi api = RestClientApi(dio);
      var response = await api.LoadSubjects(userEntityCopy);
      res.code = Exceptions.SUCCESS;
      res.message = Exceptions.SUCCESS_MESSAGE;
      res.body = response;
    } catch (o) {
      res = ExceptionHandler.onError(o);
    }
    return res;
  }

  Future<Result> getSubjectSubscriptionDetailFromApi(
      UserEntity userEntity) async {
    var res = Result();
    try {
      UserEntityCopy userEntityCopy = await UserCrud.getUserCopy();
      final dio = Dio();
      dio.options.headers["Token"] = userEntityCopy.Token;
      userEntity.Token = userEntityCopy.Token;
      RestClientApi api = RestClientApi(dio);
      var response = await api.GetSubjectSubscriptionDetail(userEntity);
      res.code = Exceptions.SUCCESS;
      res.message = Exceptions.SUCCESS_MESSAGE;
      res.body = response;
    } catch (o) {
      res = ExceptionHandler.onError(o);
    }
    return res;
  }

  Future<Result> updateUserProfileFromApi(UserEntity userEntity) async {
    var res = Result();
    try {
      var userEntityCopy = await UserCrud.getUserCopy();
      final dio = Dio();
      dio.options.headers["Token"] = userEntityCopy.Token;
      RestClientApi api = RestClientApi(dio);
      var response = await api.UpdateUserProfile(userEntity);
      res.message = response.ResponseMessage;
      res.code = response.ResponseId;
      res.body = response;
    } catch (o) {
      res = ExceptionHandler.onError(o);
    }

    return res;
  }

  Future<Result> loadStudentListFromApi(
      StudentListParameterModel studentListParameterModel) async {
    var res = Result();
    try {
      var userEntityCopy = await UserCrud.getUserCopy();
      final dio = Dio();
      dio.options.headers["Token"] = userEntityCopy.Token;
      studentListParameterModel.Token = userEntityCopy.Token;
      RestClientApi api = RestClientApi(dio);
      var response = await api.LoadStudentsForQuiz(studentListParameterModel);
      // res.code = Exceptions.SUCCESS;
      // res.message = Exceptions.SUCCESS_MESSAGE;
      res.body = response;
    } catch (o) {
      res = ExceptionHandler.onError(o);
    }
    return res;
  }

  Future<Result> loadActiveSubjectListForQuizFromApi() async {
    var res = Result();
    var userEntity = UserEntity();
    try {
      UserEntityCopy userEntityCopy = await UserCrud.getUserCopy();
      print(userEntityCopy.Token);
      final dio = Dio();
      dio.options.headers["Token"] = userEntityCopy.Token;
      RestClientApi api = RestClientApi(dio);
      var response = await api.LoadActiveSubjectsForQuiz(userEntityCopy);
      res.code = Exceptions.SUCCESS;
      res.message = Exceptions.SUCCESS_MESSAGE;
      res.body = response;
    } catch (o) {
      res = ExceptionHandler.onError(o);
    }
    return res;
  }

  Future<Result> loadActiveChapterListBySubjectIdForQuizFromApi(
      SubjectModelParams subjectModelParams) async {
    var res = Result();
    try {
      UserEntityCopy userEntityCopy = await UserCrud.getUserCopy();
      final dio = Dio();
      dio.options.headers["Token"] = userEntityCopy.Token;
      RestClientApi api = RestClientApi(dio);
      var response =
          await api.LoadActiveChaptersBySubjectIdForQuiz(subjectModelParams);
      res.code = Exceptions.SUCCESS;
      res.message = Exceptions.SUCCESS_MESSAGE;
      res.body = response;
    } catch (o) {
      res = ExceptionHandler.onError(o);
    }
    return res;
  }

  Future<Result> subjectSubscriptionFromApi(UserEntity userEntity) async {
    var res = Result();
    try {
      UserEntityCopy userEntityCopy = await UserCrud.getUserCopy();
      userEntity.Token = userEntityCopy.Token;
      final dio = Dio();
      dio.options.headers["Token"] = userEntityCopy.Token;
      RestClientApi api = RestClientApi(dio);
      var response = await api.SubjectsSubscription(userEntity);
      res.body = response;
    } catch (o) {
      res = ExceptionHandler.onError(o);
    }
    return res;
  }

  Future<Result> forgotPasswordFromApi(UserEntity userEntity) async {
    var res = Result();
    try {
      final dio = Dio();
      RestClientApi api = RestClientApi(dio);
      var response = await api.ForgotPassword(userEntity);
      res.body = response;
    } catch (o) {
      res = ExceptionHandler.onError(o);
    }
    return res;
  }

  Future<Result> refreshTokenFromApi() async {
    var res = Result();
    var refreshToken = RefreshToken();
    try {
      UserEntityCopy userEntityCopy = await UserCrud.getUserCopy();
      final dio = Dio();
      dio.options.headers["Token"] = userEntityCopy.Token;
      RestClientApi api = RestClientApi(dio);
      var response = await api.RefreshToken(userEntityCopy);
      refreshToken.RefreshOldToken = response.Token;
      await UserCrud.insertRefreshToken(refreshToken);
      res.code = Exceptions.SUCCESS;
      res.message = Exceptions.SUCCESS_MESSAGE;
      res.body = response;
    } catch (o) {
      res = ExceptionHandler.onError(o);
    }
    return res;
  }

  Future<Result> generateQuizFromApi(QuizGenerationVM quizGenerationVM) async {
    var res = Result();
    try {
      UserEntityCopy userEntityCopy = await UserCrud.getUserCopy();
      quizGenerationVM.userEntity = userEntityCopy;
      final dio = Dio();
      dio.options.headers["Token"] = userEntityCopy.Token;
      RestClientApi api = RestClientApi(dio);
      var response = await api.GenerateQuiz(quizGenerationVM);
      res.code = Exceptions.SUCCESS;
      res.message = Exceptions.SUCCESS_MESSAGE;
      res.body = response;
    } catch (o) {
      res = ExceptionHandler.onError(o);
    }
    return res;
  }

  Future<Result> getQuizDetailListFromApi(
      AttemptedQuizModel attemptedQuizModel) async {
    var res = Result();
    try {
      var dbUser = await UserCrud.getUserCopy();
      attemptedQuizModel.userEntity = dbUser;
      final dio = Dio();
      dio.options.headers["Token"] = dbUser.Token;
      RestClientApi api = RestClientApi(dio);
      var response = await api.getQuizDetail(attemptedQuizModel);
      res.code = Exceptions.SUCCESS;
      res.message = Exceptions.SUCCESS_MESSAGE;
      res.body = response;
    } catch (o) {
      res = ExceptionHandler.onError(o);
    }
    return res;
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

  Future<Result> updateQuizAnswerFromApi(AttemptQuizVm attemptQuizVM) async {
    var res = Result();
    try {
      UserEntityCopy userEntityCopy = await UserCrud.getUserCopy();
      attemptQuizVM.userEntity = userEntityCopy;
      final dio = Dio();
      dio.options.headers["Token"] = userEntityCopy.Token;
      RestClientApi api = RestClientApi(dio);
      var response = await api.UpdateQuizAnswer(attemptQuizVM);
      //res.code = Exceptions.SUCCESS;
      // res.message = Exceptions.SUCCESS_MESSAGE;
      res.body = response;
    } catch (o) {
      res = ExceptionHandler.onError(o);
    }
    return res;
  }

  Future<Result> updateDashboardDataFromApi() async {
    var res = Result();
    try {
      UserEntityCopy userEntityCopy = await UserCrud.getUserCopy();
      print(userEntityCopy.Token);
      final dio = Dio();
      dio.options.headers["Token"] = userEntityCopy.Token;
      RestClientApi api = RestClientApi(dio);
      var response = await api.UpdateDashboardData(userEntityCopy);
      res.body = response;
    } catch (o) {
      res = ExceptionHandler.onError(o);
    }
    return res;
  }

  Future<Result> loadSlabListFromApi() async {
    var res = Result();
    try {
      UserEntityCopy userEntityCopy = await UserCrud.getUserCopy();
      final dio = Dio();
      dio.options.headers["Token"] = userEntityCopy.Token;
      RestClientApi api = RestClientApi(dio);
      var response = await api.LoadSlabs(userEntityCopy);
      res.code = Exceptions.SUCCESS;
      res.message = Exceptions.SUCCESS_MESSAGE;
      res.body = response;
    } catch (o) {
      res = ExceptionHandler.onError(o);
    }
    return res;
  }

  Future<Result> getSubscriptionListFromApi(
      SaveSubscriptionModel saveSubscriptionModel) async {
    var res = Result();
    try {
      UserEntityCopy userEntityCopy = await UserCrud.getUserCopy();
      final dio = Dio();
      dio.options.headers["Token"] = userEntityCopy.Token;
      RestClientApi api = RestClientApi(dio);
      var response = await api.Subscriptions(saveSubscriptionModel);
      res.code = response.ResponseId;
      res.message = response.ResponseMessage;
      res.body = response;
    } catch (o) {
      res = ExceptionHandler.onError(o);
    }
    return res;
  }

  Future<Result> saveSubscriptionsFromApi(
      SaveSubscriptionModel saveSubscriptionModel) async {
    var res = Result();
    try {
      UserEntityCopy userEntityCopy = await UserCrud.getUserCopy();
      final dio = Dio();
      dio.options.headers["Token"] = userEntityCopy.Token;
      RestClientApi api = RestClientApi(dio);
      var response = await api.SaveSubscriptions(saveSubscriptionModel);
      res.code = response.ResponseId;
      res.message = response.ResponseMessage;
      res.body = response;
    } catch (o) {
      res = ExceptionHandler.onError(o);
    }
    return res;
  }

  Future<Result> getUserProfileFromApi() async {
    var res = Result();
    try {
      UserEntityCopy userEntityCopy = await UserCrud.getUserCopy();
      final dio = Dio();
      dio.options.headers["Token"] = userEntityCopy.Token;
      RestClientApi api = RestClientApi(dio);
      var response = await api.GetUserProfile(userEntityCopy);
      res.code = Exceptions.SUCCESS;
      res.message = Exceptions.SUCCESS_MESSAGE;
      res.body = response;
    } catch (o) {
      res = ExceptionHandler.onError(o);
    }
    return res;
  }

  Future<Result> getUserSubscriptionsFromApi() async {
    var res = Result();
    try {
      UserEntityCopy userEntityCopy = await UserCrud.getUserCopy();
      final dio = Dio();
      dio.options.headers["Token"] = userEntityCopy.Token;
      RestClientApi api = RestClientApi(dio);
      var response = await api.GetUserSubscriptions(userEntityCopy);
      // res.code = "response.ResponseId";
      // res.message = response.ResponseMessage;
      res.body = response;
    } catch (o) {
      res = ExceptionHandler.onError(o);
    }
    return res;
  }

  Future<Result> logoutUserFromApi() async {
    var res = Result();
    try {
      UserEntityCopy userEntityCopy = await UserCrud.getUserCopy();
      final dio = Dio();
      dio.options.headers["Token"] = userEntityCopy.Token;
      RestClientApi api = RestClientApi(dio);
      var response = await api.LogOutLog(userEntityCopy);
      await UserCrud.logoutUser();
      res.code = Exceptions.SUCCESS;
      res.message = Exceptions.SUCCESS_MESSAGE;
      res.body = response;
    } catch (o) {
      res = ExceptionHandler.onError(o);
    }
    return res;
  }

  Future<Result> logoutUserFromAllDevicesFromApi() async {
    var res = Result();
    try {
      UserEntityCopy userEntityCopy = await UserCrud.getUserCopy();
      final dio = Dio();
      dio.options.headers["Token"] = userEntityCopy.Token;
      RestClientApi api = RestClientApi(dio);
      var response = await api.LogOutFromAllDevices(userEntityCopy);
      await UserCrud.logoutUser();
      res.code = Exceptions.SUCCESS;
      res.message = Exceptions.SUCCESS_MESSAGE;
      res.body = response;
    } catch (o) {
      res = ExceptionHandler.onError(o);
    }
    return res;
  }

  Future<Result> getStudentDashboardDataFromApi() async {
    var dashboardVMParams = DashboardVMParams();
    var res = Result();
    var dbUser = await UserCrud.getUserCopy();
    dashboardVMParams.userEntity = dbUser;
    final dio = Dio();
    dio.options.headers["Token"] = dbUser.Token;
    try {
      RestClientApi api = RestClientApi(dio);
      var response = await api.StudentDashboard(dashboardVMParams);
      res.body = response;
    } catch (o) {
      res = ExceptionHandler.onError(o);
      res.message = res.message;
    }
    return res;
  }

  Future<Result> approveRevertUserSubscriptionFromApi(
      UpdateDeleteSubscription updateDeleteSubscription) async {
    var res = Result();
    try {
      UserEntityCopy userEntityCopy = await UserCrud.getUserCopy();
      final dio = Dio();
      // updateDeleteSubscription.userEntity.Token = userEntityCopy.Token;
      dio.options.headers["Token"] = userEntityCopy.Token;
      RestClientApi api = RestClientApi(dio);
      var response =
          await api.ApproveRevertUserSubscription(updateDeleteSubscription);
      res.code = response.ResponseId;
      res.message = response.ResponseMessage;
      res.body = response;
    } catch (o) {
      res = ExceptionHandler.onError(o);
    }
    return res;
  }
}
