import 'package:e_quiz/common/exception_manager/generic_result.dart';
import 'package:e_quiz/controllers/api_controller.dart';
import 'package:e_quiz/db/init_db.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/models/common/validity_model.dart';

import 'package:e_quiz/models/user/countries_vm_model.dart';
import 'package:e_quiz/models/user/user_model.dart';
import 'package:e_quiz/models/user/user_validation.dart';
import 'package:e_quiz/utils/widgetproperties.dart';
import 'package:e_quiz/models/user/timezone.dart';
import 'package:get/get.dart';

class UserController extends GetxController {


  bool showPassword = false;
  bool isModelValid = false;
  UserEntity userEntity;

  var validityFirstName = ValidityModel();
  var validityLastName = ValidityModel();
  var validityUserName = ValidityModel();
  var validityCountry = ValidityModel();
  var validityPhone = ValidityModel();
  var validityEmail = ValidityModel();
  var validityPassword = ValidityModel();
  var validityDOB = ValidityModel();
  var validityTimezone = ValidityModel();
  int selectedSubjectId;

  CountryVm currentSelectedCountry;
  TimeZone currentSelectedTimeZone;

  //Country List
  List<CountryVm> countryList;

  //TimeZone List
  List<TimeZone> timeZoneList;

  var result = Result().obs;

  var apiController = ApiController();
  var resultUser = new Result().obs;

  updatePasswordVisibility(bool value) {
    showPassword = value;
    // updateUserBuilder();
  }

  initDb() async {
    await Init.initialize();
  }

  checkFirstName(String value) {
    validityFirstName = UserValidation.validateFirstName(value);
    // updateUserBuilder();
  }

  Future<Result> logoutUserFromAllDevices() async {
    WidgetProperties.showLoader();
    Result logoutUserFromAllDevicesResult =
        await apiController.logoutUserFromAllDevicesFromApi();
    updateResult(logoutUserFromAllDevicesResult);
    WidgetProperties.closeLoader();
    return logoutUserFromAllDevicesResult;
  }

  Future<Result> getStudentDashboardData() async {
    Result dashboardDataResult =
        await apiController.getStudentDashboardDataFromApi();
    updateResult(dashboardDataResult);
    return dashboardDataResult;
  }

  Future<Result> getQuizPercentagesForGraph() async {
    // WidgetProperties.showLoader();
    Result pieChartDataResult =
        await apiController.getQuizPercentagesForGraphFromApi();
    updateResult(pieChartDataResult);
    // WidgetProperties.closeLoader();
    return pieChartDataResult;
  }

  // Future<Result> getChaptersPercentageForPie(UserEntity userEntity) async {
  //   WidgetProperties.showLoader();
  //   Result pieChartDataResult =
  //       await apiController.getChaptersPercentageForPieFromApi(userEntity);
  //   updateResult(pieChartDataResult);
  //   WidgetProperties.closeLoader();
  //   return pieChartDataResult;
  // }

  Future<Result> updateUserProfile(UserEntity userEntity) async {
    Result res = await apiController.updateUserProfileFromApi(userEntity);
    updateUser(res);
    return res;
  }

  bool checkUpdateUserValidation(UserEntity userEntity) {
    validityFirstName = UserValidation.validateFirstName(userEntity.FirstName);
    validityLastName = UserValidation.validateLastName(userEntity.LastName);
    validityUserName = UserValidation.validateUsername(userEntity.UserName);
    validityEmail = UserValidation.validateUserEmail(userEntity.Email);
    validityPassword = UserValidation.validateUserPassword(userEntity.Password);
    validityPhone = UserValidation.validatePhone(userEntity.ContactNumber);

    if (validityFirstName.valid &&
        validityLastName.valid &&
        validityUserName.valid &&
        validityEmail.valid &&
        validityPhone.valid &&
        validityPassword.valid) {
      return true;
    } else
      return false;
  }

  checkLastName(String value) {
    validityLastName = UserValidation.validateLastName(value);
    //updateUserBuilder();
  }

  checkUsername(String value) {
    validityUserName = UserValidation.validateUsername(value);
    // updateUserBuilder();
  }

  checkPassword(String value) {
    validityPassword = UserValidation.validateUserPassword(value);
    // updateUserBuilder();
  }

  checkEmail(String value) {
    validityEmail = UserValidation.validateUserEmail(value);
    // updateUserBuilder();
  }

  checkPhone(String value) {
    validityPhone = UserValidation.validatePhone(value);
    // updateUserBuilder();
  }

  checkCountry(String value) {
    validityCountry = UserValidation.validateCountry(value);
    // updateUserBuilder();
  }

  checkTimezone(String value) {
    validityTimezone = UserValidation.validateTimezone(value);
    // updateUserBuilder();
  }

  checkDOB(String value) {
    validityCountry = UserValidation.validateUserPassword(value);
    // updateUserBuilder();
  }

  updateUserBuilder() {
    update();
  }

  Future<Result> validateUserCredentials(UserEntity entity) async {
    WidgetProperties.showLoader();
    Result res = await apiController.validateUserCredentialsFromApi(entity);
    updateResult(res);
    WidgetProperties.closeLoader();
    return res;
  }

  Future<Result> signUpUser(UserEntity userEntity) async {
    WidgetProperties.showLoader();
    Result signupResult = await apiController.registerUserFromApi(userEntity);
    updateUser(signupResult);
    WidgetProperties.closeLoader();
    return signupResult;
  }

  updateUser(Result result) {
    this.resultUser.value = result;
  }

  updateUserEntity(UserEntity userEntity) {
    this.userEntity = userEntity;
  }

  bool checkSignup1Validation(UserEntity userEntity) {
    validityFirstName = UserValidation.validateFirstName(userEntity.FirstName);
    validityLastName = UserValidation.validateLastName(userEntity.LastName);
    validityUserName = UserValidation.validateUsername(userEntity.UserName);
    validityEmail = UserValidation.validateUserEmail(userEntity.Email);
    if (validityFirstName.valid &&
        validityLastName.valid &&
        validityUserName.valid &&
        validityEmail.valid) {
      return true;
    } else
      return false;
  }

  bool checkSigninValidation(UserEntity userEntity) {
    validityUserName = UserValidation.validateUsername(userEntity.UserName);
    validityPassword = UserValidation.validateUserPassword(userEntity.Password);
    if (validityUserName.valid && validityPassword.valid) {
      return true;
    } else
      return false;
  }

  bool checkSignup2Validation(UserEntity userEntity) {
    validityPassword = UserValidation.validateUserPassword(userEntity.Password);
    validityPhone = UserValidation.validatePhone(userEntity.ContactNumber);
    if (validityPassword.valid && validityPhone.valid) {
      return true;
    } else
      return false;
  }

  void updateCountry(CountryVm currentSelectedCountry) {
    this.currentSelectedCountry = currentSelectedCountry;
    update();
  }

  updateResult(Result result) {
    this.result.value = result;
  }

  Future<Result> getUserProfile() async {
    updateResult(Generic.waitResult());
    Result profileDataResult = await apiController.getUserProfileFromApi();
    updateResult(profileDataResult);
    return profileDataResult;
  }

  Future<Result> logoutUser() async {
    WidgetProperties.showLoader();
    Result logoutUserResult = await apiController.logoutUserFromApi();
    updateResult(logoutUserResult);
    WidgetProperties.closeLoader();
    return logoutUserResult;
  }

  upDateCountry(CountryVm currentSelectedCountry) {
    this.currentSelectedCountry = currentSelectedCountry;
    update();
  }

  upDateTimezone(TimeZone currentSelectedTimeZone) {
    this.currentSelectedTimeZone = currentSelectedTimeZone;
    update();
  }

  updateSelectedTimezone(TimeZone currentSelectedTimezone) {
    this.currentSelectedTimeZone = currentSelectedTimezone;
  }
}
