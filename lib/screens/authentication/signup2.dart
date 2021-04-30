import 'package:e_quiz/common/ui_widgets/common_card.dart';
import 'package:e_quiz/common/ui_widgets/custom_button.dart';
import 'package:e_quiz/common/ui_widgets/custominput2.dart';
import 'package:e_quiz/common/ui_widgets/text_view.dart';
import 'package:e_quiz/controllers/animate_view_controller.dart';
import 'package:e_quiz/controllers/user_controller.dart';
import 'package:e_quiz/db/repositiories/user_repository.dart';
import 'package:e_quiz/models/user/user_model.dart';
import 'package:e_quiz/screens/common/common_background.dart';
import 'package:e_quiz/utils/animation_controller_ids.dart';
import 'package:e_quiz/utils/colors.dart';
import 'package:e_quiz/utils/constants.dart';
import 'package:e_quiz/utils/curves_custom.dart';
import 'package:e_quiz/utils/dialog/toastclass.dart';
import 'package:e_quiz/utils/values.dart';
import 'package:e_quiz/utils/widgetproperties.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'dropdown_country_widget.dart';
import 'dropdown_timezone_widget.dart';
import 'package:e_quiz/models/common/result_model.dart';

class Signup2 extends StatelessWidget {

  var userEntity = UserEntity();


  // In the constructor, require a Todo.
  Signup2({this.userEntity});

  DatabaseReference databaseReference1;

  var userController = Get.find<UserController>();
  var passwordController = TextEditingController();

  var countryController = TextEditingController();

  var userKey;

  var phoneController = TextEditingController();

  var pNode = FocusNode();

  var ctyNode = FocusNode();

  var pnNode = FocusNode();
  var opacity = 1.0;
  bool isFormShown = true;

  var animatedController = Get.find<AnimateViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: Connections.scaffoldKey,
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
                      title: Constants.PAYMENT_SCREENSHOT_TEXT,
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
                        width: WidgetProperties.screenWidth(context) / 1.3,
                        lineHeight: 10.0,
                        percent: 1.0,
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
                mainAxisSize: MainAxisSize.min,
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
                              animatedController.update(
                                  [AnimationControllerIds.instance.signUp1]);
                            },
                            duration: Duration(milliseconds: 300),
                            height:
                                WidgetProperties.screenHeight(context) * 0.5,
                            child: GetBuilder<UserController>(
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
                              padding: const EdgeInsets.only(bottom: 8.0),
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
                                      width:
                                          WidgetProperties.screenWidth(context),
                                      height: 40.0,
                                      radius: 22.0,
                                      gradient:
                                          AppColors.formContinueButtomColor,
                                      title: 'Register',
                                      onPressed: () => signupUser2(context),
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
      ),
    );
  }

  Widget getForm(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FormInput2(
            errorText: userController.validityPassword.message,
            onPressed: () {
              userController
                  .updatePasswordVisibility(!userController.showPassword);
              userController.updateUserBuilder();
            },
            iconData: userController.showPassword
                ? Icons.visibility_sharp
                : Icons.visibility_off_sharp,
            hint: 'Password',
            hintColor: AppColors.commoneadingtextColor,
            onSaved: (value) {
              userController.checkPassword(value);
              userController.updateUserBuilder();
            },
            formatter: FilteringTextInputFormatter.allow(
              RegExp("[A-Z a-z _ . @ 0-9]"),
            ),
            obsecureText: !userController.showPassword,
            maxLength: 25,
            myController: passwordController,
            focusNode: pNode,
          ),
          FormInput2(
            hint: 'Phone Number',
            errorText: userController.validityPhone.message,
            hintColor: AppColors.commoneadingtextColor,
            onSaved: (value) {
              userController.checkPhone(value);
              userController.updateUserBuilder();
            },
            formatter: FilteringTextInputFormatter.allow(
              RegExp("[0-9]"),
            ),
            obsecureText: false,
            maxLength: 15,
            myController: phoneController,
            focusNode: pnNode,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 450),
                  transitionsBuilder:
                      (context, animation, animationTime, child) {
                    return ScaleTransition(
                      alignment: Alignment.center,
                      scale: animation,
                      child: child,
                    );
                  },
                  pageBuilder: (context, animation, animationTime) {
                    return DropDownCountryWidget();
                  },
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Textview2(
                    title: userController.currentSelectedCountry.isNullOrBlank
                        ? "Please Select your Country"
                        : userController.currentSelectedCountry.Name,
                    fontSize: 10.0,
                    color: AppColors.forgotPasswordTextColor,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.left,
                  ),
                  Icon(
// Add this
                    Icons.arrow_forward_ios, // Add this
                    color: Colors.grey,
                    size: 15,
// Add this
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 450),
                  transitionsBuilder:
                      (context, animation, animationTime, child) {
                    return ScaleTransition(
                      alignment: Alignment.center,
                      scale: animation,
                      child: child,
                    );
                  },
                  pageBuilder: (context, animation, animationTime) {
                    return DropDownTimezoneWidget();
                  },
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Textview2(
                    title: userController.currentSelectedTimeZone.isNullOrBlank
                        ? "Please Select your Timezone"
                        : userController.currentSelectedTimeZone.DisplayName,
                    fontSize: 10.0,
                    color: AppColors.forgotPasswordTextColor,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.left,
                  ),
                  Icon(
// Add this
                    Icons.arrow_forward_ios, // Add this
                    color: Colors.grey,
                    size: 15,
// Add this
                  ),
                ],
              ),
            ),
          ),
          // Container(
          //   margin: EdgeInsets.only(
          //       left: AppValues.horizontalMarginForm,
          //       right: AppValues.horizontalMarginForm,
          //       top: 10.0
          //       //right: AppValues.horizontalMargin,
          //       ),
          //   child: Row(
          //     children: [
          //       Textview2(
          //         title: 'By creating an account you agree to our',
          //         fontSize: 9.0,
          //         color: AppColors.commoneadingtextColor,
          //         fontWeight: FontWeight.bold,
          //         textAlign: TextAlign.left,
          //       ),
          //       Textview2(
          //         title: ' Terms and Conditions',
          //         fontSize: 10.0,
          //         color: Color(0xff29abe2),
          //         fontWeight: FontWeight.bold,
          //         textAlign: TextAlign.left,
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  signupUser2(BuildContext context) async {
    userEntity.FirstName = userEntity.FirstName;
    userEntity.LastName = userEntity.LastName;
    userEntity.UserName = userEntity.UserName;
    userEntity.Email = userEntity.Email;
    userEntity.ContactNumber = phoneController.text;
    userEntity.Password = passwordController.text;

    if (!userController.currentSelectedCountry.isBlank)
      userEntity.Country = userController.currentSelectedCountry.Id ?? 0;
    if (!userController.currentSelectedTimeZone.isNullOrBlank)
      userEntity.TimeZoneId = userController.currentSelectedTimeZone.TimeZoneID;

    if (userEntity.Country.isBlank) {
      ToastClass.showToast(Constants.SELECT_COUNTRY_TEXT, ToastGravity.BOTTOM,
          Colors.red, Colors.white, 15.0, Toast.LENGTH_SHORT);
    }
    if (userEntity.TimeZoneId.isBlank) {
      ToastClass.showToast(Constants.SELECT_TIMEZONE_TEXT, ToastGravity.BOTTOM,
          Colors.red, Colors.white, 15.0, Toast.LENGTH_SHORT);
    }

    if (userController.checkSignup2Validation(userEntity) &&
        !userEntity.Country.isBlank &&
        !userEntity.TimeZoneId.isBlank) {
      databaseReference1 = FirebaseDatabase.instance.reference();
      String newkey =
          databaseReference1.reference().child(Constants.USER_TABLE).push().key;
      databaseReference1.child(Constants.USER_TABLE).child(newkey).set({
        "ContactNumber": userEntity.ContactNumber,
        "Country": userEntity.Country,
        "Email": userEntity.Email,
        "FirstName": userEntity.FirstName,
        "LastName": userEntity.LastName,
        "Password": userEntity.Password,
        "TimeZoneId": userEntity.TimeZoneId,
        "UserName": userEntity.UserName,
      });
      userEntity.FbUserId = newkey;
      // await _userRepository.insertUser(userEntity);

      Result result = await userController.signUpUser(userEntity);
      if (result != null) {
        var userResultData = result.body as UserEntity;
        if (userResultData != null) {
          if (userResultData.ComRes.ResponseId == -1) {
            ToastClass.showToast(
                userResultData.ComRes.ResponseMessage,
                ToastGravity.BOTTOM,
                Colors.red,
                Colors.white,
                10.0,
                Toast.LENGTH_LONG);
          } else if (userResultData.ComRes.ResponseId > 0) {
            ToastClass.showToast(
                "You Have Registered Successfully",
                ToastGravity.BOTTOM,
                Colors.green,
                Colors.white,
                10.0,
                Toast.LENGTH_LONG);
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          }
        }
      }
    } else {
      userController.updateUserBuilder();
    }
  }
}
