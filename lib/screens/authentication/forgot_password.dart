import 'package:e_quiz/common/ui_widgets/app_logo.dart';
import 'package:e_quiz/common/ui_widgets/common_card.dart';
import 'package:e_quiz/common/ui_widgets/custom_button.dart';
import 'package:e_quiz/common/ui_widgets/custominput.dart';
import 'package:e_quiz/common/ui_widgets/text_view.dart';
import 'package:e_quiz/controllers/forgot_password_controller.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/models/user/user_model.dart';
import 'package:e_quiz/screens/common/common_background.dart';
import 'package:e_quiz/utils/colors.dart';
import 'package:e_quiz/utils/constants.dart';
import 'package:e_quiz/utils/dialog/toastclass.dart';
import 'package:e_quiz/utils/values.dart';
import 'package:e_quiz/utils/widgetproperties.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatelessWidget {
  var forgotPasswordController = ForgotPasswordController();

  var userEmailController = TextEditingController();
  var userNameController = TextEditingController();

  var userEmailNode = FocusNode();
  var userNameNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  var userEntity = UserEntity();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: Connections.scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: Stack(
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
            left: 0.0,
            right: 0.0,
            child: AppLogo(),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: AppValues.horizontalMargin,
                        right: AppValues.horizontalMargin,
                        top: 20.0),
                    child: CommonCard(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 15.0),
                            child: Textview2(
                              title: Constants.FORGOT_PASSWORD,
                              fontSize: 20.0,
                              color: AppColors.textBlackColor,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            height:
                                WidgetProperties.screenHeight(context) * 0.3,
                            child: GetBuilder<ForgotPasswordController>(
                              init: forgotPasswordController,
                              builder: (_) {
                                return Form(
                                  key: _formKey,
                                  autovalidateMode: AutovalidateMode.disabled,
                                  child: Column(
                                    children: [
                                      FormInput(
                                        errorText: forgotPasswordController
                                            .validityUserName.message,
                                        hint: 'UserName',
                                        textInputType:
                                            TextInputType.emailAddress,
                                        hintColor:
                                            AppColors.commoneadingtextColor,
                                        onSaved: (value) {
                                          forgotPasswordController
                                              .checkUserName(value);
                                          forgotPasswordController
                                              .updateUserBuilder();
                                        },
                                        formatter:
                                            FilteringTextInputFormatter.allow(
                                          RegExp("[A-Z a-z _ . @ 0-9]"),
                                        ),
                                        obsecureText: false,
                                        maxLength: 50,
                                        myController: userNameController,
                                        focusNode: userNameNode,
                                      ),
                                      FormInput(
                                        errorText: forgotPasswordController
                                            .validityEmail.message,
                                        hint: 'Email',
                                        textInputType:
                                            TextInputType.emailAddress,
                                        hintColor:
                                            AppColors.commoneadingtextColor,
                                        onSaved: (value) {
                                          forgotPasswordController
                                              .checkEmail(value);
                                          forgotPasswordController
                                              .updateUserBuilder();
                                        },
                                        formatter:
                                            FilteringTextInputFormatter.allow(
                                          RegExp("[A-Z a-z _ . @ 0-9]"),
                                        ),
                                        obsecureText: false,
                                        maxLength: 50,
                                        myController: userEmailController,
                                        focusNode: userEmailNode,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          Container(
                            transform:
                                Matrix4.translationValues(0.0, -5.0, 0.0),
                            margin: EdgeInsets.symmetric(
                                horizontal: AppValues.horizontalMarginForm),
                            child: HeroButton(
                              width: WidgetProperties.screenWidth(context),
                              height: 40.0,
                              radius: 22.0,
                              gradient: AppColors.formContinueButtomColor,
                              title: Constants.SUBMIT_TEXT,
                              onPressed: () {
                                forgotPassword(context);
                              },
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
      ),
    );
  }

  forgotPassword(BuildContext buildContext) async {
    userEntity.Email = userEmailController.text;
    userEntity.UserName = userNameController.text;
    if (forgotPasswordController.checkForgotPasswordValidation(userEntity)) {
      Result result = await forgotPasswordController.forgotPassword(userEntity);
      var res = result.body as UserEntity;
      if (res != null) {
        if (res.ComRes.ResponseId == -1) {
          ToastClass.showToast(res.ComRes.ResponseMessage, ToastGravity.BOTTOM,
              Colors.red, Colors.white, 10.0, Toast.LENGTH_SHORT);
        } else if (res.ComRes.ResponseId > 0) {
          ToastClass.showToast(res.ComRes.ResponseMessage, ToastGravity.BOTTOM,
              Colors.green, Colors.white, 10.0, Toast.LENGTH_SHORT);
          Navigator.of(buildContext).pop();
        }
      }
    } else {
      forgotPasswordController.updateUserBuilder();
    }
  }
}
