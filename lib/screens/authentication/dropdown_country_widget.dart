import 'package:e_quiz/common/ui_widgets/text_view.dart';
import 'package:e_quiz/controllers/country_controller.dart';
import 'package:e_quiz/controllers/user_controller.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/common/ui_widgets/common_card.dart';
import 'package:e_quiz/utils/colors.dart';
import 'package:e_quiz/utils/constants.dart';
import 'package:e_quiz/utils/values.dart';
import 'package:e_quiz/utils/widgetproperties.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:e_quiz/utils/dialog/loadingcircle/lib/ball_scale_indicator.dart';
import 'package:e_quiz/utils/dialog/loadingcircle/loading.dart';

class DropDownCountryWidget extends StatelessWidget {
  var countryController = CountryController();

  var userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Constants.COUNTRY_LIST_TEXT),
        backgroundColor: Color(0xFF526BB1),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: WidgetProperties.screenHeight(context),
          child: Stack(children: [
            Container(
                height: WidgetProperties.screenHeight(context) * 0.9,
                child: buildCountryList()),
          ]),
        ),
      ),
    );
  }

  Widget buildCountryList() {
    return GetBuilder<CountryController>(
      initState: (child) {
        getCountryList();
      },
      init: countryController,
      builder: (_) {
        if (countryController.countryList == null) {
          return Center(
            child: Container(
              child: Loading(
                  indicator: BallScaleIndicator(),
                  size: 100.0,
                  color: Colors.pink),
            ),
          );
        } else if (countryController.countryList.isEmpty) {
          return CommonCard(
            child: Center(
              child: Textview2(
                color: AppColors.primaryBtnColor,
                title: "No Country Found",
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        } else {
          return ListView.builder(
            itemCount: countryController.countryList.length,
            itemBuilder: (context, index) {
              return listCountryWidget(context, index);
            },
          );
        }
      },
    );
  }

  Widget listCountryWidget(BuildContext buildContext, int index) {
    return GestureDetector(
      onTap: () {
        userController.currentSelectedCountry =
            countryController.countryList[index];
        userController.updateUserBuilder();
        Navigator.of(buildContext).pop();
      },
      child: Container(
        color: Colors.transparent,
        margin: EdgeInsets.only(top: 6.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Container(
                padding: EdgeInsets.only(top: 15.0, bottom: 5.0, left: 15),
                child: Textview2(
                  title: countryController.countryList[index].Name,
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

  // getCountryList() async {
  //   await countryController.getCountries();
  // }
  getCountryList() async {
    Result result = await countryController.getCountries();
    if (result != null) {
      countryController.countryList = result.body;
    }
    countryController.updateCountryBuilder();
  }
}
