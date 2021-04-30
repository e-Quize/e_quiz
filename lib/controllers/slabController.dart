import 'package:e_quiz/controllers/api_controller.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/models/quiz/subject_model.dart';
import 'package:e_quiz/models/subscription/subscription_detail_model.dart';
import 'package:e_quiz/models/subscription/user_subscription.dart';
import 'package:e_quiz/models/user/user_model.dart';
import 'package:get/get.dart';

class SlabController extends GetxController {


  var result = Result().obs;
  var resultUser = new Result().obs;
  var apiController = ApiController();

  var payableAmount;


  var listUserSubscription = List<UserSubscriptionModel>();

  int selectedSubjectId;

  var selectedSubscriptionModel;
  var subscriptionDetaillist ;
  var userSubscriptionModel = UserSubscriptionModel();
  

  Future<Result> getSubjectSubscriptionDetail(UserEntity userEntity) async {
    Result listSubjectSubscriptionDetail =
        await apiController.getSubjectSubscriptionDetailFromApi(userEntity);
    updateUser(listSubjectSubscriptionDetail);
    return listSubjectSubscriptionDetail;
  }

  updateUserBuilder() {
    update();
  }

  updateUser(Result result) {
    this.resultUser.value = result;
  }
}
