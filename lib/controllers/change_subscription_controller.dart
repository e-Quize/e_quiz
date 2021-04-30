import 'package:e_quiz/controllers/api_controller.dart';
import 'package:e_quiz/models/changesubscription/change_subscription_model.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/models/subscription/update_delete_subscription.dart';
import 'package:e_quiz/utils/widgetproperties.dart';
import 'package:get/get.dart';

class ChangeSubscriptionController extends GetxController {
  var result = Result().obs;
  var resultUser = new Result().obs;
  var apiController = ApiController();

  int selectedSubjectId;
  var selectedSubscriptionIds = StringBuffer();

  var selectedSubscriptionModel;

  var userSubscriptionSubjectList;
  var userSavedSubscription = ChangeSubscriptionModel();

  // var userSavedSubscriptionList = List<UserSubscriptionModel>();

  updateResult(Result result) {
    this.result.value = result;
  }

  updateUserBuilder() {
    update();
  }

  updateUser(Result result) {
    this.resultUser.value = result;
  }

  Future<Result> getUserSubscriptions() async {
    Result getUserSubscriptionResult =
        await apiController.getUserSubscriptionsFromApi();
    updateResult(getUserSubscriptionResult);

    return getUserSubscriptionResult;
  }

  Future<Result> approveRevertUserSubscription(
      UpdateDeleteSubscription updateDeleteSubscription) async {
    WidgetProperties.showLoader();
    Result approveRevertResult = await apiController
        .approveRevertUserSubscriptionFromApi(updateDeleteSubscription);
    updateUser(approveRevertResult);
    WidgetProperties.closeLoader();
    return approveRevertResult;
  }

  String getBufferedSelectedSubscriptionIds() {
    selectedSubscriptionIds.clear();
    var list =
        userSavedSubscription.dt.where((element) => element.checked).toList();
    list.forEach((element) {
      if (list.indexOf(element) == 0) {
        if (selectedSubscriptionIds.isNotEmpty) {
          selectedSubscriptionIds.write("," + element.Id.toString());
        } else {
          selectedSubscriptionIds.write(element.Id.toString());
        }
      } else {
        selectedSubscriptionIds.write("," + element.Id.toString());
      }
    });
    return selectedSubscriptionIds.toString();
  }
}
