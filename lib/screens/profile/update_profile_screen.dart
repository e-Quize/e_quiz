import 'package:e_quiz/common/ui_widgets/custom_button.dart';
import 'package:e_quiz/common/ui_widgets/custominput.dart';
import 'package:e_quiz/common/ui_widgets/text_view.dart';
import 'package:e_quiz/screens/dashboard/dashboard_screen.dart';
import 'package:e_quiz/controllers/country_controller.dart';
import 'package:e_quiz/controllers/timezone_controller.dart';
import 'package:e_quiz/controllers/user_controller.dart';
import 'package:e_quiz/controllers/dashboard_controller.dart';
import 'package:e_quiz/db/user_crud.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/models/user/user_model.dart';
import 'package:e_quiz/screens/authentication/dropdown_country_widget.dart';
import 'package:e_quiz/screens/authentication/dropdown_timezone_widget.dart';
import 'package:e_quiz/screens/common/common_background.dart';
import 'package:e_quiz/utils/colors.dart';
import 'package:e_quiz/utils/constants.dart';
import 'package:e_quiz/utils/dialog/toastclass.dart';
import 'package:e_quiz/utils/values.dart';
import 'package:e_quiz/utils/widgetproperties.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class UpdateProfile extends StatelessWidget {
  var countryController = CountryController();
  var timezoneController = TimeZoneController();

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var passwordController = TextEditingController();

  String firstName = "";
  String lastName = "";
  String email = "";
  String userName = "";
  String phoneNumber = "";
  String password = "";

  var fnNode = FocusNode();
  var lnNode = FocusNode();
  var unNode = FocusNode();
  var emNode = FocusNode();
  var phNode = FocusNode();
  var pwNode = FocusNode();
  var rpwNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  var userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Color(0xff526BB1),
            leading: BackButton(color: Colors.white)),
        body: Stack(
          children: [
            BodyBackground(
              heightTop: WidgetProperties.screenHeight(context) * 0.3,
              body: Container(),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Textview2(
                      title: 'Update Profile',
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontFamily: AppValues.fontFamily,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: AppValues.horizontalMargin,
                  right: AppValues.horizontalMargin,
                  top: 40.0),
              child: Material(
                elevation: AppValues.cardElevation,
                color: Color(0xfff2f2f2),
                borderRadius: BorderRadius.all(
                    Radius.circular(AppValues.commonBodyCardRadius)),
                child: Container(
                    height: WidgetProperties.screenHeight(context) * 0.7,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                right: 15.0, left: 15.0, top: 10.0),
                            child: GetBuilder<UserController>(
                              initState: (child) {
                                setUser();
                              },
                              builder: (_) {
                                return Form(
                                  key: _formKey,
                                  autovalidateMode: AutovalidateMode.disabled,
                                  child: Column(
                                    children: [
                                      FormInput(
                                        errorText: userController
                                            .validityFirstName.message,
                                        hint: 'First Name',
                                        hintColor:
                                            AppColors.commoneadingtextColor,
                                        onSaved: (value) {
                                          userController.checkFirstName(value);
                                          userController.updateUserBuilder();
                                        },
                                        formatter:
                                            FilteringTextInputFormatter.allow(
                                          RegExp("[A-Z a-z _ .]"),
                                        ),
                                        obsecureText: false,
                                        maxLength: 50,
                                        myController: firstNameController,
                                        focusNode: fnNode,
                                      ),
                                      FormInput(
                                        errorText: userController
                                            .validityLastName.message,
                                        hint: 'Last Name',
                                        hintColor:
                                            AppColors.commoneadingtextColor,
                                        onSaved: (value) {
                                          userController.checkLastName(value);
                                          userController.updateUserBuilder();
                                        },
                                        formatter:
                                            FilteringTextInputFormatter.allow(
                                          RegExp("[A-Z a-z _ .]"),
                                        ),
                                        obsecureText: false,
                                        maxLength: 50,
                                        myController: lastNameController,
                                        focusNode: lnNode,
                                      ),
                                      FormInput(
                                        enabled: false,
                                        errorText: userController
                                            .validityUserName.message,
                                        hint: 'User Name',
                                        hintColor:
                                            AppColors.commoneadingtextColor,
                                        onSaved: (value) {
                                          userController.checkUsername(value);
                                          userController.updateUserBuilder();
                                        },
                                        formatter:
                                            FilteringTextInputFormatter.allow(
                                          RegExp("[A-Z a-z _ .]"),
                                        ),
                                        obsecureText: false,
                                        maxLength: 50,
                                        myController: userNameController,
                                        focusNode: unNode,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            PageRouteBuilder(
                                              transitionDuration:
                                                  Duration(milliseconds: 450),
                                              transitionsBuilder: (context,
                                                  animation,
                                                  animationTime,
                                                  child) {
                                                return ScaleTransition(
                                                  alignment: Alignment.center,
                                                  scale: animation,
                                                  child: child,
                                                );
                                              },
                                              pageBuilder: (context, animation,
                                                  animationTime) {
                                                return DropDownCountryWidget();
                                              },
                                            ),
                                          );
                                        },
                                        child: Container(
                                          child: Container(
                                            margin: EdgeInsets.all(15.0),
                                            padding: EdgeInsets.all(10.0),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Textview2(
                                                  title: userController
                                                          .currentSelectedCountry
                                                          .isNullOrBlank
                                                      ? Constants
                                                          .SELECT_COUNTRY_TEXT
                                                      : userController
                                                          .currentSelectedCountry
                                                          .Name,
                                                  fontSize: 10.0,
                                                  color: AppColors
                                                      .forgotPasswordTextColor,
                                                  fontWeight: FontWeight.bold,
                                                  textAlign: TextAlign.left,
                                                ),
                                                Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Colors.grey,
                                                  size: 15,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            PageRouteBuilder(
                                              transitionDuration:
                                                  Duration(milliseconds: 450),
                                              transitionsBuilder: (context,
                                                  animation,
                                                  animationTime,
                                                  child) {
                                                return ScaleTransition(
                                                  alignment: Alignment.center,
                                                  scale: animation,
                                                  child: child,
                                                );
                                              },
                                              pageBuilder: (context, animation,
                                                  animationTime) {
                                                return DropDownTimezoneWidget();
                                              },
                                            ),
                                          );
                                        },
                                        child: Container(
                                          margin: EdgeInsets.all(15.0),
                                          padding: EdgeInsets.all(10.0),
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Textview2(
                                                title: userController
                                                        .currentSelectedTimeZone
                                                        .isNullOrBlank
                                                    ? Constants
                                                        .SELECT_TIMEZONE_TEXT
                                                    : userController
                                                        .currentSelectedTimeZone
                                                        .DisplayName,
                                                fontSize: 10.0,
                                                color: AppColors
                                                    .forgotPasswordTextColor,
                                                fontWeight: FontWeight.bold,
                                                textAlign: TextAlign.left,
                                              ),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                color: Colors.grey,
                                                size: 15,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      FormInput(
                                        enabled: false,
                                        errorText: userController
                                            .validityEmail.message,
                                        hint: 'Email ',
                                        hintColor:
                                            AppColors.commoneadingtextColor,
                                        onSaved: (value) {
                                          userController.checkEmail(value);
                                          userController.updateUserBuilder();
                                        },
                                        formatter:
                                            FilteringTextInputFormatter.allow(
                                          RegExp("[A-Z a-z _ . @ 0-9]"),
                                        ),
                                        obsecureText: false,
                                        maxLength: 50,
                                        myController: emailController,
                                        focusNode: emNode,
                                      ),
                                      FormInput(
                                        errorText: userController
                                            .validityPhone.message,
                                        hint: 'Phone Number',
                                        hintColor:
                                            AppColors.commoneadingtextColor,
                                        onSaved: (value) {
                                          userController.checkPhone(value);
                                          userController.updateUserBuilder();
                                        },
                                        formatter:
                                            FilteringTextInputFormatter.allow(
                                          RegExp("[0-9]"),
                                        ),
                                        obsecureText: false,
                                        maxLength: 15,
                                        myController: phoneNumberController,
                                        focusNode: phNode,
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
                                        focusNode: pwNode,
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 18.0,
                                            horizontal:
                                                AppValues.horizontalMarginForm),
                                        child: HeroButton(
                                          width: WidgetProperties.screenWidth(
                                              context),
                                          height: 40.0,
                                          radius: 22.0,
                                          gradient: AppColors.primaryColor,
                                          title: 'Upadate',
                                          onPressed: () {
                                            updateUser(context);
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ],
        ));
  }

  updateUser(BuildContext context) async {
    var u = UserEntity();
    u.FirstName = firstNameController.text;
    u.LastName = lastNameController.text;
    u.Email = emailController.text;
    u.ContactNumber = phoneNumberController.text;
    u.UserName = userNameController.text;
    u.Password = passwordController.text;
    u.Id = userController.userEntity.Id;
    // RefreshToken refreshToken = await UserCrud.getUserRefreshToken();
    var userEntityCopy = await UserCrud.getUserCopy();
    u.Token = userEntityCopy.Token;

    if (!userController.currentSelectedCountry.isNullOrBlank) {
      u.Country = userController.currentSelectedCountry.Id ?? 0;
    }
    if (!userController.currentSelectedTimeZone.isNullOrBlank) {
      u.TimeZoneId = userController.currentSelectedTimeZone.TimeZoneID;
    }

    if (u.Country.isNullOrBlank) {
      ToastClass.showToast("Please Select Country", ToastGravity.BOTTOM,
          Colors.red, Colors.white, 15.0, Toast.LENGTH_SHORT);
      return;
    }
    if (u.TimeZoneId.isNullOrBlank) {
      ToastClass.showToast("Please Select TimeZone", ToastGravity.BOTTOM,
          Colors.red, Colors.white, 15.0, Toast.LENGTH_SHORT);
      return;
    }
    userController.checkUpdateUserValidation(u);
    if (userController.checkUpdateUserValidation(u)) {
      Result result = await userController.updateUserProfile(u);
      if (result.code > 0) {
        ToastClass.showToast(result.message, ToastGravity.BOTTOM, Colors.red,
            Colors.white, 15.0, Toast.LENGTH_SHORT);
        Get.to(DashboardScreen());
        Get.find<DashboardController>().currentIndex = 0;
        Get.find<DashboardController>().update();
      }
    } else {
      userController.updateUserBuilder();
    }
  }

  void setUser() {
    firstNameController.value = TextEditingValue(
      text: userController.userEntity.FirstName,
      selection: TextSelection.fromPosition(
        TextPosition(offset: userController.userEntity.FirstName.length),
      ),
    );
    lastNameController.value = TextEditingValue(
      text: userController.userEntity.LastName,
      selection: TextSelection.fromPosition(
        TextPosition(offset: userController.userEntity.LastName.length),
      ),
    );
    phoneNumberController.value = TextEditingValue(
      text: userController.userEntity.ContactNumber,
      selection: TextSelection.fromPosition(
        TextPosition(offset: userController.userEntity.ContactNumber.length),
      ),
    );
    emailController.value = TextEditingValue(
      text: userController.userEntity.Email,
      selection: TextSelection.fromPosition(
        TextPosition(offset: userController.userEntity.Email.length),
      ),
    );
    passwordController.value = TextEditingValue(
      text: userController.userEntity.Password,
      selection: TextSelection.fromPosition(
        TextPosition(offset: userController.userEntity.Password.length),
      ),
    );
    userNameController.value = TextEditingValue(
      text: userController.userEntity.UserName,
      selection: TextSelection.fromPosition(
        TextPosition(offset: userController.userEntity.UserName.length),
      ),
    );
  }
}
