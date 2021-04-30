import 'package:e_quiz/common/exception_manager/generic_result.dart';
import 'package:e_quiz/controllers/api_controller.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  var apiController = ApiController();
  var result = Result().obs;
  var resultUser = new Result().obs;

  Future<Result> notificationIsRead() async {
    Result notificationIsReadResult =
        await apiController.notificationIsReadFromApi();
    updateResult(notificationIsReadResult);
    return notificationIsReadResult;
  }

  Future<Result> getSiteSettings() async {
    // WidgetProperties.showLoader();
    Result settingResponseResult = await apiController.getSiteSettingFromApi();
    updateResult(settingResponseResult);
    // WidgetProperties.closeLoader();
    return settingResponseResult;
  }

  updateUser(Result result) {
    this.resultUser.value = result;
  }

  updateResult(Result result) {
    this.result.value = result;
  }

  Future<Result> refreshToken() async {
    updateUser(Generic.waitResult());
    Result refreshTokenResult = await apiController.refreshTokenFromApi();
    updateUser(refreshTokenResult);
    return refreshTokenResult;
  }
}
