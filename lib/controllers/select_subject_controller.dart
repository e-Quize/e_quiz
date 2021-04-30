import 'package:get/get.dart';

class SelectSubjectController extends GetxController {
  String dropdownValue = "";

  checkDropdownValue(String value) {
    dropdownValue = value;
    updateUserBuilder();
  }

  updateUserBuilder() {
    update();
  }
}
