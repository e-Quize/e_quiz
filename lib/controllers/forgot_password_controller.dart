  import 'package:e_quiz/controllers/api_controller.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/models/common/validity_model.dart';
import 'package:e_quiz/models/user/user_model.dart';
import 'package:e_quiz/models/user/user_validation.dart';
import 'package:get/get.dart';
import 'package:e_quiz/utils/widgetproperties.dart';

class ForgotPasswordController extends GetxController {
  var validityEmail = ValidityModel();
  var validityUserName = ValidityModel();

  var apiController = ApiController();
  var resultUser = new Result().obs;

  checkEmail(String value) {
    validityEmail = UserValidation.validateUserEmail(value);
    // updateUserBuilder();
  }

  checkUserName(String value) {
    validityUserName = UserValidation.validateUsername(value);
    // updateUserBuilder();
  }

  updateUserBuilder() {
    update();
  }

  bool checkForgotPasswordValidation(UserEntity userEntity) {
    validityEmail = UserValidation.validateUserEmail(userEntity.Email);
    validityUserName = UserValidation.validateUsername(userEntity.UserName);
    if (validityEmail.valid && validityUserName.valid) {
      return true;
    } else
      return false;
  }

  Future<Result> forgotPassword(UserEntity userEntity) async {
    WidgetProperties.showLoader();
    Result forgotPasswordResult =
        await apiController.forgotPasswordFromApi(userEntity);
    updateUser(forgotPasswordResult);
    WidgetProperties.closeLoader();
    return forgotPasswordResult;
  }

  updateUser(Result result) {
    this.resultUser.value = result;
  }
}
