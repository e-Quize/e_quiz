import 'package:e_quiz/common/ui_widgets/common_card.dart';
import 'package:e_quiz/common/ui_widgets/text_view.dart';
import 'package:e_quiz/controllers/payment_controller.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:e_quiz/utils/dialog/loadingcircle/lib/ball_scale_indicator.dart';
import 'package:e_quiz/utils/dialog/loadingcircle/loading.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';

class PaymentHistoryScreen extends StatelessWidget {
  var scrollController = ScrollController();
  var paymentController = Get.put(PaymentController());

  var _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryBtnColor,
          centerTitle: true,
          title: Text('Payment History'),
        ),
        body: GetBuilder<PaymentController>(
          dispose: (child) {
            scrollController.dispose();
          },
          init: paymentController,
          initState: (child) {
            paymentController.ini();
            getPaymentList();
          },
          builder: (_) {
            return GroupedListView<dynamic, dynamic>(
              elements: paymentController.paymentList,
              groupBy: (element) => element.SubjectName,
              groupComparator: (value1, value2) => value2.compareTo(value1),
              itemComparator: (item1, item2) =>
                  item1.Subscription.compareTo(item2.Subscription),
              order: GroupedListOrder.DESC,
              useStickyGroupSeparators: true,
              groupSeparatorBuilder: (dynamic value) {
                if (paymentController.paymentList == null) {
                  return Center(
                    child: Container(
                      child: Loading(
                          indicator: BallScaleIndicator(),
                          size: 100.0,
                          color: Colors.pink),
                    ),
                  );
                }
               else if (paymentController.paymentList.isEmpty) {
                  return Center(
                    child: CommonCard(
                        child: Center(
                          child: Text(
                            "No Data found",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        )),
                  );
                }
                else {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      value,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  );
                }
              },
              itemBuilder: (c, element) {
                return paymentListWidget(c, element);
                //   Card(elevation: 8.0,
                //   margin:
                //       EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                //   child: Container(
                //     child: ListTile(
                //       contentPadding: EdgeInsets.symmetric(
                //           horizontal: 20.0, vertical: 10.0),
                //       leading: Icon(Icons.account_circle),
                //       title: Text(element.Subscription),
                //       trailing: Icon(Icons.arrow_forward),
                //     ),
                //   ),
                // );
              },
            );
          },
        ),
      ),
    );
  }

  getPaymentList() async {
    Result res = await paymentController.loadPaymentHistory();
    if (res != null) {
      paymentController.paymentList = res.body;
      paymentController.update();
    }
  }

  Widget paymentListWidget(BuildContext buildContext, dynamic element) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: AppColors.dropdownBackgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        border: Border.all(color: AppColors.dropdownBackgroundColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Textview2(
                  title: "Subscription",
                  fontSize: 15.0,
                  color: AppColors.textBlackColor,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.left,
                ),
                Textview2(
                  title: element.Subscription,
                  fontSize: 15.0,
                  color: AppColors.textBlackColor,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Textview2(
                  title: "Monthly Charges",
                  fontSize: 15.0,
                  color: AppColors.textBlackColor,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.left,
                ),
                Textview2(
                  title: element.MonthlyCharges.toString(),
                  fontSize: 15.0,
                  color: AppColors.textBlackColor,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Textview2(
                  title: "Lifetime  Charges",
                  fontSize: 15.0,
                  color: AppColors.textBlackColor,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.left,
                ),
                Textview2(
                  title: element.LifeTimeCharges.toString(),
                  fontSize: 15.0,
                  color: AppColors.textBlackColor,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Textview2(
                  title: "Total Amount",
                  fontSize: 15.0,
                  color: AppColors.textBlackColor,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.left,
                ),
                Textview2(
                  title: element.TotalAmount.toString(),
                  fontSize: 15.0,
                  color: AppColors.textBlackColor,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Textview2(
                  title: "Contact Number",
                  fontSize: 15.0,
                  color: AppColors.textBlackColor,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.left,
                ),
                Textview2(
                  title: element.ContactNumber,
                  fontSize: 15.0,
                  color: AppColors.textBlackColor,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Textview2(
                  title: "Concession",
                  fontSize: 15.0,
                  color: AppColors.textBlackColor,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.left,
                ),
                Textview2(
                  title: element.Concession.toString(),
                  fontSize: 15.0,
                  color: AppColors.textBlackColor,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
