import 'package:e_quiz/controllers/api_controller.dart';
import 'package:e_quiz/models/attemptquiz/student.dart';
import 'package:e_quiz/models/attemptquiz/student_list_parameter_model.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/models/notification/notification_send_vm.dart';
import 'package:get/get.dart';

class StudentController extends GetxController {
  List<Student> studentList;
  var apiController;
  var resultUser;
  var selectedSubjectIds;
  var selectedStudentIds;
  int selectedStudentIndex;
  int noOfQuestions;

  ini() {
    studentList = null;
    apiController = ApiController();
    resultUser = new Result().obs;
    selectedStudentIds = StringBuffer();
  }

  updateSelectedIndex(int selectedIndex) {
    this.selectedStudentIndex = selectedIndex;
    update();
  }

  Future<Result> loadStudentList(
      StudentListParameterModel studentListParameterModel) async {
    Result userListResult =
        await apiController.loadStudentListFromApi(studentListParameterModel);
    // updateUser(userListResult);
    return userListResult;
  }

  Future<Result> sendNotification(NotificationVM notificationVM) async {
    Result userListResult =
        await apiController.sendNotificationFromApi(notificationVM);
    updateUser(userListResult);
    return userListResult;
  }

  updateUser(Result result) {
    this.resultUser.value = result;
  }

  updateUserBuilder() {
    update();
  }

  String  getBufferedStudentIds() {
    selectedStudentIds.clear();
    var list = studentList.where((element) => element.checked).toList();
    list.forEach((element) {
      if (list.indexOf(element) == 0) {
        if (selectedStudentIds.isNotEmpty) {
          selectedStudentIds.write("," + element.UserId.toString());
        } else {
          selectedStudentIds.write(element.UserId.toString());
        }
      } else {
        selectedStudentIds.write("," + element.UserId.toString());
      }
    });

    return selectedStudentIds.toString();
  }
}
