import 'package:get/get.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/controllers/api_controller.dart';
import 'package:e_quiz/models/payment/payment_history_model.dart';

class PaymentController extends GetxController {
  var apiController;
  var result;
  var resultUser;
  List<PaymentModel> paymentList;

  ini() {
    resultUser = new Result().obs;
    apiController = ApiController();
    paymentList = List<PaymentModel>();
  }

  Future<Result> loadPaymentHistory() async {
    Result paymentHistoryResult = await apiController.getPaymentHistoryFromApi();
    updatePaymentResult(paymentHistoryResult);
    return paymentHistoryResult;
  }

  updatePaymentResult(Result result) {
    this.resultUser.value = result;
  }
}
