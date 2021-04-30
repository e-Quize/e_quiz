import 'package:e_quiz/common/exception_manager/generic_result.dart';
import 'package:e_quiz/controllers/api_controller.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/models/common/validity_model.dart';
import 'package:e_quiz/models/user/countries_vm_model.dart';
import 'package:e_quiz/models/user/timezone.dart';
import 'package:e_quiz/models/user/user_validation.dart';
import 'package:get/get.dart';

class TimeZoneController extends GetxController {
  var result = Result().obs;

  var apiController = ApiController();

  var validityTimezone = ValidityModel();
  List<TimeZone> timeZoneList;

  checkTimezone(String value) {
    validityTimezone = UserValidation.validateTimezone(value);
  }

  updateResult(Result result) {
    this.result.value = result;
  }

  Future<Result> getCountryTimeZones(CountryVm countryVm) async {
    updateResult(Generic.waitResult());
    Result timezoneListResult =
        await apiController.getCountryTimeZoneListFromApi(countryVm);
    return timezoneListResult;
  }

  updateTimezoneBuilder() {
    update();
  }
}
