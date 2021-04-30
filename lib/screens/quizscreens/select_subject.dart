import 'package:e_quiz/common/ui_widgets/closed_button.dart';
import 'package:e_quiz/common/ui_widgets/hero_button3.dart';
import 'package:e_quiz/common/ui_widgets/text_view.dart';
import 'package:e_quiz/controllers/user_controller.dart';
import 'package:e_quiz/screens/common/common_background.dart';
import 'package:e_quiz/utils/colors.dart';
import 'package:e_quiz/utils/constants.dart';
import 'package:e_quiz/utils/values.dart';
import 'package:e_quiz/utils/widgetproperties.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class SelectSubject extends StatelessWidget {
  var userController = UserController();
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  String dropdownValue = "";
  List<String> subjects = ["Math", "English", "Chemistry", "Urdu", "Biology"];
  var selectedSubjectDecoration = BoxDecoration(
      color: AppColors.dropdownBackgroundColor,
      borderRadius: BorderRadius.circular(7.0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          BodyBackground(
            heightTop: WidgetProperties.screenHeight(context) * 0.3,
            heightBottom: WidgetProperties.screenHeight(context) * 0.5,
            body: Container(),
          ),
          Container(
            alignment: Alignment.topCenter,
            child: SvgPicture.asset(
              Constants.BASE_PATH_IMAGE + "test.svg",
              height: 120.0,
              width: 150.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 95.0),
            child: Column(
              children: [
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
                      height: WidgetProperties.screenHeight(context) * 0.6,
                      child: form(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.primaryBtnColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }

  Widget form(BuildContext context) {
    return GetBuilder<UserController>(
      init: userController,
      builder: (_) {
        return Form(
          key: _key,
          autovalidateMode: AutovalidateMode.disabled,
          child: Container(
            margin: EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Textview2(
                  title: "Select Your Subjects",
                  fontSize: 18.0,
                  color: AppColors.accent3Color,
                  fontWeight: FontWeight.w900,
                  fontFamily: AppValues.fontFamily,
                ),
                Textview2(
                  title: "you can select and view your subjects",
                  fontSize: 12.0,
                  color: AppColors.textBlackColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppValues.fontFamily,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  child: buildList(),
                ),
                Container(
                  margin: EdgeInsets.only(top: 60.0),
                  child: HeroButton3(
                    height: 45.0,
                    radius: AppValues.commonButtonCornerRadius,
                    gradient: AppColors.primaryBtnColor,
                    title: 'Start Now',
                    onPressed: () {
                      showDialog(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildList() {
    return ListView.builder(
      itemCount: subjects.length,
      itemBuilder: (context, index) {
        return listWidget(context, index);
      },
    );
  }

  Widget listWidget(BuildContext buildContext, int index) {
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Textview2(
                    title: subjects[index],
                    fontSize: 15.0,
                    color: AppColors.textBlackColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppValues.fontFamily,
                  ),
                ),
                Container(
                  child: SvgPicture.asset(
                    Constants.BASE_PATH_IMAGE + "eye.svg",
                    height: 15.0,
                    width: 15.0,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 5.0),
                  height: 25.0,
                  width: 3.0,
                  color: Colors.black.withOpacity(0.1),
                ),
                Container(
                  padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: SvgPicture.asset(
                    Constants.BASE_PATH_IMAGE + "plus.svg",
                    height: 15.0,
                    width: 15.0,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: AppColors.primaryBtnColor,
            height: 1.5,
          )
        ],
      ),
    );
  }

  void showDialog(BuildContext buildContext) {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 400),
      context: buildContext,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.center,
          child: Container(
            height: 400,
            width: 330.0,
            child: Material(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              child: Container(
                margin: EdgeInsets.only(left: 18.0, right: 10.0, top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Textview2(
                        title: "Physics",
                        fontSize: 25.0,
                        color: AppColors.forgotPasswordTextColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: AppValues.fontFamily,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(buildContext).size.height / 3,
                      child: buildChildList(),
                    ),
                    Container(
                        child: ClosedButton(
                      height: 45.0,
                      textColor: AppColors.textWhiteColor,
                      radius: AppValues.commonButtonCornerRadius,
                      gradient: AppColors.progressbarColor,
                      title: 'Closed',
                      onPressed: () {},
                    ))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  buildChildList() {
    return ListView.builder(
      itemCount: subjects.length,
      itemBuilder: (context, index) {
        return childListWidget(context, index);
      },
    );
  }

  Widget childListWidget(BuildContext buildContext, int index) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Row(
              children: [
                Textview2(
                  title: "Chapter 1 > Topic",
                  fontSize: 15.0,
                  color: AppColors.forgotPasswordTextColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppValues.fontFamily,
                ),
              ],
            ),
          ),
          Divider(
            color: AppColors.primaryBtnColor,
            height: 1.5,
          )
        ],
      ),
    );
  }
}
