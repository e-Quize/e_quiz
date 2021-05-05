import 'package:e_quiz/common/ui_widgets/custom_button.dart';
import 'package:e_quiz/common/ui_widgets/text_view.dart';
import 'package:e_quiz/controllers/subject_controller.dart';
import 'package:e_quiz/screens/common/common_background.dart';
import 'package:e_quiz/screens/quizscreens/self_quiz_screen.dart';
import 'package:e_quiz/screens/quizscreens/competition_quiz_screen.dart';
import 'package:e_quiz/utils/colors.dart';
import 'package:e_quiz/utils/constants.dart';
import 'package:e_quiz/utils/dialog/toastclass.dart';
import 'package:e_quiz/utils/values.dart';
import 'package:e_quiz/utils/widgetproperties.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class StartTestScreen extends StatelessWidget {
  var subjectController = Get.find<SubjectController>();
  Widget checkCompetitionWidget;
  var id = 0;

  var isSelfChecked = false;
  var isComptetionChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          BodyBackground(
            heightTop: WidgetProperties.screenHeight(context) * 0.4,
            heightBottom: WidgetProperties.screenHeight(context) * 0.4,
            body: Container(),
          ),
          Container(
            margin: EdgeInsets.only(top: 50.0),
            alignment: Alignment.topCenter,
            child: SvgPicture.asset(
              Constants.TEST2_IMAGE_NAME,
              height: 100.0,
              width: 100.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 135.0),
            child: Container(
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
                  child: Materialwidget(context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget Materialwidget(BuildContext context) {
    return GetBuilder<SubjectController>(
      init: subjectController,
      initState: (child) {
        subjectController.ini();
      },
      builder: (_) {
        return Container(
            margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Textview2(
                  title: Constants.START_TEST_TEXT,
                  textAlign: TextAlign.center,
                  fontSize: 20.0,
                  color: AppColors.accent3Color,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppValues.fontFamily,
                ),
                Container(
                  margin: EdgeInsets.only(top: 3.0),
                  child: Textview2(
                    title: Constants.SELF_PREPARATION_COMPETITION_TEXT,
                    fontSize: 15.0,
                    color: AppColors.backBtnColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppValues.fontFamily,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                quizTypeWidget(Constants.SELF_TEST_TEXT, Constants.SELF_QUIZ),
                SizedBox(
                  height: 15.0,
                ),
                // checkCompetitionWidget,
                quizTypeWidget(
                    Constants.COMPETITION_TEST_TEXT, Constants.COMPTETION_QUIZ),
                SizedBox(
                  height: 25.0,
                ),
                HeroButton(
                  width: 320.0,
                  height: 50.0,
                  radius: AppValues.commonButtonCornerRadius,
                  gradient: AppColors.formContinueButtomColor,
                  title: Constants.CONTINUE_BUTTON_TEXT,
                  onPressed: () {
                    if (subjectController.isQuizType != null) {
                      if (subjectController.isQuizType == false) {
                        WidgetProperties.goToNextPage(
                            context, SelfQuizScreen());
                      } else if (subjectController.isQuizType == true) {
                        WidgetProperties.goToNextPage(
                            context, CompetitionQuizScreen());
                      }
                    } else {
                      ToastClass.showToast(
                          Constants.SELECT_QUIZ_TYPE_TEXT,
                          ToastGravity.BOTTOM,
                          Colors.red,
                          Colors.white,
                          15.0,
                          Toast.LENGTH_SHORT);
                    }
                  },
                ),
              ],
            ));
      },
    );
  }

  Widget quizTypeWidget(String title, int id) {
    return Container(
      width: 500.0,
      height: AppValues.inputFieldHeight,
      decoration: BoxDecoration(
        color: AppColors.textWhiteColor,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        border: Border.all(color: AppColors.forgotPasswordTextColor),
      ),
      child: Container(
          margin: EdgeInsets.only(left: 15.0, right: 15.0),
          child: getRow(title, id)),
    );
  }

  Widget getRow(String text, int id) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              child: Textview2(
                title: text,
                fontSize: 20.0,
                color: AppColors.commoneadingtextColor,
                fontWeight: FontWeight.bold,
                fontFamily: AppValues.fontFamily,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if (id == Constants.SELF_QUIZ) {
                if (!isSelfChecked) {
                  isSelfChecked = true;
                  isComptetionChecked = !isSelfChecked;
                  subjectController.isQuizType = false;
                  subjectController.update();
                }
              } else {
                if (!isComptetionChecked) {
                  isComptetionChecked = true;
                  subjectController.isQuizType = true;
                  isSelfChecked = !isComptetionChecked;
                  subjectController.update();
                }
              }
            },
            child: Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              elevation: 6.0,
              child: Row(
                children: [
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        color: id == Constants.SELF_QUIZ
                            ? (isSelfChecked
                                ? AppColors.forgotPasswordTextColor
                                : AppColors.textWhiteColor)
                            : (isComptetionChecked
                                ? AppColors.forgotPasswordTextColor
                                : AppColors.textWhiteColor),
                        shape: BoxShape.circle),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
