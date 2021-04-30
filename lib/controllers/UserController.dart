import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/models/common/validity_model.dart';
import 'package:e_quiz/models/user/user_validation.dart';
import 'package:get/get.dart';

class UserController extends GetxController
{

  var userResult = Result().obs;

  var validityFirstName = ValidityModel();
  var validityLastName = ValidityModel();
  var validityUserName = ValidityModel();
  var validityCountry = ValidityModel();
  var validityPhone = ValidityModel();
  var validityEmail = ValidityModel();
  var validityPassword = ValidityModel();
  var validityDOB = ValidityModel();

  checkFirstName(String value) {
    validityFirstName = UserValidation.validateFirstName(value);
    updateUserBuilder();
  }
  checkLastName(String value) {
    validityLastName = UserValidation.validateLastName(value);
    updateUserBuilder();
  }
  checkUsername(String value) {
    validityUserName = UserValidation.validateUsername(value);
    updateUserBuilder();
  }
  checkPassword(String value) {
    validityPassword = UserValidation.validateUserPassword(value);
    updateUserBuilder();
  }
  checkEmail(String value) {
    validityEmail = UserValidation.validateUserEmail(value);
    updateUserBuilder();
  }
  checkPhone(String value) {
    validityPhone = UserValidation.validatePhone(value);
    updateUserBuilder();
  }
  checkCountry(String value) {
    validityCountry = UserValidation.validateCountry(value);
    updateUserBuilder();
  }
  checkDOB(String value) {
    validityCountry = UserValidation.validateUserPassword(value);
    updateUserBuilder();
  }

  updateUserBuilder() {
    update();
  }

}