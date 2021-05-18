import 'package:e_quiz/common/ui_widgets/text_view.dart';
import 'package:e_quiz/controllers/dashboard_controller.dart';
import 'package:e_quiz/controllers/result_controller.dart';
import 'package:e_quiz/screens/dashboard/dashboard_screen.dart';
import 'package:e_quiz/utils/colors.dart';
import 'package:e_quiz/utils/dialog/loadingcircle/lib/ball_scale_indicator.dart';
import 'package:e_quiz/utils/dialog/loadingcircle/loading.dart';
import 'package:e_quiz/utils/widgetproperties.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:e_quiz/common/ui_widgets/get_push_replacement.dart';


import '../../utils/colors.dart';

class SelfResultScreen extends StatelessWidget {
  var _resultController = Get.find<ResultController>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   title: Center(child: Text('Result Screen',style: TextStyle(color: AppColors.textWhiteColor),)),
        //   backgroundColor: AppColors.primaryBtnColor,
        //   elevation: 0,
        // ),
        body: GetBuilder<ResultController>(
          builder: (_) {
            return Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 15.0, left: 25.0, right: 25.0),
                  height: 150,
                  child: Material(
                    elevation: 2.0,
                    color: AppColors.primaryBtnColor,
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      width: WidgetProperties.screenWidth(context),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Textview2(
                                  title: "Total questions",
                                  fontSize: 10.0,
                                  color: AppColors.textWhiteColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 7.0),
                                child: Textview2(
                                  title:
                                      _resultController.quizQuestionList != null
                                          ? _resultController
                                              .quizQuestionList.length
                                              .toString()
                                          : "0",
                                  fontSize: 12.0,
                                  color: AppColors.textWhiteColor,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "",
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Textview2(
                                  title: "Attempted questions",
                                  fontSize: 10.0,
                                  color: AppColors.textWhiteColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 7.0),
                                child: Textview2(
                                  title: _resultController.quizQuestionList !=
                                          null
                                      ? _resultController.quizQuestionList
                                                  .where((element) =>
                                                      element.isAttempted)
                                                  .toList()
                                                  .length
                                                  .toString() !=
                                              null
                                          ? _resultController.quizQuestionList
                                              .where((element) =>
                                                  element.isAttempted)
                                              .toList()
                                              .length
                                              .toString()
                                          : "No Data"
                                      : "0",
                                  fontSize: 12.0,
                                  color: AppColors.textWhiteColor,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "",
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Textview2(
                                  title: "Correct  Answers",
                                  fontSize: 10.0,
                                  color: AppColors.textWhiteColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 7.0),
                                child: Textview2(
                                  title: _resultController.quizQuestionList !=
                                          null
                                      ? _resultController.quizQuestionList
                                                  .where((element) =>
                                                      element.isUserAnswer)
                                                  .toList()
                                                  .length
                                                  .toString() !=
                                              null
                                          ? _resultController.quizQuestionList
                                              .where((element) =>
                                                  element.isUserAnswer)
                                              .toList()
                                              .length
                                              .toString()
                                          : "No Data"
                                      : "0",
                                  fontSize: 12.0,
                                  color: AppColors.textWhiteColor,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "",
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Textview2(
                                  title: "Wrong  Answers",
                                  fontSize: 10.0,
                                  color: AppColors.textWhiteColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 7.0),
                                child: Textview2(
                                  title: _resultController.quizQuestionList !=
                                          null
                                      ? _resultController.quizQuestionList
                                                  .where((element) =>
                                                      !element.isUserAnswer)
                                                  .toList()
                                                  .length
                                                  .toString() !=
                                              null
                                          ? _resultController.quizQuestionList
                                              .where((element) =>
                                                  !element.isUserAnswer)
                                              .toList()
                                              .length
                                              .toString()
                                          : "No Data Found"
                                      : _resultController.quizQuestionList !=
                                              null
                                          ? _resultController.quizQuestionList
                                                      .isEmpty
                                              ? "you Are Failed!"
                                              : Expanded(
                                                  child: buildResultList(),
                                                )
                                          : 0.toString(),
                                  fontSize: 12.0,
                                  color: AppColors.textWhiteColor,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "",
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Textview2(
                                  title: "Percentage %",
                                  fontSize: 10.0,
                                  color: AppColors.textWhiteColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 7.0),
                                child: Textview2(
                                  title:(( _resultController.quizQuestionList
                                      .where((element) =>
                                  element.isUserAnswer)
                                      .toList()
                                      .length / _resultController.quizQuestionList.length)*100).toStringAsFixed(2)+' %',
                                  fontSize: 12.0,
                                  color: AppColors.textWhiteColor,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "",
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Textview2(
                                  title: "Skipped  Questions",
                                  fontSize: 10.0,
                                  color: AppColors.textWhiteColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 7.0),
                                child: Textview2(
                                  title: _resultController
                                              .skippedQuestionObjectList !=
                                          null
                                      ? _resultController
                                                  .skippedQuestionObjectList
                                                  .length
                                                  .toString() !=
                                              null
                                          ? _resultController
                                              .skippedQuestionObjectList.length
                                              .toString()
                                          : "0"
                                      : "0",
                                  fontSize: 12.0,
                                  color: AppColors.textWhiteColor,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "",
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: buildResultList(),
                  ),
                ),
                Container(
                  width: WidgetProperties.screenWidth(context) / 1.5,
                  child: RaisedButton(
                    child: Text("Done",
                        style: TextStyle(
                            color: AppColors.textWhiteColor, fontSize: 20.0)),
                    color: Color(0xFF536BB1),
                    onPressed: () {
                      // contrller.dispose();
                      RouteAppReplacement.instance.pushReplacementPageAll(context, DashboardScreen());
                      Get.find<DashboardController>().currentIndex = 0;
                      Get.find<DashboardController>().update();
                      // WidgetProperties.goToNextPage(context, Dashboard());
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildResultList() {
    if (_resultController.quizQuestionList.isBlank) {
      return Center(
        child: Container(
          child: Loading(
              indicator: BallScaleIndicator(), size: 100.0, color: Colors.pink),
        ),
      );
    } else {
      return ListView.builder(
        padding: EdgeInsets.all(26.0),
        itemCount: _resultController.quizQuestionList != null
            ? _resultController.quizQuestionList.length
            : 0,
        itemBuilder: (context, index) {
          return buildResultListWidget(context, index);
        },
      );
    }
  }

  Widget buildResultListWidget(BuildContext context, int index) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Html(
              defaultTextStyle: TextStyle(fontSize: 20.0),
              data: _resultController.quizQuestionList[index].Statement,
            ),
            SizedBox(height: 10.0),
            Html(
              defaultTextStyle: TextStyle(fontSize: 20.0, color: Colors.green),
              data: _resultController.quizQuestionList[index].QuestionAnswerList
                  .where((element) => element.isCorrect == true)
                  .first
                  .Statement,
            ),
            SizedBox(height: 30.0),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              alignment: Alignment.centerLeft,
              child: Html(
                data: "",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
