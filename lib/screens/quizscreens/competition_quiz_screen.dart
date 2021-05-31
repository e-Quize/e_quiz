import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:e_quiz/common/ui_widgets/hero_button3.dart';
import 'package:e_quiz/common/ui_widgets/text_view.dart';
import 'package:e_quiz/controllers/quiz_controller.dart';
import 'package:e_quiz/controllers/student_controller.dart';
import 'package:e_quiz/controllers/subject_controller.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/models/quiz/quiz_generation_vm.dart';
import 'package:e_quiz/screens/common/common_background.dart';
import 'package:e_quiz/screens/quizscreens/chapter_screen.dart';
import 'package:e_quiz/screens/quizscreens/student_list_screen.dart';
import 'package:e_quiz/utils/colors.dart';
import 'package:e_quiz/utils/constants.dart';
import 'package:e_quiz/utils/dialog/loadingcircle/lib/ball_scale_indicator.dart';
import 'package:e_quiz/utils/dialog/loadingcircle/loading.dart';
import 'package:e_quiz/utils/dialog/toastclass.dart';
import 'package:e_quiz/utils/routepage.dart';
import 'package:e_quiz/utils/values.dart';
import 'package:e_quiz/utils/widgetproperties.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class CompetitionQuizScreen extends StatelessWidget {
  var quizGenerationVM = QuizGenerationVM();
  var quizController = Get.find<QuizController>();
  var studentController = Get.find<StudentController>();
  var subjectController = Get.find<SubjectController>();
  var numberOfQuestionsController = TextEditingController();
  ScrollController scrollController = new ScrollController();

  GlobalKey<FormState> _globalFormKey = GlobalKey();

  var lnNode = FocusNode();
  int attemptQuizVM;
  bool isAlreadyTapped = false;

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
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 0.0),
                      alignment: Alignment.topCenter,
                      child: SvgPicture.asset(
                        Constants.BASE_PATH_IMAGE + "test.svg",
                        height: 120.0,
                        width: 150.0,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 0.0, bottom: 10),
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
                                borderRadius: BorderRadius.all(Radius.circular(
                                    AppValues.commonBodyCardRadius)),
                                child: Container(
                                  height:
                                      WidgetProperties.screenHeight(context) *
                                          0.55,
                                  child: buildList(context),
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
            ],
          ),
        ),
      ),
    );
  }

  Widget buildList(BuildContext context) {
    return GetBuilder<SubjectController>(
      initState: (child) {
        quizController.ini();
        numberOfQuestionsController.text = null;
        studentController.noOfQuestions = 0;
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
                      title: "You can select and view your subjects",
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
                    Container(
                      margin: EdgeInsets.only(top: 15.0),
                      child: HeroButton3(
                        height: 45.0,
                        radius: AppValues.commonButtonCornerRadius,
                        gradient: AppColors.primaryBtnColor,
                        title: 'Select students',
                        onPressed: () {
                          goToNextScreen();
                          // Navigator.push(
                          //   context,
                          //   PageRouteBuilder(
                          //     pageBuilder: (c, a1, a2) => FadeTransition(
                          //         opacity: a1, child: StudentList()),
                          //     transitionsBuilder: (c, anim, a2, child) =>
                          //         FadeTransition(opacity: anim, child: child),
                          //     transitionDuration: Duration(milliseconds: 300),
                          //   ),
                          // ).then((value) {
                          //   studentController.ini();
                          // });
                          //
                          // // if (subjectController.quizSubjectList
                          // //     .where((element) => element.checked)
                          // //     .toList()
                          // //     .isNullOrBlank) {
                          // //   ToastClass.showToast(
                          // //       "Please Select Subject",
                          // //       ToastGravity.BOTTOM,
                          // //       Colors.red,
                          // //       Colors.white,
                          // //       10.0,
                          // //       Toast.LENGTH_LONG);
                          // // } else {
                          // //   generateQuiz(context);
                          // // }context
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
      controller: scrollController,
      alwaysVisibleScrollThumb: true,
      child: ListView.builder(
        padding: EdgeInsets.all(25.0),
        controller: scrollController,
        physics: BouncingScrollPhysics(),
        itemCount: subjectController.quizSubjectList.length,
        itemBuilder: (context, index) {
          return subjectListWidget(context, index);
        },
      ),
    );
  }

  Widget subjectListWidget(BuildContext buildContext, int index) {
    return Container(
      margin: EdgeInsets.only(top: 5.0),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          print('zahid');
          subjectController.selectedIndex = index;
          subjectController.quizSubjectList[subjectController.selectedIndex]
              .chapterList = null;
          Navigator.of(buildContext).push(RoutePage(builder: (context) {
            return ChapterScreen();
          }));
        },
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
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
                Container(
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
      ),
    );
  }

  Widget returnIcon(int index) {
    if (subjectController.quizSubjectList[index].chapterList != null) {
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
    //   } else if (subjectController.selectedIndex != index &&
    //       !subjectController.quizSubjectList[index].chapterList
    //           .where((element) => element.checked)
    //           .toList()
    //           .isBlank) {
    //     return SvgPicture.asset(
    //       Constants.BASE_PATH_ICON + "eye.svg",
    //       height: 15.0,
    //       width: 15.0,
    //     );
    //   } else {
    //     return SvgPicture.asset(
    //       Constants.BASE_PATH_ICON + "plus.svg",
    //       height: 15.0,
    //       width: 15.0,
    //     );
    //   }
    // } else {
    //   return SvgPicture.asset(
    //     Constants.BASE_PATH_ICON + "plus.svg",
    //     height: 15.0,
    //     width: 15.0,
    //   );
    // }
  }

  getQuizSubjectList() async {
    Result res = await subjectController.loadActiveSubjectsForQuiz();
    if (res != null) subjectController.quizSubjectList = res.body;
    subjectController.updateBuilder();
  }

  goToNextScreen() async {
    String selectedSubjectIds = subjectController.getBufferedSubjectIds();
    studentController.noOfQuestions =
        int.tryParse(numberOfQuestionsController.text);
    if (selectedSubjectIds.isBlank) {
      ToastClass.showToast("Please Select Subject", ToastGravity.BOTTOM,
          Colors.red, Colors.white, 10.0, Toast.LENGTH_LONG);
    } else if (studentController.noOfQuestions == null ||
        studentController.noOfQuestions == 0) {
      ToastClass.showToast("Please Enter No. of Questions", ToastGravity.BOTTOM,
          Colors.red, Colors.white, 10.0, Toast.LENGTH_LONG);
    } else {
      WidgetProperties.goToNextPage(Get.context, StudentListScreen());
    }
  }
}
