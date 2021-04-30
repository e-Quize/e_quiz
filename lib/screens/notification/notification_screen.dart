import 'package:e_quiz/controllers/notification_controller.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/utils/colors.dart';
import 'package:e_quiz/common/ui_widgets/text_view.dart';
import 'package:e_quiz/common/ui_widgets/common_card.dart';
import 'package:e_quiz/utils/dialog/loadingcircle/lib/ball_scale_indicator.dart';
import 'package:e_quiz/utils/dialog/loadingcircle/loading.dart';
import 'package:e_quiz/utils/values.dart';
import 'package:e_quiz/utils/widgetproperties.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../quizscreens/question_screen.dart';

class NotificationScreen extends StatelessWidget {
  var scrollController = ScrollController();
  var notificationController = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      dispose: (child) {
        scrollController.dispose();
      },
      init: notificationController,
      initState: (child) {
        // checkNotificationIsRead();
        notificationController.ini();
        getNotificationList();
        checkNotificationIsRead();
      },
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: AppColors.primaryBtnColor,
            title: Text("Notification List"),
          ),
          body: Container(
            height: WidgetProperties.screenHeight(Get.context),
            child: Stack(
              children: [
                Container(
                  height: WidgetProperties.screenHeight(Get.context),
                  child: buildNotificationList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  buildNotificationList() {
    if (notificationController.notificationList == null) {
      return Center(
        child: Container(
          height: WidgetProperties.screenHeight(Get.context),
          child: Loading(
              indicator: BallScaleIndicator(), size: 100.0, color: Colors.pink),
        ),
      );
    } else if (notificationController.notificationList.isEmpty) {
      return CommonCard(
        child: Center(
          child: Textview2(
            color: AppColors.primaryBtnColor,
            title: "No Notification Found",
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    } else {
      return ListView.builder(
        reverse: true,
        controller: scrollController,
        physics: BouncingScrollPhysics(),
        itemCount: notificationController.notificationList.length,
        shrinkWrap: false,
        itemBuilder: (context, index) {
          return listNotificationWidget(context, index);
        },
      );
    }
  }

  Widget listNotificationWidget(BuildContext buildContext, int index) {
    return GestureDetector(
      onTap: () {
        if (notificationController.notificationList[index].Type == "Quiz") {
          notificationController.notificationQuizId =
              notificationController.notificationList[index].NotificationQuizId;
          WidgetProperties.goToNextPage(buildContext, QuestionScreen());
        } else {
          showNotificationDialog(buildContext,
              notificationController.notificationList[index].Notification);
        }
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Material(
            elevation: 4.0,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(05.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 3,
                          child: Text(
                            notificationController
                                .notificationList[index].Notification,
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 13.0,
                                color: AppColors.accent3Color,
                                fontFamily: AppValues.fontFamily),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Text(
                            notificationController.notificationList[index].Type,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 13.0,
                                color: AppColors.accent3Color,
                                fontFamily: AppValues.fontFamily),
                          ),
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
      ),
    );
  }

  getNotificationList() async {
    Result res = await notificationController.loadNotificationList();
    if (res != null) notificationController.notificationList = res.body;
    notificationController.notificationList
        .sort((a, b) => a.Id.compareTo(b.Id));
    notificationController.update();
  }

  checkNotificationIsRead() async {
    Result res = await notificationController.notificationIsRead();
    if (res != null) {}
    notificationController.update();
  }

  showNotificationDialog(BuildContext buildContext, String title) {
    showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: "",
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 400),
      context: buildContext,
      pageBuilder: (_, __, ___) {
        return Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
              // margin: EdgeInsets.only(
              //   left: AppValues.horizontalMargin,
              //   right: AppValues.horizontalMargin,
              // ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    elevation: AppValues.cardElevation,
                    color: Color(0xfff2f2f2),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: Container(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 20.0),
                          alignment: Alignment.center,
                          child: Textview2(
                            title: title,
                            fontSize: 15.0,
                            color: AppColors.commoneadingtextColor,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
