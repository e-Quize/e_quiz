import 'package:e_quiz/common/ui_widgets/common_card.dart';
import 'package:e_quiz/common/ui_widgets/custom_button.dart';
import 'package:e_quiz/common/ui_widgets/text_view.dart';
import 'package:e_quiz/controllers/graph_controller.dart';
import 'package:e_quiz/controllers/user_controller.dart';
import 'package:e_quiz/db/user_crud.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/models/dashboard/dashboard_vm_response.dart';
import 'package:e_quiz/models/piechart/pie_chart_model.dart';
import 'package:e_quiz/models/user/common_result.dart';
import 'package:e_quiz/models/user/common_result_copy.dart';
import 'package:e_quiz/models/user/user_model.dart';
import 'package:e_quiz/screens/authentication/signin_screen.dart';
import 'package:e_quiz/screens/common/common_background.dart';
import 'package:e_quiz/screens/dashboard/bar_chart_screen.dart';
import 'package:e_quiz/screens/dashboard/bar_chart_screen_replacement.dart';
import 'package:e_quiz/screens/dashboard/pie_chart_screen.dart';
import 'package:e_quiz/screens/more/change_subscription_screen.dart';
import 'package:e_quiz/screens/notification/notification_screen.dart';
import 'package:e_quiz/screens/payment/payment_history_screen.dart';
import 'package:e_quiz/screens/subscriptions/subscription_screen.dart';
import 'package:e_quiz/utils/colors.dart';
import 'package:e_quiz/utils/constants.dart';
import 'package:e_quiz/utils/dialog/dialog_class.dart';
import 'package:e_quiz/utils/dialog/loadingcircle/lib/ball_scale_indicator.dart';
import 'package:e_quiz/utils/dialog/loadingcircle/loading.dart';
import 'package:e_quiz/utils/dialog/toastclass.dart';
import 'package:e_quiz/utils/values.dart';
import 'package:e_quiz/utils/widgetproperties.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class HomeScreen extends StatelessWidget {
  int responseId;
  Widget top = Container();
  double iconHeight = 70.0;
  double iconWidth = 70.0;
  List<PieChartModel> pieChartList;

  int defaultIndex = 0;
  DashboardVMResponse userDashboardVMResponse;

  String facebookUrl = "";

  String linkedInUrl = "";
  String twitterUrl = "";

  var userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            ListTile(
              onTap: () {
                openScreen(context, ChangeSubscriptionScreen());
              },
              title: Text(
                "Change Subscription",
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold),
              ),
              // leading: Icon(Icons.arrow_forward),
            ),
            Divider(
              height: 3.0,
              color: Colors.green,
            ),
            ListTile(
              onTap: () {
                openScreen(context, NotificationScreen());
              },
              title: Text("Notifications",
                  style: TextStyle(
                      color: responseId == 0 ? Colors.red : Colors.deepPurple,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold)),
              // trailing: Icon(Icons.arrow_forward),
            ),
            Divider(
              height: 3.0,
              color: Colors.green,
            ),
            ListTile(
              onTap: () {
                openScreen(context, PaymentHistoryScreen());
              },
              title: Text("Payment History",
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold)),
              // trailing: Icon(Icons.arrow_forward),
            ),
            Divider(
              height: 3.0,
              color: Colors.green,
            ),
          ],
        ),
      ),
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                  backgroundColor: AppColors.primaryBtnColor,
                  titleSpacing: 0.0,
                  automaticallyImplyLeading: false,
                  elevation: 0.0,
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                    if (constraints.constrainHeight() < 120) {
                      top = SafeArea(
                        child: Container(
                          padding: EdgeInsets.only(
                              right: 10.0, left: 10.0, top: 12.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: SvgPicture.asset(
                                  "assets/icons/app_logo.svg",
                                  height: iconHeight,
                                  width: iconWidth,
                                  color: AppColors.textWhiteColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      top = SvgPicture.asset(
                        "assets/icons/app_logo.svg",
                        height: iconHeight,
                        width: iconWidth,
                        color: AppColors.textWhiteColor,
                      );
                    }
                    iconHeight = constraints.constrainHeight() / 3;
                    iconWidth = constraints.constrainWidth() / 3;
                    return FlexibleSpaceBar(
                        centerTitle: true,
                        title: AnimatedOpacity(
                          duration: Duration(milliseconds: 300),
                          //opacity: top == 80.0 ? 1.0 : 0.0,
                          opacity: 1.0,
                          child: top,
                        ),
                        background: Container(
                          color: AppColors.primaryBtnColor,
                        ));
                  })),
            ];
          },
          body: GetBuilder<UserController>(
              init: userController,
              initState: (child) {
                getStudentDashboardData();
                getResponseIdFromLocaldb();
              },
              builder: (_) {
                if (userDashboardVMResponse == null) {
                  return Center(
                    child: Container(
                      child: Loading(
                          indicator: BallScaleIndicator(),
                          size: 100.0,
                          color: Colors.pink),
                    ),
                  );
                } else {
                  return Container(
                    child: Stack(
                      children: [
                        BodyBackground(
                          heightTop:
                              WidgetProperties.screenHeight(context) * 0.05,
                          body: Container(),
                        ),
                        Positioned(
                            top: 10.0,
                            bottom: 0.0,
                            child: SingleChildScrollView(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                // height: MediaQuery.of(context).size.height,
                                margin: EdgeInsets.only(
                                    top: AppValues.commonSignupHeaderTopMagin),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              3,
                                      child: BarChartScreen(),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 25.0,
                                          right: AppValues.horizontalMargin,
                                          top: 12.0),
                                      child: Textview2(
                                        title: Constants.SUBJECT_TEXT,
                                        fontSize: 15.0,
                                        color: AppColors.commoneadingtextColor,
                                        fontWeight: FontWeight.w800,
                                        fontFamily: AppValues.fontFamily,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 25.0,
                                          right: AppValues.horizontalMargin,
                                          top: 5.0,
                                          bottom: 25.0),
                                      child: Textview2(
                                        title: Constants.SELECTED_SUBJECT_TEXT,
                                        fontSize: 12.0,
                                        color:
                                            AppColors.resultDashboardTextColor,
                                        fontWeight: FontWeight.w800,
                                        fontFamily: AppValues.fontFamily,
                                      ),
                                    ),
                                    userDashboardVMResponse
                                            .DashBaordSubjects.isEmpty
                                        ? Container(
                                            alignment: Alignment.bottomCenter,
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.of(Get.context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SubscriptionScreen()),
                                                );
                                              },
                                              child: CommonCard(
                                                  child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 40,
                                                              vertical: 20.0),
                                                      child: Text(
                                                        "Add Subjects",
                                                        style: TextStyle(
                                                            fontSize: 20.0),
                                                      ))),
                                            ),
                                          )
                                        : Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                6,
                                            child: buildSubjectList(),
                                          ),
                                  ],
                                ),
                              ),
                            )),
                      ],
                    ),
                  );
                }
              })
          //     ListView.builder(
          //   itemCount: 100,
          //   itemBuilder: (context, index) {
          //     return Text("List Item: " + index.toString());
          //   },
          // ),
          ),
    );
  }

  openScreen(BuildContext buildContext, Widget widget) {
    Navigator.of(buildContext).pop();
    WidgetProperties.goToNextPage(buildContext, widget);
  }

  Widget buildSubjectList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: userDashboardVMResponse.DashBaordSubjects.length,
      itemBuilder: (context, index) {
        return listSubjectWidget(context, index);
      },
    );
  }

  Widget listSubjectWidget(BuildContext buildContext, int index) {
    return GestureDetector(
      onTap: () async {
        userController.selectedSubjectId =
            userDashboardVMResponse.DashBaordSubjects[index].SubjectId;
        await getChapterPercentage();
        showPieChartDialog(buildContext);
      },
      child: Container(
        margin: EdgeInsets.only(left: 15.0, bottom: 20.0),
        child: Material(
          elevation: AppValues.cardElevation,
          color: (index % 2 == 0)
              ? AppColors.primaryBtnColor
              : AppColors.formContinueButtomColor,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            width: 100.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Textview2(
                  title: userDashboardVMResponse
                      .DashBaordSubjects[index].SubjectName,
                  fontSize: 10.0,
                  color: AppColors.textWhiteColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppValues.fontFamily,
                  textAlign: TextAlign.center,
                ),
                Textview2(
                  title: userDashboardVMResponse
                          .DashBaordSubjects[index].AttemptedQuestions
                          .toString() +
                      " / " +
                      userDashboardVMResponse
                          .DashBaordSubjects[index].USTotalQuestions
                          .toString(),
                  fontSize: 12.0,
                  color: AppColors.textWhiteColor,
                  fontWeight: FontWeight.w800,
                  fontFamily: AppValues.fontFamily,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getStudentDashboardData() async {
    Result res = await userController.getStudentDashboardData();
    if (res != null) {
      if (res.code == 500) {
        print(res.message);
      } else {
        userDashboardVMResponse = res.body;
        userController.updateUserBuilder();
      }
    }
  }

  logoutUserFromAllDevices() async {
    Result logoutUserFromAllDevicesResult =
        await userController.logoutUserFromAllDevices();
    var logoutFromAllDevicesData =
        logoutUserFromAllDevicesResult.body as CommonResult;
    if (logoutFromAllDevicesData != null) {
      Get.back();
    } else {
      ToastClass.showToast("There is something went wrong", ToastGravity.BOTTOM,
          Colors.red, Colors.white, 15.0, Toast.LENGTH_SHORT);
    }
  }

  getResponseIdFromLocaldb() async {
    CommonResultCopy commonResultCopy = await UserCrud.getCommonResultCopy();
    responseId = commonResultCopy.ResponseId;
  }

  showPieChartDialog(BuildContext buildContext) {
    WidgetProperties.goToNextPage(buildContext, BarChartScreenReplacement());
  }

  getSocialUrl() async {
    var bankInfoData = await UserCrud.getBankInfoData();
    if (bankInfoData != null) {
      facebookUrl = bankInfoData.FacebookURL;
      linkedInUrl = bankInfoData.LinkedInURL;
      twitterUrl = bankInfoData.TwitterURL;
    }
    userController.updateUserBuilder();
  }

  getChapterPercentage() async {
    var userEntity = UserEntity();
    userEntity.SubjectIdsString = userController.selectedSubjectId.toString();
    Result res = await Get.find<GraphController>()
        .getChaptersPercentageForPie(userEntity);
    if (res != null) {
      Get.find<GraphController>().pieGraphChartList = res.body;
      if (Get.find<GraphController>().pieGraphChartList != null &&
          Get.find<GraphController>().pieGraphChartList.isNotEmpty) {
        Get.find<GraphController>().dataMap = Map.fromIterable(
            Get.find<GraphController>().pieGraphChartList,
            key: (e) => e.chaptername,
            value: (e) => e.CQ_Percentage);
      } else {
        print("there is no data");
      }
      Get.find<GraphController>().updateGraphBuilder();
    }
  }
}
