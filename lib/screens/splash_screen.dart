import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:e_quiz/common/exception_manager/exception_codes_messages.dart';
import 'package:e_quiz/controllers/animate_view_controller.dart';
import 'package:e_quiz/controllers/splash_controller.dart';
import 'package:e_quiz/db/user_crud.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/models/splash/mobile_connect.dart';
import 'package:e_quiz/models/user/user_entity_copy.dart';
import 'package:e_quiz/screens/authentication/signin_screen.dart';
import 'package:e_quiz/screens/dashboard/dashboard_screen.dart';
import 'package:e_quiz/screens/history/subject_history_screen.dart';
import 'package:e_quiz/screens/notification/notification_plugin.dart';
import 'package:e_quiz/screens/quizscreens/question_screen.dart';
import 'package:e_quiz/utils/animation_controller_ids.dart';
import 'package:e_quiz/utils/checkInternetconnectivity.dart';
import 'package:e_quiz/utils/colors.dart';
import 'package:e_quiz/utils/widgetproperties.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var splashController = SplashController();
  Result result;
  String _base64LogoString;
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  var animatedController = Get.put(AnimateViewController());
  var opacity = 0.0;
  UserEntityCopy userEntityCopy;
  @override
  void initState() {
    super.initState();

    // internetConnection();

    checkUserToken();
    // getRefreshToken();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    splashController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppColors.primaryBtnColor,
      body: GetBuilder<AnimateViewController>(
        init: animatedController,
        id: AnimationControllerIds.instance.splashId,
        builder: (_) {
          return Container(
            child: Center(
              child: AnimatedOpacity(
                opacity: opacity,
                curve: AnimationControllerIds.instance.splashLogoOpacityCurve,
                duration:
                    AnimationControllerIds.instance.splashLogoOpacityTimer,
                child: Container(
                  alignment: Alignment.center,
                  child: imageFromBase64String(_base64LogoString),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget imageFromBase64String(String base64String) {
    if (base64String == null) return new Container();
    Uint8List bytes = base64Decode(base64String);
    return Image.memory(
      bytes,
      width: 150.0,
      height: 150.0,
    );
  }

  void checkUserToken() async {
    userEntityCopy = await UserCrud.getUserCopy();
    if (userEntityCopy.Token != null) {
      getSettings(DashboardScreen());
    } else {
      getSettings(SigninScreen());
    }
  }

  getSettings(Widget widget) async {
    Result result = await splashController.getSiteSettings();
    var data = result.body as MobileConnectResponse;
    if (data != null) {
      opacity = AnimationControllerIds.instance.commonOpacity;
      _base64LogoString = data.Logo;
      animatedController.update([AnimationControllerIds.instance.splashId]);
      if(userEntityCopy.Token!=null){
        notificationIsRead();
      }
      if (result.code != Exceptions.UNATHORIZED_CODE) {
        Timer(
          Duration(seconds: 4),
          () => WidgetProperties.goToNextPageWithReplacement(context, widget),
        );
      }
    }
  }

  getRefreshToken() async {
    UserEntityCopy userEntityCopy = await UserCrud.getUserCopy();
    if (userEntityCopy.Token != null) {
      getSettings(DashboardScreen());
    } else {
      getSettings(SigninScreen());
    }
  }

  notificationIsRead() async {
    Result result = await splashController.notificationIsRead();
    splashController.update();
  }

  internetConnection() async {
    await Connections().checkConnectivity().then((internet) {
      if (internet != null && internet == false) {
        createSnackBar(context);
        return;
      }
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

  Future<void> init() async {
    // For iOS request permission first.
    _firebaseMessaging.requestNotificationPermissions();

    // For testing purposes print the Firebase Messaging token
    String token = await _firebaseMessaging.getToken();
    print("FirebaseMessaging token: $token");
  }
}
