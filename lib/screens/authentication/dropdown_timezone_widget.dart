import 'package:e_quiz/common/ui_widgets/common_card.dart';
import 'package:e_quiz/common/ui_widgets/text_view.dart';
import 'package:e_quiz/controllers/timezone_controller.dart';
import 'package:e_quiz/controllers/user_controller.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/utils/colors.dart';
import 'package:e_quiz/utils/constants.dart';
import 'package:e_quiz/utils/dialog/loadingcircle/lib/ball_scale_indicator.dart';
import 'package:e_quiz/utils/dialog/loadingcircle/loading.dart';
import 'package:e_quiz/utils/values.dart';
import 'package:e_quiz/utils/widgetproperties.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

// ignore: must_be_immutable
class DropDownTimezoneWidget extends StatelessWidget {
  var timezoneController = TimeZoneController();

  var userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Constants.TIMEZONE_LIST_TEXT),
        backgroundColor: Color(0xFF526BB1),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: WidgetProperties.screenHeight(context),
          child: Stack(children: [
            Container(
                height: WidgetProperties.screenHeight(context) * 0.9,
                child: buildTimeZoneList()),
          ]),
        ),
      ),
    );
  }

  Widget buildTimeZoneList() {
    return GetBuilder<TimeZoneController>(
      initState: (child) {
        getTimeZoneList();
      },
      init: timezoneController,
      builder: (_) {
        if (timezoneController.timeZoneList == null) {
          return Center(
            child: Container(
              child: Loading(
                  indicator: BallScaleIndicator(),
                  size: 100.0,
                  color: Colors.pink),
            ),
          );
        } else if (timezoneController.timeZoneList.isEmpty) {
          return CommonCard(
            child: Center(
              child: Textview2(
                color: AppColors.primaryBtnColor,
                title: "No TimeZone Found",
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        } else {
          return ListView.builder(
            itemCount: timezoneController.timeZoneList.length,
            itemBuilder: (context, index) {
              return listTimezoneWidget(context, index);
            },
          );
        }
      },
    );
  }

  Widget listTimezoneWidget(BuildContext buildContext, int index) {
    return GestureDetector(
      onTap: () {
        userController.currentSelectedTimeZone =
            timezoneController.timeZoneList[index];
        userController
            .updateSelectedTimezone(timezoneController.timeZoneList[index]);
        userController.updateUserBuilder();
        Navigator.of(buildContext).pop();
      },
      child: Container(
        color: Colors.transparent,
        margin: EdgeInsets.only(top: 5.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Container(
                padding: EdgeInsets.only(top: 15.0, bottom: 5.0, left: 15.0),
                child: Textview2(
                  title: timezoneController.timeZoneList[index].DisplayName,
                  textAlign: TextAlign.center,
                  fontSize: 12.0,
                  color: AppColors.commoneadingtextColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppValues.fontFamily,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
              child: Center(
                child: Container(
                  margin: EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                  height: 1.5,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  getTimeZoneList() async {
    Result result = await timezoneController
        .getCountryTimeZones(userController.currentSelectedCountry);
    if (result != null) {
      timezoneController.timeZoneList = result.body;
    }
    timezoneController.updateTimezoneBuilder();
  }
}
