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

class ChapterScreen extends StatelessWidget {

  int selectedSubjectId = 0;
  var selectedSubjectIds = StringBuffer();
  String numberOfQuestions = "";
  String subjectName = "";
  var _subjectController = Get.find<SubjectController>();
  var _chapterController = ChapterController();
  var _selectedSubjectModel;



  // In the constructor, require a Todo.
  ChapterScreen.customConstructor(this.selectedSubjectId, this.subjectName) {
    loadChapterBySubjectId(selectedSubjectId);
    _selectedSubjectModel =
        _subjectController.quizSubjectList[_subjectController.selectedIndex];
    _subjectController
        .quizSubjectList[_subjectController.selectedIndex].chapterList = null;
  }

  ChapterScreen({this.selectedSubjectIds, this.numberOfQuestions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.primaryBtnColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
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
                    title: subjectName,
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
    );
  }

  Widget form(BuildContext context) {
    return GetBuilder<ChapterController>(
      init: _chapterController,
      builder: (_) {
        if (_selectedSubjectModel.chapterList == null) {
          return Center(
            child: Container(
              child: Loading(
                  indicator: BallScaleIndicator(),
                  size: 100.0,
                  color: Colors.pink),
            ),
          );
        } else if (_selectedSubjectModel.chapterList.isEmpty) {
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
                    Navigator.pop(context);
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
      itemCount: _selectedSubjectModel.chapterList.length,
      itemBuilder: (context, index) {
        return listWidgetChapter(context, index);
      },
    );
  }

  Widget listWidgetChapter(BuildContext buildContext, int index) {
    return GestureDetector(
      onTap: () {
        // subjectController.quizSubjectList
        //     .where((element) => element.Id == selectedSubjectId)
        //     .first
        //     .chapterList[index]
        //     .checked = !subjectController.chapterList[index].checked;
        _selectedSubjectModel.chapterList[index].checked =
            !_selectedSubjectModel.chapterList[index].checked;
        _chapterController.update();
      },
      child: Container(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _selectedSubjectModel.chapterList != null
                      ? Textview2(
                          title: _selectedSubjectModel
                              .chapterList[index].ChapterName,
                          fontSize: 15.0,
                          color:
                              _selectedSubjectModel.chapterList[index].checked
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
      _selectedSubjectModel.chapterList = listChapters.body;
    debugPrint(_selectedSubjectModel.chapterList.toString());
    _chapterController.update();
  }
}
