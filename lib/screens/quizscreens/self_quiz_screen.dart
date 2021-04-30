import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:e_quiz/common/ui_widgets/hero_button3.dart';
import 'package:e_quiz/common/ui_widgets/text_view.dart';
import 'package:e_quiz/controllers/quiz_controller.dart';
import 'package:e_quiz/controllers/subject_controller.dart';
import 'package:e_quiz/db/user_crud.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/models/quiz/quiz_generation_vm.dart';
import 'package:e_quiz/screens/quizscreens/question_screen.dart';
import 'package:e_quiz/screens/common/common_background.dart';
import 'package:e_quiz/screens/quizscreens/chapter_screen.dart';
import 'package:e_quiz/screens/quizscreens/student_list_screen.dart';
import 'package:e_quiz/utils/colors.dart';
import 'package:e_quiz/utils/constants.dart';
import 'package:e_quiz/utils/dialog/toastclass.dart';
import 'package:e_quiz/utils/routepage.dart';
import 'package:e_quiz/utils/values.dart';
import 'package:e_quiz/utils/widgetproperties.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:e_quiz/utils/dialog/loadingcircle/lib/ball_scale_indicator.dart';
import 'package:e_quiz/utils/dialog/loadingcircle/loading.dart';

class SelfQuizScreen extends StatelessWidget {
  var quizGenerationVM = QuizGenerationVM();
  var quizController = Get.find<QuizController>();
  var subjectController = Get.find<SubjectController>();
  var numberOfQuestionsController = TextEditingController();
  ScrollController _scrollController = new ScrollController();
  var lnNode = FocusNode();
  int attemptQuizVM;
  GlobalKey<FormState> _globalFormKey = GlobalKey();

  String selectedSubjectName = "";
  int selectedSubjectId;

  var selectedSubjectDecoration = BoxDecoration(
      color: AppColors.textWhiteColor,
      borderRadius: BorderRadius.circular(7.0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          height: WidgetProperties.screenHeight(context),
          child: Stack(
            children: [
              BodyBackground(
                heightTop: WidgetProperties.screenHeight(context) * 0.3,
                heightBottom: WidgetProperties.screenHeight(context) * 0.6,
                body: Container(),
              ),
              Container(
                margin: EdgeInsets.only(top: 35.0),
                alignment: Alignment.topCenter,
                child: SvgPicture.asset(
                  Constants.BASE_PATH_IMAGE + "test.svg",
                  height: 100.0,
                  width: 100.0,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 105.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
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
                            height:
                                WidgetProperties.screenHeight(context) * 0.8,
                            child: subjectWidget(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget subjectWidget(BuildContext context) {
    return GetBuilder<SubjectController>(
      initState: (child) {
        quizController.ini();
        getQuizSubjectList();
      },
      builder: (_) {
        if (subjectController.quizSubjectList == null) {
          return Center(
            child: Container(
              child: Loading(
                  indicator: BallScaleIndicator(),
                  size: 100.0,
                  color: Colors.pink),
            ),
          );
        } else {
          return Form(
            key: _globalFormKey,
            child: SingleChildScrollView(
              child: Container(
                height: WidgetProperties.screenHeight(context),
                margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Textview2(
                      title: "Select Your Subjects",
                      fontSize: 18.0,
                      color: AppColors.accent3Color,
                      fontWeight: FontWeight.w900,
                      fontFamily: AppValues.fontFamily,
                    ),
                    Textview2(
                      title: "you can select and view your subjects",
                      fontSize: 12.0,
                      color: AppColors.textBlackColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppValues.fontFamily,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 5,
                      child: buildSubjectList(),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Textview2(
                            title: "No. of questions",
                            fontSize: 8.0,
                            color: AppColors.textBlackColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppValues.fontFamily,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5.0),
                            height: 30.0,
                            decoration: selectedSubjectDecoration,
                            child: TextFormField(
                              textAlignVertical: TextAlignVertical.center,
                              autovalidateMode: AutovalidateMode.always,
                              obscureText: false,
                              textAlign: TextAlign.left,
                              controller: numberOfQuestionsController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Checkbox(
                                value: subjectController.isCheckedCorrectAnswer,
                                activeColor: Colors.blue,
                                onChanged: (bool IscheckedCorrectAnswerValue) {
                                  subjectController
                                      .updateIsCheckedCorrectAnswer(
                                          IscheckedCorrectAnswerValue);
                                  subjectController.updateUserBuilder();
                                }),
                          ),
                          Expanded(
                            flex: 14,
                            child: Container(
                              margin: EdgeInsets.only(left: 5.0),
                              child: Text(
                                Constants.SEE_CORRECT_ANSWER_TEXT,
                                style: TextStyle(
                                    color: AppColors.textBlackColor,
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Checkbox(
                              value:
                                  subjectController.isCheckedDiffcultQuestion,
                              activeColor: Colors.blue,
                              onChanged: (bool IscheckedDiffcultQuestion) {
                                subjectController
                                    .updateIsCheckedDiffcultQuestion(
                                        IscheckedDiffcultQuestion);
                                subjectController.updateUserBuilder();
                              }),
                        ),
                        Expanded(
                          flex: 14,
                          child: Container(
                            margin: EdgeInsets.only(left: 5.0),
                            child: Text(
                              Constants.GENERATE_DIFFICULT_QUESTION_TEXT,
                              style: TextStyle(
                                  color: AppColors.textBlackColor,
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Checkbox(
                              value: subjectController.isCheckedWrongQuestion,
                              activeColor: Colors.blue,
                              onChanged: (bool isCheckedWrongAnswer) {
                                subjectController.updateIsCheckedWrongAnswer(
                                    isCheckedWrongAnswer);
                                subjectController.updateUserBuilder();
                              }),
                        ),
                        Expanded(
                          flex: 14,
                          child: Container(
                            margin: EdgeInsets.only(left: 5.0),
                            child: Text(
                              Constants.GENERATE_WRONG_QUESTION_TEXT,
                              style: TextStyle(
                                  color: AppColors.textBlackColor,
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Checkbox(
                              value: subjectController.isCheckedSkippedQuestion,
                              activeColor: Colors.blue,
                              onChanged: (bool isCheckedSkippedQuestion) {
                                subjectController
                                    .updateIsCheckedSkippedQuestion(
                                        isCheckedSkippedQuestion);
                                subjectController.updateUserBuilder();
                              }),
                        ),
                        Expanded(
                          flex: 14,
                          child: Container(
                            margin: EdgeInsets.only(left: 5.0),
                            child: Text(
                              Constants.GENERATE_SKIPPED_QUESTION_TEXT,
                              style: TextStyle(
                                  color: AppColors.textBlackColor,
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15.0),
                      child: HeroButton3(
                        height: 45.0,
                        radius: AppValues.commonButtonCornerRadius,
                        gradient: AppColors.primaryBtnColor,
                        title: 'Start Now',
                        onPressed: () {
                          if (subjectController.quizSubjectList
                              .where((element) => element.checked)
                              .toList()
                              .isBlank) {
                            ToastClass.showToast(
                                "Please Select Subject",
                                ToastGravity.BOTTOM,
                                Colors.red,
                                Colors.white,
                                10.0,
                                Toast.LENGTH_LONG);
                          } else {
                            generateQuiz(context);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Widget buildSubjectList() {
    return DraggableScrollbar.rrect(
      backgroundColor: AppColors.primaryColor,
      controller: _scrollController,
      alwaysVisibleScrollThumb: true,
      child: ListView.builder(
        padding: EdgeInsets.all(25.0),
        controller: _scrollController,
        physics: BouncingScrollPhysics(),
        itemCount: subjectController.quizSubjectList.length,
        itemBuilder: (context, index) {
          return listSubjectWidget(context, index);
        },
      ),
    );
  }

  Widget listSubjectWidget(BuildContext buildContext, int index) {
    return Container(
      margin: EdgeInsets.only(top: 5.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: (){
                  subjectController.selectedIndex = index;
                  selectedSubjectId =
                      subjectController.quizSubjectList[index].Id;
                  subjectController.quizSubjectList[index].checked =
                  !subjectController.quizSubjectList[index].checked;
                  selectedSubjectName =
                      subjectController.quizSubjectList[index].SubjectName;
                  Navigator.of(buildContext).push(RoutePage(builder: (context) {
                    return ChapterScreen.customConstructor(
                      selectedSubjectId,
                      selectedSubjectName,
                    );
                  })).then((value) {
                    subjectController.update();
                  });

                },
                child: Container(
                  padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: Textview2(
                    title: subjectController.quizSubjectList[index].SubjectName,
                    textAlign: TextAlign.center,
                    fontSize: 15.0,
                    color: AppColors.commoneadingtextColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppValues.fontFamily,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  subjectController.selectedIndex = index;
                  selectedSubjectId =
                      subjectController.quizSubjectList[index].Id;
                  subjectController.quizSubjectList[index].checked =
                  !subjectController.quizSubjectList[index].checked;
                  selectedSubjectName =
                      subjectController.quizSubjectList[index].SubjectName;
                  Navigator.of(buildContext).push(RoutePage(builder: (context) {
                    return ChapterScreen.customConstructor(
                      selectedSubjectId,
                      selectedSubjectName,
                    );
                  })).then((value) {
                    subjectController.update();
                  });
                },
                child: returnIcon(index),
              )
            ],
          ),
          Divider(
            height: 3.0,
            color: AppColors.textBlackColor,
          ),
        ],
      ),
    );
  }

  Widget returnIcon(int index) {
    if (subjectController.quizSubjectList[index].chapterList != null) {
      if (subjectController.selectedIndex == index &&
          subjectController.quizSubjectList[index].Id ==
              subjectController
                  .quizSubjectList[subjectController.selectedIndex].Id) {
        if (!subjectController
            .quizSubjectList[subjectController.selectedIndex].chapterList
            .where((element) => element.checked)
            .toList()
            .isBlank) {
          return SvgPicture.asset(
            Constants.BASE_PATH_ICON + "eye.svg",
            height: 15.0,
            width: 15.0,
          );
        } else {
          return SvgPicture.asset(
            Constants.BASE_PATH_ICON + "plus.svg",
            height: 15.0,
            width: 15.0,
          );
        }
      } else if (subjectController.selectedIndex != index &&
          !subjectController.quizSubjectList[index].chapterList
              .where((element) => element.checked)
              .toList()
              .isBlank) {
        return SvgPicture.asset(
          Constants.BASE_PATH_ICON + "eye.svg",
          height: 15.0,
          width: 15.0,
        );
      } else {
        return SvgPicture.asset(
          Constants.BASE_PATH_ICON + "plus.svg",
          height: 15.0,
          width: 15.0,
        );
      }
    } else {
      return SvgPicture.asset(
        Constants.BASE_PATH_ICON + "plus.svg",
        height: 15.0,
        width: 15.0,
      );
    }
  }

  getQuizSubjectList() async {
    Result res = await subjectController.loadActiveSubjectsForQuiz();
    if (res != null) subjectController.quizSubjectList = res.body;
    subjectController.updateUserBuilder();
  }

  void generateQuiz(BuildContext buildContext) async {
    var quizGenerationVM = QuizGenerationVM();
    quizGenerationVM.userEntity = await UserCrud.getUserCopy();
    quizGenerationVM.SubjectIds = subjectController.getBufferedSubjectIds();
    quizGenerationVM.ChapterIds =
        subjectController.selectedChapterIds.toString();
    quizGenerationVM.Invitees = subjectController.selectedStudentIds.toString();
    quizGenerationVM.ChoosenNumberofQuestions =
        int.tryParse(numberOfQuestionsController.text);
    if (quizGenerationVM.ChoosenNumberofQuestions.isBlank) {
      ToastClass.showToast("Please Enter No. of Questions", ToastGravity.BOTTOM,
          Colors.red, Colors.white, 10.0, Toast.LENGTH_LONG);
      return;
    }
    quizGenerationVM.isCompetition = subjectController.isQuizType;
    quizGenerationVM.StartTime = WidgetProperties.utcTimeToString();
    quizGenerationVM.GenerateFromDifficult =
        subjectController.isCheckedDiffcultQuestion;
    quizGenerationVM.SeeAnsSimaltaneously =
        subjectController.isCheckedCorrectAnswer;
    quizGenerationVM.GenerateFromWrong =
        subjectController.isCheckedWrongQuestion;
    quizGenerationVM.GenerateFromSkipped =
        subjectController.isCheckedSkippedQuestion;
    Result generateQuizResult =
        await quizController.generateQuiz(quizGenerationVM);
    if (generateQuizResult != null) {
      var quizGenerationVm = generateQuizResult.body as QuizGenerationVM;
      quizController.responseId = quizGenerationVm.userEntity.ComRes.ResponseId;
      if (quizController.responseId == -121) {
        ToastClass.showToast(
            quizGenerationVm.userEntity.ComRes.ResponseMessage,
            ToastGravity.BOTTOM,
            Colors.blue,
            Colors.white,
            10.0,
            Toast.LENGTH_LONG);
      } else {
        WidgetProperties.goToNextPage(buildContext, QuestionScreen());
      }
    }
  }
}
