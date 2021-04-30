import 'package:e_quiz/controllers/api_controller.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/models/notification/notification_model.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  List<NotificationModel> notificationList;
  var apiController;
  var resultUser;
  int notificationQuizId;

  ini() {
    apiController = ApiController();
    resultUser = new Result().obs;
  }

  Future<Result> loadNotificationList() async {
    Result notificationListResult =
        await apiController.getNotificationInitFromApi();
    updateNotificationBuilder(notificationListResult);
    return notificationListResult;
  }

  updateNotificationBuilder(Result result) {
    this.resultUser.value = result;
  }
  Future<Result> notificationIsRead() async {
    Result notificationIsReadResult =
    await apiController.notificationIsReadFromApi();
    updateNotificationBuilder(notificationIsReadResult);
    return notificationIsReadResult;
  }
}
