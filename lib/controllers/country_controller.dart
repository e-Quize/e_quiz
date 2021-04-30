import 'package:e_quiz/common/exception_manager/generic_result.dart';
import 'package:e_quiz/controllers/api_controller.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/models/common/validity_model.dart';
import 'package:e_quiz/models/user/countries_vm_model.dart';
import 'package:e_quiz/models/user/user_validation.dart';
import 'package:get/get.dart';

class CountryController extends GetxController {
  var result = Result().obs;

  var validityCountry = ValidityModel();

  var apiController = ApiController();
  var resultUser = new Result().obs;
  int x = 0;

  updateResult(Result result) {
    this.result.value = result;
  }

  // ignore: non_constant_identifier_names
  UserController() {
    getCountries();
  }

  List<CountryVm> countryList;

  checkCountry(String value) {
    validityCountry = UserValidation.validateCountry(value);
  }

  getCountries() async {
    updateResult(Generic.waitResult());
    Result countryListResult = await apiController.getCountryListFromApi();
    countryList = countryListResult.body;
    updateResult(countryListResult);
    updateCountryBuilder();
  }

  updateCountryBuilder() {
    update();
  }
}
