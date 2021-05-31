import 'package:e_quiz/common/ui_widgets/common_card.dart';
import 'package:e_quiz/common/ui_widgets/text_view.dart';
import 'package:e_quiz/controllers/history_controller.dart';
import 'package:e_quiz/controllers/quiz_controller.dart';
import 'package:e_quiz/models/attemptquiz/attempt_quiz_vm.dart';
import 'package:e_quiz/models/attemptquiz/quiz_question.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/screens/quizscreens/question_screen.dart';
import 'package:e_quiz/screens/quizscreens/competition_question_screen.dart';
import 'package:e_quiz/screens/quizscreens/detail_screen.dart';
import 'package:e_quiz/utils/colors.dart';
import 'package:e_quiz/utils/dialog/loadingcircle/lib/ball_scale_indicator.dart';
import 'package:e_quiz/utils/dialog/loadingcircle/loading.dart';
import 'package:e_quiz/utils/widgetproperties.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class SubjectHistoryScreen extends StatelessWidget {
  List<QuizQuestion> quizQuestionList;
  List<QuizQuestion> skippedQuestionObjectList;

  var historyController = Get.put(HistoryController());
  var quizController = Get.put(QuizController());

  var userDashboardVMResponse;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryBtnColor,
          elevation: 5.0,
          centerTitle: true,
          title: Text("History"),
        ),
        resizeToAvoidBottomInset: false,
        body: GetBuilder<HistoryController>(
          init: historyController,
          initState: (child) {
            getAllAttemptedQuiz();
          },
          builder: (_) {
            return Container(
              child: getListTile(),
            );
          },
        ));
  }

  getAllAttemptedQuiz() async {
    Result result = await historyController.getAllAttemptedQuiz();
    if (result != null) historyController.attemptedQuizModelList = result.body;
    historyController.update();
  }

  Widget getListTile() {
    if (historyController.attemptedQuizModelList == null) {
      return Center(
        child: Container(
          padding: EdgeInsets.only(bottom: 20),
          height: WidgetProperties.screenHeight(Get.context),
          child: Loading(
              indicator: BallScaleIndicator(), size: 100.0, color: Colors.pink),
        ),
      );
    } else if (historyController.attemptedQuizModelList.isEmpty) {
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
        itemCount: historyController.attemptedQuizModelList.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
            child: Material(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: 2.0,
                    color: AppColors.primaryBtnColor,
                    style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 8.0,
              // borderRadius: BorderRadius.circular(10.0),
              child: Container(
                // height: MediaQuery.of(context).size.height / 6,
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Textview2(
                      color: AppColors.primaryBtnColor,
                      fontWeight: FontWeight.bold,
                      title: historyController
                          .attemptedQuizModelList[index].Subejcts,
                      fontSize: 15.0,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Textview2(
                        color: AppColors.primaryBtnColor,
                        title: historyController
                            .attemptedQuizModelList[index].AttemptedDate,
                        fontSize: 15.0,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(
                                20.0,
                              )),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 15.0),
                          child: GestureDetector(
                            onTap: () {
                              historyController.selectedReAtemptedQuestionId =
                                  historyController
                                      .attemptedQuizModelList[index].QuizId;
                              if (historyController
                                  .attemptedQuizModelList[index]
                                  .isCompetition) {
                                WidgetProperties.goToNextPage(
                                    Get.context, CompetitionQuestionScreen());
                              } else {
                                WidgetProperties.goToNextPage(
                                    Get.context, QuestionScreen());
                              }
                            },
                            child: Text("Re-Attempt",
                                style: TextStyle(
                                    color: AppColors.textWhiteColor,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        historyController.attemptedQuizModelList[index]
                                    .isCompetition ==
                                true
                            ? Container(
                                alignment: Alignment.center,
                                width: 95.0,
                                height: 35.0,
                                margin: EdgeInsets.only(top: 10.0),
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(
                                      20.0,
                                    )),
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 15.0),
                                child: GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    historyController
                                            .selectedReAtemptedQuestionId =
                                        historyController
                                            .attemptedQuizModelList[index]
                                            .QuizId;
                                    WidgetProperties.goToNextPage(
                                        Get.context, DetailScreen());
                                  },
                                  child: Text("Details",
                                      style: TextStyle(
                                          color: AppColors.textWhiteColor,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold)),
                                ),
                              )
                            : Container(),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
  }

  getQuestions(int id) async {
    var attemptQuizVM = AttemptQuizVm();
    attemptQuizVM.Date = WidgetProperties.utcTimeToString();
    attemptQuizVM.QuizId = id;
    attemptQuizVM.ReAttempt = true;
    Result res =
        await historyController.getQuetionsForReAttempQuiz(attemptQuizVM);
    if (res != null) quizQuestionList = res.body;
    if (quizController.quizQuestionList != null) {
      WidgetProperties.goToNextPage(Get.context, QuestionScreen());
      quizQuestionList.sort((a, b) => a.Serial.compareTo(b.Serial));
    }
    quizController.updateBuilder();
  }
}
