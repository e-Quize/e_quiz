import 'package:e_quiz/common/ui_widgets/common_card.dart';
import 'package:e_quiz/common/ui_widgets/text_view.dart';
import 'package:e_quiz/controllers/history_controller.dart';
import 'package:e_quiz/controllers/notification_controller.dart';
import 'package:e_quiz/controllers/quiz_controller.dart';
import 'package:e_quiz/controllers/result_controller.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/models/dashboard/competition_quiz_result_model.dart';
import 'package:e_quiz/models/quizdetail/competition_result.dart';
import 'package:e_quiz/utils/colors.dart';
import 'package:e_quiz/utils/dialog/loadingcircle/lib/ball_scale_indicator.dart';
import 'package:e_quiz/utils/dialog/loadingcircle/loading.dart';
import 'package:e_quiz/utils/values.dart';
import 'package:e_quiz/utils/widgetproperties.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreen extends StatelessWidget {




  var _resultController = Get.put(ResultController());
  var _historyController = Get.put(HistoryController());
  var _scrollController = ScrollController();

  List<CompetitionResult> competitorQuizResultList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryBtnColor,
        elevation: 5.0,
        centerTitle: true,
        title: Text("Details"),
      ),
      body: GetBuilder<ResultController>(
          init: _resultController,
          initState: (child) async {
            await getCompetitorQuizResultList();
          },
          builder: (_) {
            return Container(
              height: WidgetProperties.screenHeight(Get.context),
              child: Stack(
                children: [
                  Container(
                    height: WidgetProperties.screenHeight(Get.context),
                    child: buildCompetitionQuizResultList(),
                  ),
                ],
              ),
            );
          }),
    );
  }

  buildCompetitionQuizResultList() {
    if (competitorQuizResultList == null) {
      return Center(
          child: Container(
        alignment: Alignment.center,
        // height: WidgetProperties.screenHeight(Get.context),
        child: Loading(
            indicator: BallScaleIndicator(), size: 100.0, color: Colors.pink),
      ));
    } else if (competitorQuizResultList.isEmpty) {
      return CommonCard(
        child: Center(
          child: Textview2(
            title: "No Data Found",
            fontSize: 15.0,
          ),
        ),
      );
    } else {
      return ListView.builder(
        controller: _scrollController,
        physics: BouncingScrollPhysics(),
        // itemCount: notificationController.notificationList.length ?? 0,
        itemCount: competitorQuizResultList.length,
        shrinkWrap: false,
        itemBuilder: (context, index) {
          return listCompetitorQuizWidget(context, index);
        },
      );
    }
  }

  Widget listCompetitorQuizWidget(BuildContext buildContext, int index) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Material(
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 2.0,
                color: AppColors.primaryBtnColor,
                style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 4.0,
          // borderRadius: BorderRadius.all(Radius.circular(10.0)),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: Column(
              children: [
                Container(
                  height: 70.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Textview2(
                        title: "User Name",
                        fontSize: 15.0,
                        color: AppColors.accent3Color,
                        fontWeight: FontWeight.w900,
                        fontFamily: AppValues.fontFamily,
                      ),
                      Textview2(
                        title: competitorQuizResultList[index].UserName,
                        fontSize: 15.0,
                        color: AppColors.primaryBtnColor,
                        fontWeight: FontWeight.w900,
                        fontFamily: AppValues.fontFamily,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Textview2(
                      title: "Obtained Percentage",
                      fontSize: 15.0,
                      color: AppColors.accent3Color,
                      fontWeight: FontWeight.w900,
                      fontFamily: AppValues.fontFamily,
                    ),
                    Container(
                      child: Textview2(
                        title: competitorQuizResultList[index]
                                .ObtainedPercentage
                                .toString() +
                            "%",
                        fontSize: 15.0,
                        color: AppColors.primaryBtnColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: AppValues.fontFamily,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }

  getCompetitorQuizResultList() async {
    var competitionQuizResultModel = CompetitionQuizResultModel();

    competitionQuizResultModel.QuizId = _historyController.selectedReAtemptedQuestionId;
    Result res =
        await _resultController.getQuizDetailList(competitionQuizResultModel);
    if (res != null) {
      competitorQuizResultList = res.body;
      _resultController.update();
    }
  }
}
