import 'package:e_quiz/common/ui_widgets/common_card.dart';
import 'package:e_quiz/common/ui_widgets/custom_button.dart';
import 'package:e_quiz/common/ui_widgets/text_view.dart';
import 'package:e_quiz/common/ui_widgets/custom_button_subscription.dart';
import 'package:e_quiz/controllers/change_subscription_controller.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/models/changesubscription/change_subscription_model.dart';
import 'package:e_quiz/models/subscription/update_delete_subscription.dart';
import 'package:e_quiz/models/user/user_entity_copy.dart';
import 'package:e_quiz/utils/dialog/toastclass.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:e_quiz/db/user_crud.dart';
import 'package:e_quiz/screens/common/common_background.dart';
import 'package:e_quiz/screens/subscriptions/subscription_screen.dart';
import 'package:e_quiz/utils/colors.dart';
import 'package:e_quiz/utils/dialog/loadingcircle/lib/ball_scale_indicator.dart';
import 'package:e_quiz/utils/dialog/loadingcircle/loading.dart';
import 'package:e_quiz/utils/values.dart';
import 'package:e_quiz/utils/widgetproperties.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeSubscriptionScreen extends StatelessWidget {
  // var _changeScriptionController = ChangeSubscriptionController();
  var _changeScriptionController = Get.put(ChangeSubscriptionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<ChangeSubscriptionController>(
        init: _changeScriptionController,
        initState: (child) {
          getSubscriptionModel();
        },
        builder: (_) {
          return Stack(
            children: [
              BodyBackground(
                heightTop: WidgetProperties.screenHeight(context) * 0.3,
                heightBottom: WidgetProperties.screenHeight(context) *
                    AppValues.commonBGHeight,
              ),
              Container(
                margin: EdgeInsets.only(
                    left: AppValues.horizontalMargin,
                    right: AppValues.horizontalMargin,
                    top: 80.0),
                child: Material(
                  elevation: AppValues.cardElevation,
                  color: Color(0xfff2f2f2),
                  borderRadius: BorderRadius.all(
                      Radius.circular(AppValues.commonBodyCardRadius)),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10.0),
                    height: WidgetProperties.screenHeight(context) * 0.70,
                    child: buildSubscriptionList(context),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20.0),
                      child: HeroButton(
                        width: 150.0,
                        height: 40.0,
                        radius: 22.0,
                        gradient: AppColors.primaryBtnColor,
                        title: 'Add Subscription (s)',
                        onPressed: () {
                          WidgetProperties.goToNextPage(
                              context, SubscriptionScreen());
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 30.0),
                      child: HeroButton(
                        width: 150.0,
                        height: 40.0,
                        radius: 22.0,
                        gradient: AppColors.startNowTextColor1,
                        title: 'Delete Subscription (s)',
                        onPressed: () {
                          approveRevertUserSubscription();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildSubscriptionList(BuildContext context) {
    if (_changeScriptionController.userSavedSubscription.dt == null) {
      return Center(
        child: Container(
          child: Loading(
              indicator: BallScaleIndicator(), size: 100.0, color: Colors.pink),
        ),
      );
    } else if (_changeScriptionController.userSavedSubscription.dt.isEmpty) {
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
            itemCount:
                _changeScriptionController.userSavedSubscription.dt.length,
            itemBuilder: (BuildContext buildContext, int index) {
              return subscriptionListWidget(buildContext, index);
            }),
      );
    }
  }

  Widget subscriptionListWidget(BuildContext buildContext, int index) {
    return GestureDetector(
      onTap: () {
        // _changeScriptionController.userSavedSubscription.dt[index].checked =
        //     true;
        _changeScriptionController.userSavedSubscription.dt[index].checked =
            !_changeScriptionController.userSavedSubscription.dt[index].checked;
        _changeScriptionController.updateUserBuilder();
      },
      child: Container(
          margin: EdgeInsets.only(left: 15.0, right: 15.0),
          child: Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.only(top: 10.0),
            decoration: BoxDecoration(
              color: _changeScriptionController
                      .userSavedSubscription.dt[index].checked
                  ? AppColors.textWhiteColor
                  : AppColors.dropdownBackgroundColor,
              // color: AppColors.dropdownBackgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              border: Border.all(color: AppColors.dropdownBackgroundColor),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Textview2(
                        title: _changeScriptionController
                            .userSavedSubscription.dt[index].SubjectName,
                        fontSize: 15.0,
                        color: AppColors.textBlackColor,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.left,
                      ),
                      Textview2(
                        title: _changeScriptionController
                            .userSavedSubscription.dt[index].Slab,
                        fontSize: 10.0,
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
                        title: _changeScriptionController
                            .userSavedSubscription.dt[index].MonthlyCharges
                            .toString(),
                        fontSize: 10.0,
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
                        title: _changeScriptionController
                            .userSavedSubscription.dt[index].LifeTimeCharges
                            .toString(),
                        fontSize: 10.0,
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
                        title: _changeScriptionController
                            .userSavedSubscription.dt[index].TotalAmount
                            .toString(),
                        fontSize: 10.0,
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
                        title: "Role Over Time",
                        fontSize: 15.0,
                        color: AppColors.textBlackColor,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.left,
                      ),
                      Textview2(
                        title: _changeScriptionController
                            .userSavedSubscription.dt[index].RoleOverTime
                            .toString(),
                        fontSize: 10.0,
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
                        title: _changeScriptionController
                            .userSavedSubscription.dt[index].Concession
                            .toString(),
                        fontSize: 10.0,
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
                      Container(
                        child: Container(
                          padding: EdgeInsets.all(0.0),
                          child: HeroButton(
                            width: 25.0,
                            height: 25.0,
                            radius: 15.0,
                            gradient: AppColors.primaryBtnColor,
                            title: 'Status',
                            onPressed: () {},
                          ),
                        ),
                      ),
                      _changeScriptionController
                                  .userSavedSubscription.dt[index].Status
                                  .toString() ==
                              "Subscription Deleted"
                          ? Container(
                              padding: EdgeInsets.all(0.0),
                              child: HeroButton(
                                width: 25.0,
                                height: 25.0,
                                radius: 15.0,
                                gradient: AppColors.startNowTextColor1,
                                title: "Subscription Deleted",
                                onPressed: () {},
                              ),
                            )
                          : Container(
                              padding: EdgeInsets.all(0.0),
                              child: CustomHeroButtonSubscription(
                                width: 25.0,
                                height: 25.0,
                                textColor: Colors.white,
                                radius: 15.0,
                                gradient: Colors.green,
                                title: "Delete",
                                onPressed: () {},
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  getSubscriptionModel() async {
    Result subscriptionModel =
        await _changeScriptionController.getUserSubscriptions();
    _changeScriptionController.userSavedSubscription =
        subscriptionModel.body as ChangeSubscriptionModel;
    _changeScriptionController.updateUserBuilder();
  }

  approveRevertUserSubscription() async {
    var updateDeleteSubscription = UpdateDeleteSubscription();
    UserEntityCopy userEntityCopy = await UserCrud.getUserCopy();
    updateDeleteSubscription.userEntity = UserEntityCopy();
    updateDeleteSubscription.userEntity.Token = userEntityCopy.Token;
    updateDeleteSubscription.SubscriptionIds =
        _changeScriptionController.getBufferedSelectedSubscriptionIds();
    if (updateDeleteSubscription.SubscriptionIds == "") {
      ToastClass.showToast("Please Select subscription", ToastGravity.BOTTOM,
          Colors.red, Colors.white, 15.0, Toast.LENGTH_SHORT);
      return;
    }
    updateDeleteSubscription.Delete = true;
    updateDeleteSubscription.Approve = false;
    updateDeleteSubscription.Revert = false;
    Result deleteResult = await _changeScriptionController
        .approveRevertUserSubscription(updateDeleteSubscription);
    if (deleteResult != null) {
      if (deleteResult.code == 0) {
        ToastClass.showToast(deleteResult.message, ToastGravity.BOTTOM,
            Colors.red, Colors.white, 15.0, Toast.LENGTH_SHORT);
      } else if (deleteResult.code > 0) {
        ToastClass.showToast(deleteResult.message, ToastGravity.BOTTOM,
            Colors.red, Colors.white, 15.0, Toast.LENGTH_SHORT);
        getSubscriptionModel();
      }
    }
  }
}
