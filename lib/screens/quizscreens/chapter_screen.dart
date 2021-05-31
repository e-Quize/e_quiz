import 'package:e_quiz/common/ui_widgets/common_card.dart';
import 'package:e_quiz/common/ui_widgets/custom_button2.dart';
import 'package:e_quiz/common/ui_widgets/text_view.dart';
import 'package:e_quiz/controllers/chapter_controller.dart';
import 'package:e_quiz/controllers/subject_controller.dart';
import 'package:e_quiz/db/user_crud.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/models/quiz/subject_model_params.dart';
import 'package:e_quiz/screens/common/common_background.dart';
import 'package:e_quiz/utils/colors.dart';
import 'package:e_quiz/utils/dialog/loadingcircle/lib/ball_scale_indicator.dart';
import 'package:e_quiz/utils/dialog/loadingcircle/loading.dart';
import 'package:e_quiz/utils/values.dart';
import 'package:e_quiz/utils/widgetproperties.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//region Class
class ChapterScreen extends StatelessWidget {
  var selectedSubjectIds = StringBuffer();
  String numberOfQuestions = "";

  var _subjectController = Get.find<SubjectController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print("Willll");
        checkSubjectChapters();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: AppColors.primaryBtnColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => checkSubjectChapters(),
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            BodyBackground(
              heightTop: WidgetProperties.screenHeight(context) * 0.4,
              heightBottom: WidgetProperties.screenHeight(context) * 0.4,
              body: Container(),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Textview2(
                      title: _subjectController
                          .quizSubjectList[_subjectController.selectedIndex]
                          .SubjectName,
                      fontSize: 25.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppValues.fontFamily,
                    ),
                  ),
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
                        height: WidgetProperties.screenHeight(context) * 0.6,
                        child: form(context),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget form(BuildContext context) {
    return GetBuilder<SubjectController>(
      init: _subjectController,
      id: 'new',
      initState: (wg) {
        loadChapterBySubjectId(_subjectController
            .quizSubjectList[_subjectController.selectedIndex].Id);
      },
      builder: (_) {
        if (_subjectController.quizSubjectList[_subjectController.selectedIndex]
                .chapterList ==
            null) {
          return Center(
            child: Container(
              child: Loading(
                  indicator: BallScaleIndicator(),
                  size: 100.0,
                  color: Colors.pink),
            ),
          );
        } else if (_subjectController
            .quizSubjectList[_subjectController.selectedIndex]
            .chapterList
            .isEmpty) {
          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: 15.0),
            child: GestureDetector(
              child: CommonCard(
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 20.0),
                      child: Text(
                        "No Chapter Found",
                        style: TextStyle(fontSize: 20.0),
                      ))),
            ),
          );
        } else {
          return Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 0.6,
                      child: buildChapterList(),
                    ),
                  ),
                ),
                HeroButton2(
                  height: 35.0,
                  width: 150.0,
                  radius: AppValues.commonButtonCornerRadius,
                  gradient: AppColors.savequizscreenColor,
                  title: 'Save and Back',
                  onPressed: () {
                    checkSubjectChapters();
                  },
                )
              ],
            ),
          );
        }
      },
    );
  }

  Widget buildChapterList() {
    return ListView.builder(
      itemCount: _subjectController
          .quizSubjectList[_subjectController.selectedIndex].chapterList.length,
      itemBuilder: (context, index) {
        return listWidgetChapter(context, index);
      },
    );
  }

  Widget listWidgetChapter(BuildContext buildContext, int index) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        _subjectController.quizSubjectList[_subjectController.selectedIndex]
                .chapterList[index].checked =
            !_subjectController
                .quizSubjectList[_subjectController.selectedIndex]
                .chapterList[index]
                .checked;
        _subjectController.update(['new']);
      },
      child: Container(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _subjectController
                              .quizSubjectList[_subjectController.selectedIndex]
                              .chapterList !=
                          null
                      ? Textview2(
                          title: _subjectController
                              .quizSubjectList[_subjectController.selectedIndex]
                              .chapterList[index]
                              .ChapterName,
                          fontSize: 15.0,
                          color: _subjectController
                                  .quizSubjectList[
                                      _subjectController.selectedIndex]
                                  .chapterList[index]
                                  .checked
                              ? AppColors.primaryColor
                              : AppColors.commoneadingtextColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppValues.fontFamily,
                        )
                      : Container(),
                ),
                // SvgPicture.asset(
                //   Constants.BASE_PATH_ICON + "down.svg",
                //   height: 7.0,
                //   width: 7.0,
                // )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 5.0),
              child: Divider(
                color: AppColors.primaryBtnColor,
                height: 1.6,
              ),
            ),
            // Container(
            //   margin: EdgeInsets.only(top: 10.0),
            //   height: MediaQuery.of(buildContext).size.height / 0.7,
            //   child: buildChapterList(outerIndex),
            // ),
          ],
        ),
      ),
    );
  }

  void loadChapterBySubjectId(int subjectId) async {
    var subjectModelParams = SubjectModelParams();
    subjectModelParams.userEntity = await UserCrud.getUserCopy();
    subjectModelParams.Id = subjectId;
    Result listChapters = await _subjectController
        .loadActiveChaptersBySubjectIdForQuiz(subjectModelParams);
    if (listChapters != null)
      _subjectController.quizSubjectList[_subjectController.selectedIndex]
          .chapterList = listChapters.body;
    _subjectController.update(['new']);
  }

  checkSubjectChapters() {
    if (_subjectController
            .quizSubjectList[_subjectController.selectedIndex].chapterList
            .where((element) => element.checked)
            .toList()
            .length ==
        0) {
      _subjectController
          .quizSubjectList[_subjectController.selectedIndex].checked = false;
      _subjectController
          .quizSubjectList[_subjectController.selectedIndex].chapterList = null;
    } else {
      _subjectController
          .quizSubjectList[_subjectController.selectedIndex].checked = true;
    }
    _subjectController.update();
    Navigator.of(Get.context).pop();
  }
}
//endregion
