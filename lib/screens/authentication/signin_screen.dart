import 'package:e_quiz/common/ui_widgets/app_logo.dart';
import 'package:e_quiz/common/ui_widgets/common_card.dart';
import 'package:e_quiz/common/ui_widgets/custom_button.dart';
import 'package:e_quiz/db/user_crud.dart';
import 'package:e_quiz/common/ui_widgets/custominput.dart';
import 'package:e_quiz/common/ui_widgets/text_view.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:e_quiz/utils/checkInternetconnectivity.dart';
import 'package:e_quiz/models/user/user_entity_copy.dart';
import 'package:e_quiz/controllers/user_controller.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/models/user/common_result.dart';
import 'package:e_quiz/models/user/user_model.dart';
import 'package:e_quiz/screens/authentication/forgot_password.dart';
import 'package:e_quiz/screens/authentication/signup.dart';
import 'package:e_quiz/screens/common/common_background.dart';
import 'package:e_quiz/screens/dashboard/dashboard_screen.dart';
import 'package:e_quiz/screens/subscriptions/subscription_screen.dart';
import 'package:e_quiz/utils/colors.dart';
import 'package:e_quiz/utils/constants.dart';
import 'package:e_quiz/utils/dialog/toastclass.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:e_quiz/utils/values.dart';
import 'package:e_quiz/utils/widgetproperties.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:get/get.dart';


class SigninScreen extends StatelessWidget {
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String token = "";

  var user1Controller = UserController();
  var userEntity = UserEntity();

  var unNode = FocusNode();
  var pNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: scaffoldKey,
      resizeToAvoidBottomInset: true,
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
            child: SingleChildScrollView(
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
                                title: 'Sign In',
                                fontSize: 20.0,
                                color: AppColors.textBlackColor,
                                fontWeight: FontWeight.bold,
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Container(
                              height:
                              WidgetProperties.screenHeight(context) * 0.3,
                              child: GetBuilder<UserController>(
                                init: user1Controller,
                                initState: (child) {
                                  init();
                                  // internetConnection(context);
                                },
                                builder: (userController) {
                                  return Form(
                                    autovalidateMode: AutovalidateMode.disabled,
                                    child: Column(
                                      children: [
                                        FormInput(
                                          errorText: userController
                                              .validityUserName.message,
                                          hint: 'Username',
                                          hintColor:
                                          AppColors.commoneadingtextColor,
                                          onSaved: (value) {
                                            userController.checkUsername(value);
                                            userController.updateUserBuilder();
                                          },
                                          formatter:
                                          FilteringTextInputFormatter.allow(
                                            RegExp("[A-Z a-z _ . @ 0-9]"),
                                          ),
                                          obsecureText: false,
                                          maxLength: 50,
                                          myController: userNameController,
                                          focusNode: unNode,
                                        ),
                                        FormInput(
                                          errorText: userController
                                              .validityPassword.message,
                                          hint: 'Password',
                                          hintColor:
                                          AppColors.commoneadingtextColor,
                                          onSaved: (value) {
                                            userController.checkPassword(value);
                                            userController.updateUserBuilder();
                                          },
                                          formatter:
                                          FilteringTextInputFormatter.allow(
                                            RegExp("[A-Z a-z _ . @ 0-9]"),
                                          ),
                                          obsecureText: true,
                                          maxLength: 50,
                                          myController: passwordController,
                                          focusNode: pNode,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 10.0, left: 20.0, right: 20.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  WidgetProperties.goToNextPage(
                                                      context, ForgotPassword());
                                                },
                                                child: Textview2(
                                                  title: 'Forgot Password',
                                                  fontSize: 12.0,
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.bold,
                                                  textAlign: TextAlign.left,
                                                ),
                                              ),
                                              GestureDetector(
                                                behavior:
                                                HitTestBehavior.translucent,
                                                onTap: () {
                                                  WidgetProperties.goToNextPage(
                                                      context, Signup());
                                                },
                                                child: Textview2(
                                                  title: 'Register Now',
                                                  fontSize: 12.0,
                                                  color: AppColors.accentColor1,
                                                  fontWeight: FontWeight.bold,
                                                  textAlign: TextAlign.left,
                                                ),
                                              ),
                                            ],
                                          ),
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
                                gradient: AppColors.primaryBtnColor,
                                title: 'Sign In',
                                onPressed: () {
                                  signIn(context);
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
          ),
        ],
      ),
    );
  }

  signIn(BuildContext buildContext) async {
    var userEntityCopy = UserEntityCopy();
    userEntity.UserName = userNameController.text;
    userEntity.Password = passwordController.text;

    //
    if (!token.isNullOrBlank) userEntity.DeviceFCMToken = token;
    print(token);

    userEntityCopy.DeviceFCMToken = userEntity.DeviceFCMToken;
    // await UserCrud.insertUser(userEntityCopy);

    if (user1Controller.checkSigninValidation(userEntity)) {
      Result res = await user1Controller.validateUserCredentials(userEntity);
      var userData = res.body as UserEntity;
      if (userData != null) {
        if (userData.ComRes.ResponseId == 0) {
          ToastClass.showToast(
              userData.ComRes.ResponseMessage,
              ToastGravity.BOTTOM,
              Colors.red,
              Colors.white,
              15.0,
              Toast.LENGTH_SHORT);
        } else if (userData.ComRes.ResponseId > 0) {
          if (userData.SubjectIdsString != null) {
            if (userData.SubjectIdsString.isNotEmpty) {
              WidgetProperties.goToNextPageWithReplacement(
                  buildContext, DashboardScreen());
            } else {
              WidgetProperties.goToNextPageWithReplacement(
                  buildContext, SubscriptionScreen());
            }
          } else {
            WidgetProperties.goToNextPageWithReplacement(
                buildContext, SubscriptionScreen());
          }
        } else if (userData.ComRes.ResponseId == -111) {
          showDialog(buildContext);
        } else if (userData.ComRes.ResponseId == -1) {
          ToastClass.showToast(
              userData.ComRes.ResponseMessage,
              ToastGravity.BOTTOM,
              Colors.red,
              Colors.white,
              15.0,
              Toast.LENGTH_SHORT);
        }
      }
    } else {
      user1Controller.updateUserBuilder();
    }
  }

  Future<void> init() async {
    // For iOS request permission first.
    _firebaseMessaging.requestNotificationPermissions();
    _firebaseMessaging.configure();

    // For testing purposes print the Firebase Messaging token
    token = await _firebaseMessaging.getToken();
    _firebaseMessaging.subscribeToTopic('equiz');
    print("FirebaseMessaging token: $token");
  }

  logoutUserFromAllDevices(BuildContext buildContext) async {
    Result logoutFromAllDevicesresult =
        await user1Controller.logoutUserFromAllDevices();
    var logoutFromAllDevicesData =
        logoutFromAllDevicesresult.body as CommonResult;
    if (logoutFromAllDevicesData != null) {
      // WidgetProperties.goToNextPage(buildContext, DashboardScreen());
      signIn(Get.context);
    } else {
      ToastClass.showToast("There is something went wrong", ToastGravity.BOTTOM,
          Colors.red, Colors.white, 15.0, Toast.LENGTH_SHORT);
    }
  }

  internetConnection(BuildContext buildContext) async {
    await Connections().checkConnectivity().then((internet) {
      if (internet != null && internet) {
        createSnackBar(buildContext);
        return;
      }
      // No-Internet Case
    });
  }

  createSnackBar(BuildContext buildContext) {
    final snackBar = SnackBar(
      content: Text(
        "No Internet Connected",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      backgroundColor: Colors.red,
      padding: EdgeInsets.all(20.0),
      elevation: 20.0,
    );
    scaffoldKey.currentState.showSnackBar(snackBar);
    return;
  }

  showDialog(BuildContext buildContext) {
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
            height: MediaQuery.of(buildContext).size.height / 6,
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            padding: EdgeInsets.only(top: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Textview2(
                  textDecoration: TextDecoration.none,
                  title: Constants.LOGOUT_FROM_ALL_DEVICES_TEXT,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20.0),
                        child: HeroButton(
                          height: 30.0,
                          width: 120,
                          radius: AppValues.commonButtonCornerRadius,
                          gradient: AppColors.formContinueButtomColor,
                          title: Constants.YES_TEXT,
                          onPressed: () {
                            logoutUserFromAllDevices(buildContext);
                          },
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 0.60,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20.0),
                        child: HeroButton(
                          height: 30.0,
                          width: 120,
                          radius: AppValues.commonButtonCornerRadius,
                          gradient: AppColors.formContinueButtomColor,
                          title: Constants.NO_TEXT,
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
