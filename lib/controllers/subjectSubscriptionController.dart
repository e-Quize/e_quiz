import 'package:e_quiz/common/exception_manager/generic_result.dart';
import 'package:e_quiz/controllers/api_controller.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/models/quiz/save_subscription_model.dart';
import 'package:e_quiz/models/quiz/subject_model.dart';
import 'package:e_quiz/models/subscription/update_delete_subscription.dart';
import 'package:e_quiz/models/subscription/user_subscription.dart';
import 'package:e_quiz/utils/widgetproperties.dart';
import 'package:get/get.dart';

class SubscriptionController extends GetxController {
  var result = Result().obs;
  var resultUser = new Result().obs;
  var apiController = ApiController();

  int selectedSubjectId;
  var selectedSubscriptionIds = StringBuffer();

  var selectedSubscriptionModel;

  List<SubjectModel> userSubscriptionSubjectList;
  var userSavedSubscriptionList = List<UserSubscriptionModel>();
  // var userSavedSubscriptionList = List<UserSubscriptionModel>();

  Future<Result> saveSubscription(
      SaveSubscriptionModel saveSubscriptionModel) async {
    WidgetProperties.showLoader();
    Result saveModelResult =
        await apiController.saveSubscriptionsFromApi(saveSubscriptionModel);
    updateUser(saveModelResult);
    WidgetProperties.closeLoader();
    return saveModelResult;
  }

  Future<Result> approveRevertUserSubscription(
      UpdateDeleteSubscription updateDeleteSubscription) async {
    WidgetProperties.showLoader();
    Result approveRevertResult =
        await apiController.approveRevertUserSubscriptionFromApi(
            updateDeleteSubscription);
    updateUser(approveRevertResult);
    WidgetProperties.closeLoader();
    return approveRevertResult;
  }

  Future<Result> getSubscriptions(
      SaveSubscriptionModel saveSubscriptionModel) async {
    WidgetProperties.showLoader();
    Result saveModelResult =
        await apiController.getSubscriptionListFromApi(saveSubscriptionModel);
    updateUser(saveModelResult);
    WidgetProperties.closeLoader();
    return saveModelResult;
  }

  Future<Result> loadSubjectList() async {
    updateUser(Generic.waitResult());
    Result subjectListResult = await apiController.loadSubjectListFromApi();
    updateUser(subjectListResult);

    return subjectListResult;
  }

  Future<Result> logoutUser() async {
    WidgetProperties.showLoader();
    Result logoutUserResult = await apiController.logoutUserFromApi();
    updateResult(logoutUserResult);
    WidgetProperties.closeLoader();
    return logoutUserResult;
  }



  updateResult(Result result) {
    this.result.value = result;
  }

  updateUserBuilder() {
    update();
  }

  updateUser(Result result) {
    this.resultUser.value = result;
  }

  double getTotalPrice() {
    double sum = 0;
    if (userSubscriptionSubjectList != null)
      userSubscriptionSubjectList
          .where((element) => element.userSubscriptionModel != null)
          .forEach((SubjectModel e) {
        sum += e.userSubscriptionModel.TotalPayable;
      });
    //updateUserBuilder();
    return sum.toPrecision(2);
  }

  String getBufferedSelectedSubscriptionIds() {
    selectedSubscriptionIds.clear();
    var list =
        userSavedSubscriptionList.where((element) => element.checked).toList();
    list.forEach((element) {
      if (list.indexOf(element) == 0) {
        if (selectedSubscriptionIds.isNotEmpty) {
          selectedSubscriptionIds.write("," + element.UserId.toString());
        } else {
          selectedSubscriptionIds.write(element.UserId.toString());
        }
      } else {
        selectedSubscriptionIds.write("," + element.UserId.toString());
      }
    });
    return selectedSubscriptionIds.toString();
  }
}
