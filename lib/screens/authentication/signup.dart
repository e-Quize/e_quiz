import 'dart:async';

import 'package:e_quiz/common/ui_widgets/common_card.dart';
import 'package:e_quiz/common/ui_widgets/custom_button.dart';
import 'package:e_quiz/common/ui_widgets/custominput.dart';
import 'package:e_quiz/common/ui_widgets/text_view.dart';
import 'package:e_quiz/controllers/animate_view_controller.dart';
import 'package:e_quiz/controllers/user_controller.dart';
import 'package:e_quiz/models/user/user_model.dart';
import 'package:e_quiz/screens/authentication/signup2.dart';
import 'package:e_quiz/screens/common/common_background.dart';
import 'package:e_quiz/utils/animation_controller_ids.dart';
import 'package:e_quiz/utils/colors.dart';
import 'package:e_quiz/utils/constants.dart';
import 'package:e_quiz/utils/curves_custom.dart';
import 'package:e_quiz/utils/values.dart';
import 'package:e_quiz/utils/widgetproperties.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Signup extends StatelessWidget {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var userNameController = TextEditingController();
  var emailController = TextEditingController();

  var fnNode = FocusNode();
  var lnNode = FocusNode();
  var unNode = FocusNode();
  var emNode = FocusNode();

  var userController = new UserController();

  var userEntity = UserEntity();
  var height;
  var opacity = 0.0;
  bool isFormShown = false;

  var animatedController = Get.find<AnimateViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // key: Connections.scaffoldKey,
        resizeToAvoidBottomInset: true,
        body: GetBuilder<AnimateViewController>(
          initState: (s) {
            height = WidgetProperties.screenHeight(context) * 0.3;
            Timer(Duration(milliseconds: 1000), () {
              height = WidgetProperties.screenHeight(context) * 0.5;
              animatedController
                  .update([AnimationControllerIds.instance.signUp1]);
            });
          },
          init: animatedController,
          id: AnimationControllerIds.instance.signUp1,
          builder: (_) {
            return Stack(
              children: [
                BodyBackground(
                  heightTop: WidgetProperties.screenHeight(context) *
                      AppValues.commonBGHeight,
                  heightBottom: WidgetProperties.screenHeight(context) *
                      AppValues.commonBGHeight,
                  body: Container(),
                ),
                Positioned(
                  top: 40.0,
                  child: AnimatedOpacity(
                    opacity: opacity,
                    curve: Curves.easeIn,
                    duration: Duration(milliseconds: 600),
                    child: Container(
                      height: 100.0,
                      margin: EdgeInsets.only(
                        left: AppValues.horizontalMargin,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Textview2(
                            title: Constants.CREATE_ACCOUNT_TEXT,
                            fontSize: 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.left,
                          ),
                          Textview2(
                            title: Constants.NEW_USER_TEXT,
                            fontSize: 12.0,
                            color: AppColors.subTitleColor,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.left,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10.0),
                            child: LinearPercentIndicator(
                              alignment: MainAxisAlignment.start,
                              width:
                                  WidgetProperties.screenWidth(context) / 1.3,
                              lineHeight: 10.0,
                              percent: 0.50,
                              //padding: EdgeInsets.only(left: 8.0, top: 10.0),
                              progressColor: AppColors.progressbarColor,
                              animation: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: AppValues.horizontalMargin,
                              right: AppValues.horizontalMargin,
                              bottom: 25.0,
                              top: 20.0),
                          child: CommonCard(
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 15.0),
                                  child: Textview2(
                                    title: '',
                                    fontSize: 20.0,
                                    color: AppColors.textBlackColor,
                                    fontWeight: FontWeight.bold,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                AnimatedContainer(
                                  onEnd: () {
                                    opacity = 1.0;
                                    isFormShown = true;
                                    animatedController.update([
                                      AnimationControllerIds.instance.signUp1
                                    ]);
                                  },
                                  duration: Duration(milliseconds: 300),
                                  height: height,
                                  child: GetBuilder<UserController>(
                                    init: userController,
                                    builder: (_) {
                                      return isFormShown
                                          ? getForm(context)
                                          : Container();
                                    },
                                  ),
                                ),
                                AnimatedOpacity(
                                  opacity: opacity,
                                  curve: BackOutCurve(),
                                  duration: Duration(milliseconds: 600),
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom:8.0),
                                    child: Transform.translate(
                                      offset: Offset(0.0, -5.0),
                                      child: Container(
/*transform: Matrix4.translationValues(
0.0, 20.0, 0.0),*/
                                        margin: EdgeInsets.symmetric(
                                            horizontal:
                                            AppValues.horizontalMarginForm),
                                        child: Container(
                                          child: HeroButton(
                                            width: WidgetProperties.screenWidth(
                                                context),
                                            height: 40.0,
                                            radius: 22.0,
                                            gradient:
                                            AppColors.formContinueButtomColor,
                                            title: 'Next',
                                            onPressed: () => signupUser(context),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }

  Widget getForm(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        children: [
          FormInput(
            errorText: userController.validityFirstName.message,
            hint: 'First Name',
            hintColor: AppColors.commoneadingtextColor,
            onSaved: (value) {
              userController.checkFirstName(value);
              userController.updateUserBuilder();
            },
            formatter: FilteringTextInputFormatter.allow(
              RegExp("[A-Z a-z _ .]"),
            ),
            obsecureText: false,
            maxLength: 50,
            myController: firstNameController,
            focusNode: fnNode,
          ),
          FormInput(
            errorText: userController.validityLastName.message,
            hint: 'Last Name',
            hintColor: AppColors.commoneadingtextColor,
            onSaved: (value) {
              userController.checkLastName(value);
              userController.updateUserBuilder();
            },
            formatter: FilteringTextInputFormatter.allow(
              RegExp("[A-Z a-z _ .]"),
            ),
            obsecureText: false,
            maxLength: 50,
            myController: lastNameController,
            focusNode: lnNode,
          ),
          FormInput(
            errorText: userController.validityUserName.message,
            hint: 'User Name',
            hintColor: AppColors.commoneadingtextColor,
            onSaved: (value) {
              userController.checkUsername(value);
              userController.updateUserBuilder();
            },
            formatter: FilteringTextInputFormatter.allow(
              RegExp("[A-Z a-z _ . @ 0-9]"),
            ),
            obsecureText: false,
            maxLength: 50,
            myController: userNameController,
            focusNode: unNode,
          ),
          FormInput(
            errorText: userController.validityEmail.message,
            hint: 'Email',
            hintColor: AppColors.commoneadingtextColor,
            onSaved: (value) {
              userController.checkEmail(value);
              userController.updateUserBuilder();
            },
            formatter: FilteringTextInputFormatter.allow(
              RegExp("[A-Z a-z _ . @ 0-9]"),
            ),
            obsecureText: false,
            maxLength: 50,
            myController: emailController,
            focusNode: emNode,
          ),
        ],
      ),
    );
  }

  signupUser(BuildContext buildContext) {
    userEntity.FirstName = firstNameController.text;
    userEntity.LastName = lastNameController.text;
    userEntity.UserName = userNameController.text;
    userEntity.Email = emailController.text.trim().toString();
    if (userController.checkSignup1Validation(userEntity)) {
      WidgetProperties.goToNextPage(
          buildContext, Signup2(userEntity: userEntity));
    } else {
      animatedController.update([AnimationControllerIds.instance.signUp1]);
    }
  }
}
