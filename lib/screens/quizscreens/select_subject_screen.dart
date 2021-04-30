import 'package:e_quiz/common/ui_widgets/common_card.dart';
import 'package:e_quiz/common/ui_widgets/custom_button.dart';
import 'package:e_quiz/common/ui_widgets/custom_button2.dart';
import 'package:e_quiz/common/ui_widgets/generic_signup_percentage_bar.dart';
import 'package:e_quiz/common/ui_widgets/text_view.dart';
import 'package:e_quiz/controllers/quiz_controller.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/models/quiz/subject_model.dart';
import 'package:e_quiz/models/user/user_model.dart';
import 'package:e_quiz/screens/common/common_background.dart';
import 'package:e_quiz/screens/subscriptions/subject_list_screen.dart';
import 'package:e_quiz/utils/colors.dart';
import 'package:e_quiz/utils/dialog/toastclass.dart';
import 'package:e_quiz/utils/values.dart';
import 'package:e_quiz/utils/widgetproperties.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class SelectSubjectScreen extends StatelessWidget {

  int start = 0;
  int end = 0;
  int cIndex = 0;
  int cSelectedPage = 0;
  var selectedIds = StringBuffer();
  List<SubjectModel> subjectList;

  var paginationController = ScrollController();

  var selectedPageDecoration = BoxDecoration(
    color: AppColors.accentColor,
    shape: BoxShape.circle,
  );

  var decorationUnSelected = BoxDecoration();

  var quizController = QuizController();

  bool called = false;

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
          GetBuilder<QuizController>(
            init: quizController,
            builder: (_) {
              if (quizController.subjectList.isBlank) {
                return Center(
                  child: Container(
                    height: 250.0,
                    width: 250.0,
                    child: CommonCard(
                        child: Center(
                      child: Text(
                        "No Data found",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    )),
                  ),
                );
                // return Center(
                //   child: Container(
                //     child: Loading(
                //         indicator: BallScaleIndicator(),
                //         size: 100.0,
                //         color: Colors.pink),
                //   ),
                // );
              } else if (quizController.subjectList.isEmpty) {
                return Center(
                  child: Container(
                    height: 150.0,
                    width: 150.0,
                    child: CommonCard(child: Text("No Data found")),
                  ),
                );
              } else {
                if (!called) {
                  setSelected(0);
                  called = true;
                }
                return Container(
                  margin: EdgeInsets.only(
                      top: AppValues.commonSignupHeaderTopMagin),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: AppValues.horizontalMargin,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Textview2(
                              title: 'Select Your Subject',
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              textAlign: TextAlign.left,
                              fontFamily: AppValues.fontFamily,
                            ),
                            Textview2(
                              title: 'Minimum Select (2) and Maximum (5)',
                              fontSize: 10.0,
                              color: AppColors.subTitleColor,
                              fontWeight: FontWeight.w600,
                              textAlign: TextAlign.left,
                              fontFamily: AppValues.fontFamily,
                            ),
                            GenericPercentagebar(0.50),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: AppValues.horizontalMargin,
                            right: AppValues.horizontalMargin,
                            top: 15.0),
                        child: Material(
                          elevation: AppValues.cardElevation,
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                              Radius.circular(AppValues.commonBodyCardRadius)),
                          child: Column(
                            children: [
                              Container(
                                height: WidgetProperties.screenHeight(context) *
                                    0.52,
                                child: SubjectListScreen(),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 10.0),
                                      child: Textview2(
                                        title: 'Total',
                                        fontSize: 12.0,
                                        color: AppColors.commoneadingtextColor,
                                        fontWeight: FontWeight.w600,
                                        textAlign: TextAlign.left,
                                        fontFamily: AppValues.fontFamily,
                                      ),
                                    ),
                                    Textview2(
                                      title: getTotalPrice().toString(),
                                      fontSize: 12.0,
                                      color: AppColors.commoneadingtextColor,
                                      fontWeight: FontWeight.w600,
                                      textAlign: TextAlign.left,
                                      fontFamily: AppValues.fontFamily,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                alignment: AlignmentDirectional.center,
                                width: WidgetProperties.screenWidth(context),
                                height: 60.0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: Container(
                                        child: HeroButton2(
                                          width: 70.0,
                                          height: 25.0,
                                          radius: 6,
                                          textColor: AppColors.accentColor,
                                          gradient: AppColors.accentColor,
                                          title: 'Previous',
                                          onPressed: () {
                                            if (cIndex > 0) {
                                              cIndex = cIndex - 1;
                                              setSelected(cIndex);
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 2,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        controller: paginationController,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            for (int i = 0;
                                                i < getLength();
                                                i++)
                                              GestureDetector(
                                                onTap: () {
                                                  if (i != cIndex) {
                                                    cIndex = i;
                                                    // cSelectedPage = i;
                                                    setSelected(i);
                                                    if (paginationController
                                                            .offset <
                                                        paginationController
                                                            .position
                                                            .maxScrollExtent) {
                                                      paginationController.animateTo(
                                                          paginationController
                                                              .position
                                                              .maxScrollExtent,
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          curve: Curves.easeIn);
                                                    }
                                                    _.updateBuilder();
                                                  }
                                                },
                                                child: Container(
                                                  height: 18.0,
                                                  width: 18.0,
                                                  alignment: Alignment.center,
                                                  decoration: cIndex == i
                                                      ? selectedPageDecoration
                                                      : decorationUnSelected,
                                                  child: Textview2(
                                                    textAlign: TextAlign.center,
                                                    title: (i + 1).toString(),
                                                    fontSize: 10.0,
                                                    color: cIndex == i
                                                        ? Colors.white
                                                        : Colors.black87,
                                                    fontWeight: FontWeight.w900,
                                                    fontFamily:
                                                        AppValues.fontFamily,
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: Container(
                                        child: HeroButton2(
                                          width: 70.0,
                                          height: 25.0,
                                          radius: 6,
                                          gradient: AppColors.accentColor,
                                          title: 'Next',
                                          onPressed: () {
                                            if (cIndex < getLength() - 1) {
                                              cIndex = cIndex + 1;
                                              setSelected(cIndex);
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 10.0),
                                margin: EdgeInsets.symmetric(
                                    vertical: 5.0,
                                    horizontal: AppValues.horizontalMarginForm),
                                child: HeroButton(
                                  width: WidgetProperties.screenWidth(context),
                                  height: AppValues.commonButtonHeight,
                                  radius: AppValues.commonButtonCornerRadius,
                                  gradient: AppColors.formContinueButtomColor,
                                  title: 'Continue',
                                  onPressed: () {
                                    subjectSubscription();

                                    print('asdsadsad = ' +
                                        selectedIds.toString());
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  int getLength() {
    double len = (quizController.subjectList.length /
        AppValues.subjectListShowPerPageLimit);
    int r = (quizController.subjectList.length %
                AppValues.subjectListShowPerPageLimit) >
            0
        ? (len + 1).toInt()
        : len.toInt();
    return r;
  }

  setSelected(int cPageNumber) {
    if (cPageNumber == 0) {
      start = 0;
      end = AppValues.subjectListShowPerPageLimit;
    } else {
      end = AppValues.subjectListShowPerPageLimit * (cPageNumber + 1);
      start = end - AppValues.subjectListShowPerPageLimit;
    }
    quizController.setTempList(start, end);
  }

  double getTotalPrice() {
    double sum = 0;
    quizController.subjectList
        .where((element) => element.checked)
        .forEach((SubjectModel e) {
      sum += e.PerMonthAmount;
    });
    return sum.toPrecision(2);
  }

  getSubjects() async {
    Result subjectList = await quizController.loadSubjectList();
    quizController.subjectList = subjectList.body;
    quizController.updateUserBuilder();
  }

  subjectSubscription() async {
    var list =
        quizController.subjectList.where((element) => element.checked).toList();
    list.forEach((element) {
      if (list.indexOf(element) == 0) {
        selectedIds.write(element.Id.toString());
      } else {
        selectedIds.write("," + element.Id.toString());
      }
    });
    if (list.isNotEmpty) {
      var userEntity = UserEntity();
      userEntity.SubjectIdsString = selectedIds.toString();
      Result result = await quizController.subjectSubscription(userEntity);
      if (result.body != null) {
        // Navigator.of(Get.context)
        //     .push(MaterialPageRoute(builder: (context) => SlabScreen()));
      }
    } else {
      ToastClass.showToast("No Subjects Selected", ToastGravity.BOTTOM,
          Colors.red, Colors.white, 15.0, Toast.LENGTH_SHORT);
    }
  }
}
