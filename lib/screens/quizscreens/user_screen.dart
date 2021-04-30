import 'package:e_quiz/common/ui_widgets/common_card.dart';
import 'package:e_quiz/common/ui_widgets/text_view.dart';
import 'package:e_quiz/controllers/subject_controller.dart';
import 'package:e_quiz/controllers/user_controller.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/models/user/user_model.dart';
import 'package:e_quiz/screens/common/common_background.dart';
import 'package:e_quiz/utils/colors.dart';
import 'package:e_quiz/utils/constants.dart';
import 'package:e_quiz/utils/dialog/loadingcircle/lib/ball_scale_indicator.dart';
import 'package:e_quiz/utils/dialog/loadingcircle/loading.dart';
import 'package:e_quiz/utils/values.dart';
import 'package:e_quiz/utils/widgetproperties.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class UserListScreen extends StatelessWidget {
  var subjectController = Get.find<SubjectController>();
  List<UserEntity> userList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          BodyBackground(
            heightTop: WidgetProperties.screenHeight(context) * 0.3,
            heightBottom: WidgetProperties.screenHeight(context) * 0.5,
            body: Container(),
          ),
          Container(
            margin: EdgeInsets.only(top: AppValues.commonSignupHeaderTopMagin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Textview2(
                    title: Constants.USER_LIST,
                    fontSize: 25.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppValues.fontFamily,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: AppValues.horizontalMargin,
                      right: AppValues.horizontalMargin,
                      top: 15.0),
                  child: Material(
                    elevation: AppValues.cardElevation,
                    color: Color(0xfff2f2f2),
                    borderRadius: BorderRadius.all(
                        Radius.circular(AppValues.commonBodyCardRadius)),
                    child: Container(
                      height: WidgetProperties.screenHeight(context) * 0.5,
                      child: userListWidget(context),
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

  Widget userListWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Textview2(
            title: Constants.HISTORY_TEST_TEXT,
            fontSize: 18.0,
            color: AppColors.accent3Color,
            fontWeight: FontWeight.w900,
            fontFamily: AppValues.fontFamily,
          ),
          Textview2(
            title: Constants.HISTORY_TEST_RESULT_TEXT,
            fontSize: 12.0,
            color: AppColors.backBtnColor,
            fontWeight: FontWeight.bold,
            fontFamily: AppValues.fontFamily,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 3,
            child: buildUserList(),
          ),
        ],
      ),
    );
  }

  Widget buildUserList() {
    return GetBuilder<SubjectController>(
      builder: (_) {
        if (userList == null) {
          return Center(
            child: Container(
              child: Loading(
                  indicator: BallScaleIndicator(),
                  size: 100.0,
                  color: Colors.pink),
            ),
          );
        } else if (userList.isEmpty) {
          return Center(
            child: CommonCard(
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 40, vertical: 55.0),
                    child: Text("No Data found",
                        style: TextStyle(fontSize: 25.0)))),
          );
        } else {
          return ListView.builder(
            itemCount: userList.length,
            itemBuilder: (context, index) {
              return listWidget(context, index);
            },
          );
        }
      },
    );
  }

  Widget listWidget(BuildContext buildContext, int index) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.all(5.0),
      width: 500.0,
      height: AppValues.inputFieldHeight,
      decoration: BoxDecoration(
        color: AppColors.dropdownBackgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        border: Border.all(color: AppColors.dropdownBackgroundColor),
      ),
      child: Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Textview2(
              title: "User Name",
              fontSize: 15.0,
              color: Color(0xff29abe2),
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.left,
            ),
            Textview2(
              title: userList[index].UserName,
              fontSize: 15.0,
              color: Color(0xff29abe2),
              fontWeight: FontWeight.normal,
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }

  UserListScreen() {
    getUserList();
  }

  getUserList() async {
    Result res = await subjectController.loadUserList();
    if (res != null) {
      userList = res.body;
      subjectController.updateUserBuilder();
    }
  }
}
