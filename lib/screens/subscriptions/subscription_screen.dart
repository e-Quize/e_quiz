import 'package:e_quiz/common/ui_widgets/common_card.dart';
import 'package:e_quiz/common/ui_widgets/custom_button.dart';
import 'package:e_quiz/common/ui_widgets/hero_button_subscribe.dart';
import 'package:e_quiz/common/ui_widgets/text_view.dart';
import 'package:e_quiz/controllers/subjectSubscriptionController.dart';
import 'package:e_quiz/db/user_crud.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/models/quiz/save_subscription_model.dart';
import 'package:e_quiz/models/subscription/subscription_detail_model.dart';
import 'package:e_quiz/models/user/user_entity_copy.dart';
import 'package:e_quiz/screens/authentication/signin_screen.dart';
import 'package:e_quiz/screens/common/common_background.dart';
import 'package:e_quiz/screens/quizscreens/slab_screen.dart';
import 'package:e_quiz/utils/colors.dart';
import 'package:e_quiz/utils/dialog/loadingcircle/lib/ball_scale_indicator.dart';
import 'package:e_quiz/utils/dialog/loadingcircle/loading.dart';
import 'package:e_quiz/utils/dialog/toastclass.dart';
import 'package:e_quiz/utils/values.dart';
import 'package:e_quiz/utils/widgetproperties.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class SubscriptionScreen extends StatelessWidget {
  var _subjectScriptionController = Get.put(SubscriptionController());
  var bankInfoData;

  String bankAccountInfo = "";

  String supportEmailAddress = "";
  double sum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SubscriptionController>(
        init: _subjectScriptionController,
        initState: (child) {
          getSubjectList();
          getBankInfoSetting();
        },
        builder: (_) {
          return Stack(
            children: [
              BodyBackground(
                heightTop: WidgetProperties.screenHeight(context) *
                    AppValues.commonBGHeight,
                heightBottom: WidgetProperties.screenHeight(context) *
                    AppValues.commonBGHeight,
              ),
              Container(
                margin: EdgeInsets.only(
                    left: AppValues.horizontalMargin,
                    right: AppValues.horizontalMargin,
                    top: 65.0),
                child: Material(
                  elevation: AppValues.cardElevation,
                  color: Color(0xfff2f2f2),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10.0),
                    height: WidgetProperties.screenHeight(context) * 0.58,
                    child: buildSubscriptionList(context),
                  ),
                ),
              ),
              Positioned(
                bottom: 60.0,
                right: 0.0,
                left: 0.0,
                child: getFooter(),
              ),
              Container(
                margin: EdgeInsets.only(left: 28.0, right: 28.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: HeroButton(
                    height: 40.0,
                    width: MediaQuery.of(context).size.width,
                    radius: 22.0,
                    gradient: AppColors.formContinueButtomColor,
                    title: "Save Subscription",
                    onPressed: () {
                      saveSubscription(context);
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildSubscriptionList(BuildContext context) {
    if (_subjectScriptionController.userSubscriptionSubjectList == null) {
      return Center(
        child: Container(
          child: Loading(
              indicator: BallScaleIndicator(), size: 100.0, color: Colors.pink),
        ),
      );
    } else if (_subjectScriptionController
        .userSubscriptionSubjectList.isEmpty) {
      return Center(
        child: CommonCard(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 55.0),
                child:
                    Text("No Data found", style: TextStyle(fontSize: 25.0)))),
      );
    } else {
      return Container(
        height: MediaQuery.of(context).size.height * 0.3,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: _subjectScriptionController
                    .userSubscriptionSubjectList.length ??
                0,
            itemBuilder: (BuildContext buildContext, int index) {
              return subscriptionListTile(buildContext, index);
            }),
      );
    }
  }

  Widget subscriptionListWidget(BuildContext buildContext, int index) {
    return Container(
        height: 150.0,
        margin: EdgeInsets.only(left: 15.0, right: 15.0),
        child: Container(
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.only(top: 10.0),
          decoration: BoxDecoration(
            color: AppColors.dropdownBackgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(color: AppColors.dropdownBackgroundColor),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Textview2(
                  title: _subjectScriptionController
                      .userSubscriptionSubjectList[index].SubjectName,
                  fontSize: 12.0,
                  color: AppColors.textBlackColor,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Textview2(
                      title: "Payable Amount",
                      fontSize: 12.0,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w300,
                      textAlign: TextAlign.left,
                    ),
                    Textview2(
                      title: _subjectScriptionController
                              .userSubscriptionSubjectList[index]
                              .userSubscriptionModel
                              .TotalPayable
                              .toString() ??
                          "0.0",
                      fontSize: 12.0,
                      color: AppColors.formContinueButtomColor,
                      fontWeight: FontWeight.w300,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HeroButtonSubscription(
                      // width: WidgetProperties.screenWidth(buildContext),
                      height: 30.0,
                      radius: 22.0,
                      gradient: AppColors.primaryBtnColor,
                      title: _subjectScriptionController
                                  .userSubscriptionSubjectList[index]
                                  .userSubscriptionModel ==
                              null
                          ? "Subscribe"
                          : "Edit Subscription",
                      onPressed: () {
                        _subjectScriptionController
                            .userSubscriptionSubjectList[index].checked = true;
                        _subjectScriptionController.selectedSubjectId =
                            _subjectScriptionController
                                .userSubscriptionSubjectList[index].Id;

                        WidgetProperties.goToNextPage(
                          buildContext,
                          SlabScreen(),
                        );
                      },
                    ),
                    HeroButton(
                      // width: WidgetProperties.screenWidth(buildContext),
                      height: 30.0,
                      radius: 22.0,
                      gradient: AppColors.startNowTextColor1,
                      title: 'Remove',
                      onPressed: () {
                        _subjectScriptionController.userSubscriptionSubjectList
                            .removeAt(index);
                        _subjectScriptionController.updateUserBuilder();
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget subscriptionListTile(BuildContext buildContext, int index) {
    return Container(
        margin: EdgeInsets.only(left: 15.0, right: 15.0),
        child: Container(
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.only(top: 10.0),
          decoration: BoxDecoration(
            color: AppColors.dropdownBackgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            border: Border.all(color: AppColors.dropdownBackgroundColor),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Textview2(
                  title: _subjectScriptionController
                          .userSubscriptionSubjectList[index].SubjectName ??
                      "",
                  fontSize: 12.0,
                  color: AppColors.textBlackColor,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Textview2(
                      title: "Payable Amount",
                      fontSize: 12.0,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w300,
                      textAlign: TextAlign.left,
                    ),
                    Textview2(
                      title: _subjectScriptionController
                                  .userSubscriptionSubjectList[index]
                                  .userSubscriptionModel !=
                              null
                          ? _subjectScriptionController
                              .userSubscriptionSubjectList[index]
                              .userSubscriptionModel
                              .TotalPayable
                              .toString()
                          : "0.0",
                      fontSize: 12.0,
                      color: AppColors.formContinueButtomColor,
                      fontWeight: FontWeight.w300,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HeroButtonSubscription(
                      // width: WidgetProperties.screenWidth(buildContext),
                      height: 30.0,
                      radius: 22.0,
                      gradient: AppColors.primaryBtnColor,
                      title: _subjectScriptionController
                                  .userSubscriptionSubjectList[index]
                                  .userSubscriptionModel ==
                              null
                          ? "Subscribe"
                          : "Edit Subscription",
                      onPressed: () {
                        _subjectScriptionController
                            .userSubscriptionSubjectList[index].checked = true;
                        _subjectScriptionController.selectedSubjectId =
                            _subjectScriptionController
                                .userSubscriptionSubjectList[index].Id;

                        WidgetProperties.goToNextPage(
                          buildContext,
                          SlabScreen(),
                        );
                      },
                    ),
                    HeroButton(
                      // width: WidgetProperties.screenWidth(buildContext),
                      height: 30.0,
                      radius: 22.0,
                      gradient: AppColors.startNowTextColor1,
                      title: 'Remove',
                      onPressed: () {
                        _subjectScriptionController.userSubscriptionSubjectList
                            .removeAt(index);
                        _subjectScriptionController.updateUserBuilder();
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget getFooter() {
    return Container(
      height: 100.0,
      padding: EdgeInsets.only(left: 25.0, right: 25.0),
      margin: EdgeInsets.only(
        left: 30.0,
        right: 30.0,
      ),
      decoration: BoxDecoration(
          color: AppColors.primaryBtnColor,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            //margin: EdgeInsets.only(left: 25.0, right: 25.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 20.0,
                  width: 20.0,
                  decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent, shape: BoxShape.circle),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '1',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Flexible(
                  child: Text(
                    'Total Payable  (${_subjectScriptionController.getTotalPrice().toString()})',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            // margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 25.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 20.0,
                  width: 20.0,
                  decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent, shape: BoxShape.circle),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '2',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Flexible(
                  child: Text(
                    'Payment on this Bank Account No.  (${bankAccountInfo})',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            //margin: EdgeInsets.only(left: 25.0, right: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                    height: 20.0,
                    width: 20.0,
                    decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent, shape: BoxShape.circle),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '3',
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(left: 5.0),
                    child: Text(
                      'share the payment ScreenShot on mail (${supportEmailAddress})',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void saveSubscription(BuildContext buildContext) async {
    var list = List<SubscriptionDetailModel>();

    _subjectScriptionController.userSubscriptionSubjectList.forEach((element) {
      if (element.userSubscriptionModel != null) {
        list.add(element.userSubscriptionModel);
      }
    });
    if (list.isEmpty) {
      ToastClass.showToast(
          "Please subscribe at least one subject",
          ToastGravity.BOTTOM,
          Colors.red,
          Colors.white,
          15.0,
          Toast.LENGTH_SHORT);
    } else {
      var saveSubscriptionModel = SaveSubscriptionModel();
      UserEntityCopy userEntityCopy = await UserCrud.getUserCopy();
      saveSubscriptionModel.userEntity = UserEntityCopy();
      saveSubscriptionModel.userEntity.Token = userEntityCopy.Token;
      saveSubscriptionModel.subscriptions = list;
      Result res = await _subjectScriptionController
          .saveSubscription(saveSubscriptionModel);
      if (res != null) {
        if (res.code > 0) {
          ToastClass.showToast(res.message, ToastGravity.BOTTOM, Colors.green,
              Colors.white, 15.0, Toast.LENGTH_SHORT);
          Result result = await _subjectScriptionController.logoutUser();
          if (result != null)
            WidgetProperties.goToNextPage(
              buildContext,
              SigninScreen(),
            );
        } else {
          ToastClass.showToast("error", ToastGravity.BOTTOM, Colors.red,
              Colors.white, 15.0, Toast.LENGTH_SHORT);
        }
      } else {
        ToastClass.showToast("error", ToastGravity.BOTTOM, Colors.red,
            Colors.white, 15.0, Toast.LENGTH_SHORT);
      }
      // }else
      //   {
      //     ToastClass.showToast("errasjdksadjhasdhkjor", ToastGravity.BOTTOM, Colors.red,
      //         Colors.white, 15.0, Toast.LENGTH_SHORT);
      //   }
    }
  }

  getBankInfoSetting() async {
    var bankInfoData = await UserCrud.getBankInfoData();
    if (bankInfoData != null) {
      bankAccountInfo = bankInfoData.BankAccountInfo;
      supportEmailAddress = bankInfoData.SupportEmailAddress;
    }
    _subjectScriptionController.updateUserBuilder();
  }

  getSubjectList() async {
    Result subjectList = await _subjectScriptionController.loadSubjectList();
    _subjectScriptionController.userSubscriptionSubjectList = subjectList.body;
    _subjectScriptionController.updateUserBuilder();
  }
}
