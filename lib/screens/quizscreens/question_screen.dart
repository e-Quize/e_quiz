import 'package:countdown_flutter/countdown_flutter.dart';
import 'package:e_quiz/common/ui_widgets/common_card.dart';
import 'package:e_quiz/common/ui_widgets/custom_button.dart';
import 'package:e_quiz/common/ui_widgets/text_view.dart';
import 'package:e_quiz/controllers/dashboard_controller.dart';
import 'package:e_quiz/controllers/history_controller.dart';
import 'package:e_quiz/controllers/notification_controller.dart';
import 'package:e_quiz/controllers/quiz_controller.dart';
import 'package:e_quiz/controllers/result_controller.dart';
import 'package:e_quiz/controllers/subject_controller.dart';
import 'package:e_quiz/db/repositiories/user_repository.dart';
import 'package:e_quiz/models/attemptquiz/attempt_quiz_vm.dart';
import 'package:e_quiz/models/attemptquiz/quiz_question_answer.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/screens/common/common_background.dart';
import 'package:e_quiz/screens/dashboard/dashboard_screen.dart';
import 'package:e_quiz/screens/quizscreens/tab_bar_view.dart';
import 'package:e_quiz/utils/colors.dart';
import 'package:e_quiz/utils/constants.dart';
import 'package:e_quiz/utils/dialog/loader.dart';
import 'package:e_quiz/utils/dialog/toastclass.dart';
import 'package:e_quiz/utils/routepage.dart';
import 'package:e_quiz/utils/values.dart';
import 'package:e_quiz/utils/widgetproperties.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get_it/get_it.dart';

class QuestionScreen extends StatelessWidget {
  var _quizController = Get.find<QuizController>();
  var _subjectController = Get.find<SubjectController>();
  var _resultController = Get.put(ResultController());
  var _historyController = Get.put(HistoryController());
  var _notificationController = Get.put(NotificationController());

  UserRepository _userRepository = GetIt.I.get();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  BuildContext buildContext;
  bool flaggedAsDifficult = false;
  bool hasButtonSeenExplanation = false;
  bool flaggedAsSkipped = false;
  bool hasSeenExplanation = false;
  bool toggle = false;
  int _groupValue = -1;
  bool found = false;
  int answerId;
  QuizQuestionAnswer quizQuestionAnswer;

  int questionIndex = 0;
  bool isAttempted = false;

  int totalTime = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        key: _scaffoldKey,
        body: GetBuilder<QuizController>(
          init: _quizController,
          dispose: (c) {
            _quizController.ini();
          },
          initState: (child) {
            _quizController.ini();
            getQuestionList();
            // getList();
            if (_subjectController.isCheckedCorrectAnswer) {
              hasButtonSeenExplanation = false;
            } else {
              hasSeenExplanation = false;
              hasButtonSeenExplanation = true;
            }
          },
          builder: (_) {
            if (_quizController.quizQuestionList != null &&
                _quizController.quizQuestionList.isNotEmpty) {
              return SingleChildScrollView(
                child: Container(
                  height: WidgetProperties.screenHeight(context),
                  child: Stack(
                    children: [
                      BodyBackground(
                        heightTop: WidgetProperties.screenHeight(context) * 0.4,
                        heightBottom:
                            WidgetProperties.screenHeight(context) * 0.4,
                        body: Container(),
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        margin: EdgeInsets.only(top: 30.0),
                        child: _quizController.quizQuestionList[0].TotalTime
                                .toString()
                                .isNotEmpty
                            ? CountdownFormatted(
                                onFinish: () {
                                  WidgetProperties.goToNextPage(
                                      Get.context, TabbarView());
                                  // _quizController.update();
                                },
                                duration: Duration(
                                    seconds: _quizController
                                        .quizQuestionList[0].TotalTime),
                                builder: (BuildContext buildContext,
                                    String remaining) {
                                  return Textview2(
                                    // title: "04-00-98",
                                    title: remaining,
                                    fontSize: 20.0,
                                    color: AppColors.textWhiteColor,
                                    fontWeight: FontWeight.bold,
                                    textAlign: TextAlign.left,
                                    fontFamily: AppValues.fontFamily,
                                  );
                                },
                              )
                            : Container(),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 80.0),
                            alignment: Alignment.topCenter,
                            child: SvgPicture.asset(
                              Constants.BASE_PATH_IMAGE + "test.svg",
                              height: 100.0,
                              width: 100.0,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10.0, bottom: 20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    left: AppValues.horizontalMargin,
                                    right: AppValues.horizontalMargin,
                                    top: 15.0,
                                  ),
                                  child: CommonCard(
                                    child: Container(
                                      height: WidgetProperties.screenHeight(
                                              context) *
                                          0.6,
                                      child: Form(
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: 15.0, right: 15.0),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 14.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                height: 20,
                                                                width: 20,
                                                                decoration:
                                                                    WidgetProperties
                                                                        .selectedSubjectDecoration,
                                                                child:
                                                                    Textview2(
                                                                  title: _quizController
                                                                      .quizQuestionList[
                                                                          _quizController
                                                                              .questionIndex]
                                                                      .Serial
                                                                      .toString(),
                                                                  color: AppColors
                                                                      .textWhiteColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                )),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          5.0),
                                                              child: Textview2(
                                                                title:
                                                                    "Questions:",
                                                                fontSize: 15.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: AppColors
                                                                    .commoneadingtextColor,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 10.0),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Html(
                                                    data: _quizController
                                                                .quizQuestionList[
                                                                    _quizController
                                                                        .questionIndex]
                                                                .Statement !=
                                                            null
                                                        ? _quizController
                                                            .quizQuestionList[
                                                                _quizController
                                                                    .questionIndex]
                                                            .Statement
                                                        : "What is this?",
                                                  ),
                                                ),
                                                Container(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Container(
                                                        child: addRadioButton(
                                                            0,
                                                            _quizController
                                                                    .quizQuestionList[
                                                                        _quizController
                                                                            .questionIndex]
                                                                    .QuestionAnswerList
                                                                    .isNotEmpty
                                                                ? _quizController
                                                                            .quizQuestionList[_quizController
                                                                                .questionIndex]
                                                                            .QuestionAnswerList[
                                                                                0]
                                                                            .Statement !=
                                                                        null
                                                                    ? _quizController
                                                                        .quizQuestionList[_quizController
                                                                            .questionIndex]
                                                                        .QuestionAnswerList[
                                                                            0]
                                                                        .Statement
                                                                    : "Dummy Text"
                                                                : "Dummy Text",
                                                            context),
                                                      ),
                                                      addRadioButton(
                                                          1,
                                                          _quizController
                                                                  .quizQuestionList[
                                                                      _quizController
                                                                          .questionIndex]
                                                                  .QuestionAnswerList
                                                                  .isNotEmpty
                                                              ? _quizController
                                                                          .quizQuestionList[_quizController
                                                                              .questionIndex]
                                                                          .QuestionAnswerList[
                                                                              1]
                                                                          .Statement !=
                                                                      null
                                                                  ? _quizController
                                                                      .quizQuestionList[
                                                                          _quizController
                                                                              .questionIndex]
                                                                      .QuestionAnswerList[
                                                                          1]
                                                                      .Statement
                                                                  : "Dummy Text"
                                                              : "Dummy Text",
                                                          context),
                                                      addRadioButton(
                                                          2,
                                                          _quizController
                                                                  .quizQuestionList[
                                                                      _quizController
                                                                          .questionIndex]
                                                                  .QuestionAnswerList
                                                                  .isNotEmpty
                                                              ? _quizController
                                                                          .quizQuestionList[_quizController
                                                                              .questionIndex]
                                                                          .QuestionAnswerList[
                                                                              2]
                                                                          .Statement !=
                                                                      null
                                                                  ? _quizController
                                                                      .quizQuestionList[
                                                                          _quizController
                                                                              .questionIndex]
                                                                      .QuestionAnswerList[
                                                                          2]
                                                                      .Statement
                                                                  : "Dummy Text"
                                                              : "Dummy Text",
                                                          context),
                                                      addRadioButton(
                                                          3,
                                                          _quizController
                                                                  .quizQuestionList[
                                                                      _quizController
                                                                          .questionIndex]
                                                                  .QuestionAnswerList
                                                                  .isNotEmpty
                                                              ? _quizController
                                                                          .quizQuestionList[_quizController
                                                                              .questionIndex]
                                                                          .QuestionAnswerList[
                                                                              3]
                                                                          .Statement !=
                                                                      null
                                                                  ? _quizController
                                                                      .quizQuestionList[
                                                                          _quizController
                                                                              .questionIndex]
                                                                      .QuestionAnswerList[
                                                                          3]
                                                                      .Statement
                                                                  : "Dummy Text"
                                                              : "Dummy Text",
                                                          context),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 30.0,
                                                ),
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      HeroButton(
                                                        height: 30.0,
                                                        width: 130.0,
                                                        radius: AppValues
                                                            .commonButtonCornerRadius,
                                                        gradient: hasButtonSeenExplanation
                                                            ? AppColors
                                                                .progressbarColor
                                                            : AppColors
                                                                .startNowTextColor,
                                                        title:
                                                            'See Explanation',
                                                        onPressed: () {
                                                          if (hasButtonSeenExplanation) {
                                                            hasSeenExplanation =
                                                                true;
                                                            if (!_subjectController
                                                                .isCheckedCorrectAnswer) {
                                                              _quizController
                                                                  .quizQuestionList[
                                                                      _quizController
                                                                          .questionIndex]
                                                                  .isAttempted = true;
                                                              _quizController
                                                                  .quizQuestionList[
                                                                      _quizController
                                                                          .questionIndex]
                                                                  .isUserAnswer = false;
                                                            }
                                                            showExplanationDialog(
                                                                context,
                                                                _quizController
                                                                    .quizQuestionList[
                                                                        _quizController
                                                                            .questionIndex]
                                                                    .Explanation);
                                                            // createSnackBar(
                                                            //     _quizController
                                                            //         .quizQuestionList[
                                                            //             _quizController
                                                            //                 .questionIndex]
                                                            //         .Explanation,
                                                            //     context);
                                                            //hasSeenExplanation = true;
                                                          }
                                                        },
                                                      ),
                                                      HeroButton(
                                                        height: 30.0,
                                                        width: 130.0,
                                                        radius: AppValues
                                                            .commonButtonCornerRadius,
                                                        gradient: flaggedAsDifficult
                                                            ? AppColors
                                                                .progressbarColorPressed
                                                            : AppColors
                                                                .progressbarColor,
                                                        title: 'Mark Difficult',
                                                        onPressed: () {
                                                          flaggedAsDifficult =
                                                              !flaggedAsDifficult;
                                                          _quizController
                                                              .updateBuilder();
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 30.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      _quizController
                                                                  .questionIndex !=
                                                              0
                                                          ? Container(
                                                              child: HeroButton(
                                                                height: 30.0,
                                                                width: 130.0,
                                                                radius: AppValues
                                                                    .commonButtonCornerRadius,
                                                                gradient: AppColors
                                                                    .progressbarColor,
                                                                title: "Back",
                                                                onPressed: () {
                                                                  goBackToPreviousQuestion();

                                                                  // Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                                  //         builder: (_) => AnswerScreen(
                                                                  //             questions: widget.questions, answers: _answers)));
                                                                },
                                                              ),
                                                            )
                                                          : Container(
                                                              child: HeroButton(
                                                                height: 30.0,
                                                                width: 130.0,
                                                                radius: AppValues
                                                                    .commonButtonCornerRadius,
                                                                gradient: AppColors
                                                                    .progressbarColorPressed,
                                                                title: "Back",
                                                                onPressed:
                                                                    () {},
                                                              ),
                                                            ),
                                                      HeroButton(
                                                        height: 30.0,
                                                        width: 130.0,
                                                        radius: AppValues
                                                            .commonButtonCornerRadius,
                                                        gradient: AppColors
                                                            .progressbarColor,
                                                        title: _quizController
                                                                    .questionIndex <
                                                                _quizController
                                                                        .quizQuestionList
                                                                        .length -
                                                                    1
                                                            ? 'Next Question'
                                                            : ' Submit',
                                                        onPressed: () {
                                                          updateQuizAnswer();

                                                          // Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                          //         builder: (_) => AnswerScreen(
                                                          //             questions: widget.questions, answers: _answers)));
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      _quizController.skippedQuestionObjectList.length > 0
                          ? Align(
                              alignment: AlignmentDirectional.bottomEnd,
                              child: Container(
                                padding: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryBtnColor,
                                ),
                                height: WidgetProperties.screenHeight(context) *
                                    0.12,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Textview2(
                                      title: "Skipped Questions",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0,
                                      color: AppColors.textWhiteColor,
                                    ),
                                    Container(
                                      height: 50.0,
                                      width:
                                          WidgetProperties.screenWidth(context),
                                      child: ListView.builder(
                                        itemCount: _quizController
                                            .skippedQuestionObjectList.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              _quizController
                                                  .isSkippedSelected = true;
                                              _quizController.nextQuestionSkipped(
                                                  _quizController
                                                      .quizQuestionList
                                                      .indexOf(_quizController
                                                              .skippedQuestionObjectList[
                                                          index]));

                                              flaggedAsSkipped = false;
                                              toggle = false;
                                              hasSeenExplanation = false;
                                              flaggedAsDifficult = false;
                                              isAttempted = false;
                                              _quizController
                                                  .updateUserBuilder();
                                            },
                                            splashColor: AppColors.primaryColor,
                                            child: Container(
                                              padding: EdgeInsets.all(8.0),
                                              margin:
                                                  EdgeInsets.only(left: 5.0),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle),
                                              child: Center(
                                                child: Textview2(
                                                  title: (index + 1).toString(),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14.0,
                                                  color: AppColors.primaryColor,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                child: Loader(),
              );
            }
          },
        ),
      ),
    );
  }

  getQuestionList() async {
    var attemptQuizVM = AttemptQuizVm();
    attemptQuizVM.Date = WidgetProperties.utcTimeToString();
    if (_historyController.selectedReAtemptedQuestionId != null) {
      attemptQuizVM.QuizId = _historyController.selectedReAtemptedQuestionId;
      attemptQuizVM.ReAttempt = true;
    } else if (_notificationController.notificationQuizId != null) {
      attemptQuizVM.QuizId = _notificationController.notificationQuizId;
    } else {
      attemptQuizVM.QuizId = _quizController.responseId;
    }

    Result res = await _quizController.getQuetionsForAttempQuiz(attemptQuizVM);
    if (res != null) _quizController.quizQuestionList = res.body;
    if (_quizController.quizQuestionList != null) {
      _userRepository.deleteQuiz();
      _userRepository.insertList(_quizController.quizQuestionList);
      getList();
      _quizController.quizQuestionList.forEach((element) {
        if (element.Serial == -211 || element.Serial == -214) {
          // ignore: unnecessary_statements
          ToastClass.showToast("Link has expired.", ToastGravity.BOTTOM,
              AppColors.accentColor1, Colors.white, 15.0, Toast.LENGTH_LONG);
          Get.back();
        } else if (element.Serial == -212) {
          // ignore: unnecessary_statements
          ToastClass.showToast(
              "Cannot start the Quiz before start time.",
              ToastGravity.BOTTOM,
              AppColors.accentColor1,
              Colors.white,
              15.0,
              Toast.LENGTH_LONG);
          Get.back();
        } else if (element.Serial == -213) {
          // ignore: unnecessary_statements
          ToastClass.showToast(
              "You are not invited for this Quiz.",
              ToastGravity.BOTTOM,
              AppColors.accentColor1,
              Colors.white,
              15.0,
              Toast.LENGTH_LONG);
          Get.back();
        } else if (element.Serial == -215) {
          ToastClass.showToast(
              "Can not restart quiz , you can only re-attempt it",
              ToastGravity.BOTTOM,
              AppColors.accentColor1,
              Colors.white,
              15.0,
              Toast.LENGTH_LONG);
          // ignore: unnecessary_statements
          Get.back();
        }
      });
    }

    _quizController.quizQuestionList
        .sort((a, b) => a.Serial.compareTo(b.Serial));
    _quizController.updateUserBuilder();
  }

  updateQuizAnswer() async {
    if (!isAttempted) {
      if (hasSeenExplanation) {
        flaggedAsSkipped = false;
      } else {
        ToastClass.showToast("Question marked as skipped", ToastGravity.BOTTOM,
            Colors.red, Colors.white, 15.0, Toast.LENGTH_SHORT);
        flaggedAsSkipped = true;
        if (flaggedAsSkipped) {
          _quizController.quizQuestionList[_quizController.questionIndex]
              .FlaggedAsSkipped = flaggedAsSkipped;
          found = false;
          _quizController.skippedQuestionObjectList.forEach((element) {
            if (element.QuestionId ==
                _quizController.quizQuestionList[_quizController.questionIndex]
                    .QuestionId) {
              found = true;
            }
          });

          if (!found) {
            _quizController.skippedQuestionObjectList.add(_quizController
                .quizQuestionList[_quizController.questionIndex]);
          }
        }
      }
    } else {
      flaggedAsSkipped = false;
      int removable = 0;
      _quizController.skippedQuestionObjectList.forEach((element) {
        if (element.QuestionId ==
            _quizController
                .quizQuestionList[_quizController.questionIndex].QuestionId) {
          removable = element.QuestionId;
        }
      });
      _quizController.skippedQuestionObjectList
          .removeWhere((element) => element.QuestionId == removable);
    }
    await attemptedQuiz();
  }

  attemptedQuiz() async {
    var attemptQuizVM = AttemptQuizVm();
    attemptQuizVM.QuizId =
        _quizController.quizQuestionList[_quizController.questionIndex].QuizId;
    attemptQuizVM.Date = WidgetProperties.utcTimeToString();
    attemptQuizVM.QuestionId = _quizController
        .quizQuestionList[_quizController.questionIndex].QuestionId;
    attemptQuizVM.AttemptedQuizDetailId = _quizController
        .quizQuestionList[_quizController.questionIndex].AttemptedQuizDetailId;
    attemptQuizVM.FlaggedAsDifficult = flaggedAsDifficult;
    attemptQuizVM.HasSeenExplanation = hasSeenExplanation;
    attemptQuizVM.FlaggedAsSkipped = flaggedAsSkipped;

    // _quizController.skippedQuestionObjectList.add(list);
    attemptQuizVM.AnswerId = answerId;
    Result res = await _quizController.updateQuizAnswer(attemptQuizVM);
    if (res == null) {
      ToastClass.showToast("Please Select Subject", ToastGravity.BOTTOM,
          Colors.red, Colors.white, 15.0, Toast.LENGTH_SHORT);
    } else {
      flaggedAsSkipped = false;
      toggle = false;
      hasSeenExplanation = false;
      hasButtonSeenExplanation = false;
      flaggedAsDifficult = false;
      isAttempted = false;
      if (_quizController.isSkippedSelected) {
        _quizController
            .nextQuestionSkipped(_quizController.currentQuestionIndex);
        _quizController.isSkippedSelected = false;
        _quizController.updateUserBuilder();
      } else {
        if (_quizController.questionIndex <
            _quizController.quizQuestionList.length - 1) {
          _quizController.nextQuestion();
          _quizController.updateUserBuilder();
        } else {
          _quizController.updateDashboardData();
          _resultController.skippedQuestionObjectList =
              _quizController.skippedQuestionObjectList;
          _resultController.quizQuestionList = _quizController.quizQuestionList;

          Navigator.of(Get.context)
              .pushReplacement(MaterialPageRoute(builder: (_) => TabbarView()));
        }
      }
    }
  }

  Future<bool> _onWillPop() async {
    showDialog(
      context: Get.context,
      useRootNavigator: true,
      builder: (buildContext) => AlertDialog(
        title: Text('Do you really want to leave?'),
        actions: <Widget>[
          FlatButton(
            child: Text('No'),
            onPressed: () => Navigator.pop(buildContext, false),
          ),
          FlatButton(
            child: Text('Yes'),
            onPressed: () {
              Navigator.pop(buildContext, false);
              Get.find<DashboardController>().currentIndex = 0;
              Navigator.pushAndRemoveUntil(
                  Get.context,
                  RoutePage(builder: (context) => DashboardScreen()),
                  (route) => false);
            },
          ),
        ],
      ),
    );
    return false;
  }

  Widget addRadioButton(
      int answerIndex, String title, BuildContext buildContext) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Flexible(
            flex: 1,
            child: AbsorbPointer(
              absorbing: toggle,
              child: RadioListTile(
                title: Html(
                  defaultTextStyle: getStyle(answerIndex),
                  // backgroundColor: _quizController
                  //         .quizQuestionList[answerIndex].QuestionAnswerList
                  //     ? Colors.green
                  //     : Colors.red,
                  data: title,
                ),
                toggleable: toggle,
                activeColor: AppColors.textBlackColor,
                value: _quizController
                        .quizQuestionList[_quizController.questionIndex]
                        .QuestionAnswerList
                        .isNotEmpty
                    ? _quizController
                        .quizQuestionList[_quizController.questionIndex]
                        .QuestionAnswerList[answerIndex]
                        .Id
                    : "",
                groupValue: _groupValue,
                onChanged: (value) {
                  if (_subjectController.isCheckedCorrectAnswer) {
                    toggle = true;
                  }
                  hasButtonSeenExplanation = true;
                  isAttempted = true;

                  answerId = value;
                  quizQuestionAnswer = _quizController
                      .quizQuestionList[_quizController.questionIndex]
                      .QuestionAnswerList
                      .where((element) => element.Id == answerId)
                      .first;
                  quizQuestionAnswer.isChecked = true;

                  if (_subjectController.isCheckedCorrectAnswer ||
                      (!_subjectController.isCheckedCorrectAnswer &&
                          !hasSeenExplanation)) {
                    _quizController
                        .quizQuestionList[_quizController.questionIndex]
                        .isUserAnswer = quizQuestionAnswer.isCorrect;
                  }
                  _quizController
                      .quizQuestionList[_quizController.questionIndex]
                      .isAttempted = isAttempted;

                  _groupValue = value;
                  _quizController.updateUserBuilder();
                },
              ),
            )),
        // Flexible(
        //   flex: 2,
        //   child: Html(
        //     defaultTextStyle: getStyle(answerIndex),
        //     // backgroundColor: _quizController
        //     //         .quizQuestionList[answerIndex].QuestionAnswerList
        //     //     ? Colors.green
        //     //     : Colors.red,
        //     data: title,
        //   ),
        // ),
      ],
    );
  }

  TextStyle getStyle(int index) {
    Color style;
    style = isAttempted
        ? _subjectController.isCheckedCorrectAnswer
            ? _quizController.quizQuestionList[_quizController.questionIndex]
                        .QuestionAnswerList[index].isCorrect &&
                    _quizController
                        .quizQuestionList[_quizController.questionIndex]
                        .QuestionAnswerList[index]
                        .isChecked
                ? Colors.green
                : !_quizController
                            .quizQuestionList[_quizController.questionIndex]
                            .QuestionAnswerList[index]
                            .isCorrect &&
                        _quizController
                            .quizQuestionList[_quizController.questionIndex]
                            .QuestionAnswerList[index]
                            .isChecked
                    ? Colors.red
                    : _quizController
                                .quizQuestionList[_quizController.questionIndex]
                                .QuestionAnswerList[index]
                                .isCorrect &&
                            !_quizController
                                .quizQuestionList[_quizController.questionIndex]
                                .QuestionAnswerList[index]
                                .isChecked
                        ? Colors.green
                        : Colors.black
            : Colors.black
        : Colors.black;

    return TextStyle(color: style);
  }

  showExplanationDialog(BuildContext buildContext, String message) {
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
              margin: EdgeInsets.only(
                left: AppValues.horizontalMargin,
                right: AppValues.horizontalMargin,
              ),
              child: Material(
                elevation: AppValues.cardElevation,
                color: Colors.white,
                borderRadius: BorderRadius.all(
                    Radius.circular(AppValues.commonBodyCardRadius)),
                child: Container(
                    padding: EdgeInsets.all(10.0),
                    height: 200.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Html(
                          data: message,
                          defaultTextStyle:
                              TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                        Container(
                          child: HeroButton(
                            width: WidgetProperties.screenWidth(buildContext),
                            height: 40.0,
                            radius: 22.0,
                            gradient: AppColors.formContinueButtomColor,
                            title: "Ok",
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        )
                      ],
                    )),
              ),
            ));
      },
    );
  }

  void getList() async {
    _quizController.localDbQuestionList =
        await _userRepository.getAllQuestions();
    print(_quizController.quizQuestionList.toString());
  }

  void goBackToPreviousQuestion() {
    _quizController.questionIndex = _quizController.questionIndex - 1;
    _quizController.updateBuilder();
  }
}
