import 'package:e_quiz/common/ui_widgets/custom_button.dart';
import 'package:e_quiz/common/ui_widgets/text_view.dart';
import 'package:e_quiz/screens/common/common_background.dart';
import 'package:e_quiz/screens/dashboard/dashboard_screen.dart';
import 'package:e_quiz/utils/colors.dart';
import 'package:e_quiz/utils/constants.dart';
import 'package:e_quiz/utils/values.dart';
import 'package:e_quiz/utils/widgetproperties.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatelessWidget {
  var selectedSubjectDecoration = BoxDecoration(
      color: AppColors.formContinueButtomColor,
      shape: BoxShape.circle,
      border: Border.all(color: AppColors.textWhiteColor));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: AppColors.bodyColor,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          BodyBackground(
            heightTop: WidgetProperties.screenHeight(context) * 0.5,
            heightBottom: WidgetProperties.screenHeight(context) * 0.5,
            body: Container(),
          ),
          Container(
            margin: EdgeInsets.only(top: 200.0),
            child: Container(
              margin: EdgeInsets.only(
                  left: AppValues.horizontalMargin,
                  right: AppValues.horizontalMargin,
                  top: 60.0),
              child: Material(
                elevation: AppValues.cardElevation,
                color: Color(0xfff2f2f2),
                borderRadius: BorderRadius.all(
                    Radius.circular(AppValues.commonBodyCardRadius)),
                child: Container(
                  height: WidgetProperties.screenHeight(context) * 0.3,
                  child: form(context),
                ),
              ),
            ),
          ),
          Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 230.0),
              height: 70,
              width: 70,
              decoration: selectedSubjectDecoration,
              child: SvgPicture.asset(
                Constants.BASE_PATH_ICON + "check.svg",
                height: 35.0,
                width: 35.0,
              )),
        ],
      ),
    );
  }

  Widget form(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
      child: Column(
        children: [
          Textview2(
            title: "Welcome To EQUIZ!",
            textAlign: TextAlign.center,
            fontSize: 20.0,
            color: AppColors.backBtnColor,
            fontWeight: FontWeight.w900,
            fontFamily: AppValues.fontFamily,
          ),
          Container(
            child: Textview2(
              title: "you are successfully signup",
              textAlign: TextAlign.center,
              fontSize: 14.0,
              color: AppColors.forgotPasswordTextColor,
              fontWeight: FontWeight.bold,
              fontFamily: AppValues.fontFamily,
            ),
          ),
          Container(
            child: Textview2(
              title: "Enjoy Your login",
              textAlign: TextAlign.center,
              fontSize: 15.0,
              color: AppColors.backBtnColor,
              fontWeight: FontWeight.bold,
              fontFamily: AppValues.fontFamily,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 35.0),
            child: HeroButton(
              width: 320.0,
              height: 40.0,
              radius: AppValues.commonButtonCornerRadius,
              gradient: AppColors.primaryColor,
              title: 'Start Now',
              onPressed: () {
                WidgetProperties.goToNextPage(
                  context,
                  DashboardScreen(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class CustomPaymentMethod {}
