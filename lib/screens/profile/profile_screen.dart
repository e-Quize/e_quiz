import 'package:e_quiz/common/ui_widgets/custom_button.dart';
import 'package:e_quiz/common/ui_widgets/text_view.dart';
import 'package:e_quiz/controllers/user_controller.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/models/user/user_model.dart';
import 'package:e_quiz/screens/authentication/signin_screen.dart';
import 'package:e_quiz/screens/common/common_background.dart';
import 'package:e_quiz/screens/profile/update_profile_screen.dart';
import 'package:e_quiz/utils/colors.dart';
import 'package:e_quiz/utils/constants.dart';
import 'package:e_quiz/utils/dialog/loadingcircle/lib/ball_scale_indicator.dart';
import 'package:e_quiz/utils/dialog/loadingcircle/loading.dart';
import 'package:e_quiz/utils/dialog/toastclass.dart';
import 'package:e_quiz/utils/values.dart';
import 'package:e_quiz/utils/widgetproperties.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ProfileScreen extends StatelessWidget {
  var userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          BodyBackground(
            heightTop: WidgetProperties.screenHeight(context) * 0.3,
            body: Container(),
          ),
          GetBuilder<UserController>(
            initState: (child) {
              getUserProfile();
            },
            init: userController,
            builder: (_) {
              if (userController.userEntity == null) {
                return Center(
                  child: Container(
                    child: Loading(
                        indicator: BallScaleIndicator(),
                        size: 100.0,
                        color: Colors.pink),
                  ),
                );
              } else {
                return Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Textview2(
                          title: Constants.PROFILE_TEXT,
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
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
                            borderRadius: BorderRadius.all(Radius.circular(
                                AppValues.commonBodyCardRadius)),
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 22.0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Textview2(
                                          title: Constants.INFORMATION_TEXT,
                                          fontSize: 15.0,
                                          color:
                                          AppColors.commoneadingtextColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        IconButton(
                                            icon: Icon(Icons.create_sharp),
                                            iconSize: 20,
                                            onPressed: () {
                                              WidgetProperties.goToNextPage(
                                                  context, UpdateProfile());
                                            }),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin:
                                    EdgeInsets.only(left: 20.0, bottom: 10),
                                    child: Textview2(
                                      title: Constants.PERSONAL_INFO_TEXT,
                                      fontSize: 12.0,
                                      color: AppColors.textBlackColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        right: 15.0, left: 15.0, bottom: 17),
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: SvgPicture.asset(
                                                  Constants
                                                      .EDIT_PERSON_IMAGE_NAME,
                                                  height: 25.0,
                                                  width: 25.0,
                                                  color: AppColors
                                                      .unCheckedBottomNavigationIconColor,
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                  left: 13.0,
                                                ),
                                                child: Textview2(
                                                  title: userController
                                                      .userEntity
                                                      .UserName ??
                                                      "Test",
                                                  fontSize: 15.0,
                                                  color: AppColors
                                                      .commoneadingtextColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 15.0, bottom: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: SvgPicture.asset(
                                                  Constants.EMAIL_IMAGE_NAME,
                                                  height: 15.0,
                                                  width: 10.0,
                                                  color: AppColors
                                                      .unCheckedBottomNavigationIconColor,
                                                ),
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                margin:
                                                EdgeInsets.only(left: 15.0),
                                                child: Textview2(
                                                  title: userController
                                                      .userEntity.Email ??
                                                      "test@yahoo.com",
                                                  fontSize: 15.0,
                                                  color: AppColors
                                                      .commoneadingtextColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 15.0, bottom: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                child: SvgPicture.asset(
                                                  Constants
                                                      .MOBILE_NUMBER_IMAGE_NAME,
                                                  height: 30.0,
                                                  width: 30.0,
                                                  color: AppColors
                                                      .unCheckedBottomNavigationIconColor,
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                EdgeInsets.only(left: 18.0),
                                                child: Textview2(
                                                  title: userController
                                                      .userEntity
                                                      .ContactNumber ??
                                                      "309876543",
                                                  fontSize: 15.0,
                                                  color: AppColors
                                                      .commoneadingtextColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
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
                              padding: EdgeInsets.symmetric(vertical: 20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 20.0),
                                    child: Textview2(
                                      title: Constants.ACCOUNT_INFORMATION_TEXT,
                                      fontSize: 15.0,
                                      color: AppColors.commoneadingtextColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    margin:
                                    EdgeInsets.only(top: 3.0, left: 20.0),
                                    child: Textview2(
                                      title: Constants.SUBSCRIBE_PAYMENT_TEXT,
                                      fontSize: 12.0,
                                      color: AppColors.textBlackColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        right: 15.0, left: 15.0, top: 10.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: SvgPicture.asset(
                                                  Constants.SEND_IMAGE_NAME,
                                                  height: 25.0,
                                                  width: 25.0,
                                                  color: AppColors
                                                      .unCheckedBottomNavigationIconColor,
                                                ),
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                margin: EdgeInsets.only(
                                                  left: 15.0,
                                                ),
                                                child: Textview2(
                                                  title: userController
                                                      .userEntity.Email ??
                                                      "test@yahoo.com",
                                                  fontSize: 15.0,
                                                  color: AppColors
                                                      .commoneadingtextColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 15.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: SvgPicture.asset(
                                                  Constants.PASSWORD_IMAGE_NAME,
                                                  height: 15.0,
                                                  width: 10.0,
                                                  color: AppColors
                                                      .unCheckedBottomNavigationIconColor,
                                                ),
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                margin:
                                                EdgeInsets.only(left: 16.0),
                                                child: Textview2(
                                                  title: userController
                                                      .userEntity
                                                      .Password ??
                                                      "****",
                                                  fontSize: 15.0,
                                                  color: AppColors
                                                      .commoneadingtextColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 15.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: SvgPicture.asset(
                                                  Constants.LOGOUT_IMAGE_NAME,
                                                  height: 25.0,
                                                  width: 25.0,
                                                  color: AppColors
                                                      .unCheckedBottomNavigationIconColor,
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  showDialog(context);
                                                  // DialogClass.showDialog(
                                                  //     Get.context,
                                                  //     logoutUser,
                                                  //     Constants
                                                  //         .LOGOUT_FROM_APP_TEXT,
                                                  //     Constants.YES_TEXT,
                                                  //     Constants.NO_TEXT);
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  margin: EdgeInsets.only(
                                                      left: 13.0),
                                                  child: Textview2(
                                                    title:
                                                    Constants.LOGOUT_TEXT,
                                                    fontSize: 15.0,
                                                    color: AppColors
                                                        .commoneadingtextColor,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  getUserProfile() async {
    Result res = await userController.getUserProfile();
    if (res != null) userController.userEntity = res.body;
    userController.updateUserBuilder();
  }

  logoutUser(BuildContext buildContext) async {
    Result logoutResult = await userController.logoutUser();
    var logoutData = logoutResult.body as UserEntity;
    if (!logoutData.ComRes.ResponseId.isNullOrBlank) {
      Navigator.of(buildContext).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => SigninScreen()),
              (Route<dynamic> route) => false);
    } else {
      ToastClass.showToast("There is something went wrong", ToastGravity.BOTTOM,
          Colors.red, Colors.white, 15.0, Toast.LENGTH_SHORT);
    }
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
            height: MediaQuery
                .of(buildContext)
                .size
                .height / 5,
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
                  title: Constants.LOGOUT_FROM_APP_TEXT,
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
                            logoutUser(buildContext);
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
