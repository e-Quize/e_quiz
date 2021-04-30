import 'package:e_quiz/common/ui_widgets/common_card.dart';
import 'package:e_quiz/common/ui_widgets/text_view.dart';
import 'package:e_quiz/controllers/payment_controller.dart';
import 'package:e_quiz/models/attemptquiz/student.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/utils/colors.dart';
import 'package:e_quiz/utils/dialog/loadingcircle/lib/ball_scale_indicator.dart';
import 'package:e_quiz/utils/dialog/loadingcircle/loading.dart';
import 'package:e_quiz/utils/values.dart';
import 'package:e_quiz/utils/widgetproperties.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class PaymentHistoryScreen extends StatelessWidget {
  var scrollController = ScrollController();
  var paymentController = Get.put(PaymentController());
  var listCountry = ['Paid', 'Pending', 'Approved'];
  List<Student> paymentList;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(
      dispose: (child) {
        scrollController.dispose();
      },
      init: paymentController,
      initState: (child) {
        paymentController.ini();
        getPaymentList();
      },
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryBtnColor,
            title: Text("Payment History"),
          ),
          body: Container(
            height: WidgetProperties.screenHeight(Get.context),
            child: Stack(
              children: [
                Container(
                  height: WidgetProperties.screenHeight(Get.context) * 0.7,
                  child: buildList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  buildList() {
    if (listCountry == null) {
      return Center(
        child: Container(
          height: WidgetProperties.screenHeight(Get.context),
          child: Loading(
              indicator: BallScaleIndicator(), size: 100.0, color: Colors.pink),
        ),
      );
    } else if (listCountry.isEmpty) {
      return CommonCard(
        child: Center(
          child: Textview2(
            title: "No Data Found",
            fontSize: 15.0,
          ),
        ),
      );
    } else {
      return ListView.builder(
        controller: scrollController,
        physics: BouncingScrollPhysics(),
        // itemCount: notificationController.notificationList.length ?? 0,
        itemCount: listCountry.length,
        shrinkWrap: false,
        itemBuilder: (context, index) {
          return listNotificationWidget(context, index);
        },
      );
    }
  }

  Widget listNotificationWidget(BuildContext buildContext, int index) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Material(
          elevation: 4.0,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: Column(
              children: [
                Container(
                  height: 70.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Textview2(
                        title: listCountry[index],
                        fontSize: 20.0,
                        color: AppColors.accent3Color,
                        fontWeight: FontWeight.w900,
                        fontFamily: AppValues.fontFamily,
                      ),
                      Textview2(
                        title: listCountry[index],
                        fontSize: 20.0,
                        color: AppColors.accent3Color,
                        fontWeight: FontWeight.w900,
                        fontFamily: AppValues.fontFamily,
                      ),
                    ],
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     Textview2(
                //       title: "Status :       ",
                //       fontSize: 16.0,
                //       color: AppColors.accent3Color,
                //       fontWeight: FontWeight.w900,
                //       fontFamily: AppValues.fontFamily,
                //     ),
                //     Container(
                //       child: Textview2(
                //         title: studentController.studentList[index].Status,
                //         fontSize: 15.0,
                //         color: studentController.studentList[index].Status ==
                //                 "Online"
                //             ? AppColors.formContinueButtomColor
                //             : AppColors.progressbarColor,
                //         fontWeight: FontWeight.bold,
                //         fontFamily: AppValues.fontFamily,
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          )),
    );
  }

  getPaymentList() async {
    Result res = await paymentController.loadPaymentHistory();
    if (res != null) {
      paymentList = res.body;
      paymentController.update();
    }
  }
}
