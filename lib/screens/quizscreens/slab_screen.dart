import 'package:e_quiz/common/ui_widgets/common_card.dart';
import 'package:e_quiz/common/ui_widgets/custom_button.dart';
import 'package:e_quiz/common/ui_widgets/text_view.dart';
import 'package:e_quiz/utils/constants.dart';
import 'package:e_quiz/controllers/slabController.dart';
import 'package:e_quiz/controllers/subjectSubscriptionController.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/models/user/user_model.dart';
import 'package:e_quiz/screens/common/common_background.dart';
import 'package:e_quiz/utils/colors.dart';
import 'package:e_quiz/utils/dialog/loadingcircle/lib/ball_scale_indicator.dart';
import 'package:e_quiz/utils/dialog/loadingcircle/loading.dart';
import 'package:e_quiz/utils/values.dart';
import 'package:e_quiz/utils/widgetproperties.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SlabScreen extends StatelessWidget {
  var _slabController = Get.put(SlabController());
  var _subjectSubscriptionController = Get.find<SubscriptionController>();

  var bankInfoData;

  String bankAccountInfo = Constants.BANK_INFO;
  double sum;

  String supportEmailAddress = "";

  var selectedSubjectDecoration = BoxDecoration(
      color: AppColors.textWhiteColor,
      shape: BoxShape.circle,
      border: Border.all(color: AppColors.accent3Color));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          BodyBackground(
            heightTop: WidgetProperties.screenHeight(context) * 0.5,
            heightBottom: WidgetProperties.screenHeight(context) * 0.5,
            body: Container(),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(bottom: 50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // getFooter(),
                  Container(
                    height: WidgetProperties.screenHeight(context),
                    padding: EdgeInsets.only(bottom: 50.0),
                    child: buildSlabList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSlabList() {
    return GetBuilder<SlabController>(
      init: _slabController,
      initState: (child) {
        _getSubjectSubscriptionDetail();
      },
      builder: (_) {
        if (_slabController.subscriptionDetaillist == null) {
          return Center(
            child: Container(
              child: Loading(
                  indicator: BallScaleIndicator(),
                  size: 100.0,
                  color: Colors.pink),
            ),
          );
        } else if (_slabController.subscriptionDetaillist.isEmpty) {
          return Center(
            child: CommonCard(
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 40, vertical: 55.0),
                    child: Text(Constants.NO_DATA,
                        style: TextStyle(fontSize: 25.0)))),
          );
        } else {
          return ListView.builder(
            itemCount: _slabController.subscriptionDetaillist.length,
            itemBuilder: (context, index) {
              return slabListWidget(context, index);
            },
          );
        }
      },
    );
  }

  Widget slabListWidget(BuildContext buildContext, int index) {
    return Container(
      height: 350.0,
      margin: EdgeInsets.only(
          left: AppValues.horizontalMargin,
          right: AppValues.horizontalMargin,
          top: 20.0),
      child: Material(
        elevation: AppValues.cardElevation,
        color: Color(0xfff2f2f2),
        borderRadius:
            BorderRadius.all(Radius.circular(AppValues.commonBodyCardRadius)),
        child: Container(
            height: WidgetProperties.screenHeight(buildContext),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(26.0),
                          topRight: Radius.circular(26.0)),
                      color: index.isEven
                          ? AppColors.subscriptionScreenBackgroundColor
                          : AppColors.accentColor,
                    ),
                    padding: EdgeInsets.all(15.0),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Textview2(
                            // title: _quizController.subscribeList[index].Name,
                            title: _slabController
                                .subscriptionDetaillist[index].SlabName,
                            fontSize: 15.0,
                            color: AppColors.textWhiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                          Textview2(
                            // title: r"$ " + _quizController.subscribeList[index].Concession.toString(),
                            title: r"$ " +
                                _slabController
                                    .subscriptionDetaillist[index].TotalPayable
                                    .toString(),
                            fontSize: 15.0,
                            color: AppColors.textWhiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.only(left: 15.0, right: 15.0),
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Textview2(
                              title: "Your Selected subjects:",
                              fontSize: 15.0,
                              color: AppColors.commoneadingtextColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 6.0),
                            child: Divider(
                              height: 0.7,
                              color: AppColors.accent3Color,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10.0),
                            child: Row(
                              children: [
                                Container(
                                  height: 25,
                                  width: 25,
                                  decoration: selectedSubjectDecoration,
                                  child: Icon(
                                    Icons.check,
                                    color: AppColors.commoneadingtextColor,
                                    size: 20,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10.0),
                                  child: Textview2(
                                    // title: activeSubjects[index].SubjectName,
                                    title: _slabController
                                        .subscriptionDetaillist[index]
                                        .SubjectName,
                                    textAlign: TextAlign.center,
                                    fontSize: 15.0,
                                    color: AppColors.forgotPasswordTextColor,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: AppValues.fontFamily,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AnimatedOpacity(
                            opacity: 1.0,
                            duration: Duration(milliseconds: 500),
                            child: Container(
                              margin: EdgeInsets.only(top: 150.0),
                              alignment: Alignment.center,
                              child: HeroButton(
                                width: MediaQuery.of(buildContext).size.width,
                                height: 50.0,
                                radius: AppValues.commonButtonCornerRadius,
                                gradient: index.isEven
                                    ? AppColors
                                        .subscriptionScreenBackgroundColor
                                    : AppColors.accentColor,
                                title: "Subscribe",
                                onPressed: () {
                                  _subjectSubscriptionController
                                          .userSubscriptionSubjectList
                                          .where((element) =>
                                              element.Id ==
                                              _subjectSubscriptionController
                                                  .selectedSubjectId)
                                          .first
                                          .userSubscriptionModel =
                                      _slabController
                                          .subscriptionDetaillist[index];

                                  _subjectSubscriptionController
                                      .updateUserBuilder();
                                  Get.back();
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  _getSubjectSubscriptionDetail() async {
    var userEntity = UserEntity();
    userEntity.SubjectIdsString =
        _subjectSubscriptionController.selectedSubjectId.toString();
    Result result =
        await _slabController.getSubjectSubscriptionDetail(userEntity);
    _slabController.subscriptionDetaillist = result.body;
    _slabController.updateUserBuilder();
  }
}
