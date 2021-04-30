import 'package:e_quiz/common/ui_widgets/hero_button3.dart';
import 'package:e_quiz/common/ui_widgets/text_view.dart';
import 'package:e_quiz/controllers/quiz_controller.dart';
import 'package:e_quiz/controllers/student_controller.dart';
import 'package:e_quiz/controllers/subject_controller.dart';
import 'package:e_quiz/db/user_crud.dart';
import 'package:e_quiz/models/attemptquiz/student_list_parameter_model.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/models/notification/notification_send_vm.dart';
import 'package:e_quiz/models/quiz/quiz_generation_vm.dart';
import 'package:e_quiz/models/user/user_entity_copy.dart';
import 'package:e_quiz/screens/quizscreens/question_screen.dart';
import 'package:e_quiz/utils/colors.dart';
import 'package:e_quiz/utils/constants.dart';
import 'package:e_quiz/utils/dialog/loadingcircle/lib/ball_scale_indicator.dart';
import 'package:e_quiz/utils/dialog/loadingcircle/loading.dart';
import 'package:e_quiz/utils/dialog/toastclass.dart';
import 'package:e_quiz/utils/values.dart';
import 'package:e_quiz/utils/widgetproperties.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class StudentListScreen extends StatelessWidget {

  var scrollController = ScrollController();
  var studentController = Get.find<StudentController>();
  var subjectController = Get.find<SubjectController>();
  var quizController = Get.find<QuizController>();

  DatabaseReference databaseReference1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryBtnColor,
        title: Text("Student List"),
      ),
      body: Container(
        child: GetBuilder<StudentController>(
          init: studentController,
          initState: (child) {
            studentController.ini();
            getStudentList();
          },
          builder: (_) {
            return Container(
              height: WidgetProperties.screenHeight(Get.context),
              child: Stack(
                children: [
                  Container(
                    height: WidgetProperties.screenHeight(Get.context) * 0.7,
                    child: buildStudentList(),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.all(20.0),
                      child: HeroButton3(
                        height: 45.0,
                        radius: AppValues.commonButtonCornerRadius,
                        gradient: AppColors.primaryBtnColor,
                        title: 'Generate Quiz',
                        onPressed: () {
                          if (studentController.getBufferedStudentIds() !=
                              null) {
                            generateQuiz(Get.context);
                          } else {
                            ToastClass.showToast(
                                "Please Select Student",
                                ToastGravity.BOTTOM,
                                Colors.red,
                                Colors.white,
                                10.0,
                                Toast.LENGTH_LONG);
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  buildStudentList() {
    if (studentController.studentList == null ||
        studentController.studentList.isEmpty) {
      return Center(
        child: Container(
          height: WidgetProperties.screenHeight(Get.context),
          child: Loading(
              indicator: BallScaleIndicator(), size: 100.0, color: Colors.pink),
        ),
      );
    }
    // else if (studentController.studentList.isEmpty) {
    //   return CommonCard(
    //     child: Center(
    //       child: Textview2(
    //         title: "No Student Found",
    //         fontSize: 15.0,
    //       ),
    //     ),
    //   );
    // }
    else {
      return ListView.builder(
        itemCount: studentController.studentList.length ?? 0,
        shrinkWrap: false,
        itemBuilder: (context, index) {
          return listStudentWidget(context, index);
        },
      );
    }
  }

  Widget listStudentWidget(BuildContext buildContext, int index) {
    studentController.selectedStudentIndex = index;
    // studentController.updateSelectedIndex(index);
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Material(
          elevation: 4.0,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Textview2(
                        title:
                            studentController.studentList[index].UserName ?? "",
                        fontSize: 18.0,
                        color: AppColors.accent3Color,
                        fontWeight: FontWeight.w900,
                        fontFamily: AppValues.fontFamily,
                      ),
                      Container(
                          child: GestureDetector(
                        onTap: () {
                          subjectController.selectedStudentIndex = index;
                          subjectController.quizSubjectList[index].checked =
                              !subjectController.quizSubjectList[index].checked;
                        },
                        child: Switch(
                          value: studentController.studentList[index].checked,
                          onChanged: (value) {
                            studentController.studentList[index].checked =
                                value;
                            studentController.updateUserBuilder();
                          },
                          activeTrackColor: AppColors.subTitleColor,
                          activeColor: AppColors.primaryBtnColor,
                        ),
                      )),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Textview2(
                      title: "Status :       ",
                      fontSize: 16.0,
                      color: AppColors.accent3Color,
                      fontWeight: FontWeight.w900,
                      fontFamily: AppValues.fontFamily,
                    ),
                    Container(
                      child: Textview2(
                        title: studentController.studentList[index].Status,
                        fontSize: 15.0,
                        color: studentController.studentList[index].Status ==
                                "Online"
                            ? AppColors.formContinueButtomColor
                            : AppColors.progressbarColor,
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

  void generateQuiz(BuildContext buildContext) async {
    var quizGenerationVM = QuizGenerationVM();
    quizGenerationVM.userEntity = await UserCrud.getUserCopy();
    quizGenerationVM.SubjectIds = subjectController.getBufferedSubjectIds();
    quizGenerationVM.ChapterIds =
        subjectController.selectedChapterIds.toString();
    quizGenerationVM.Invitees = studentController.selectedStudentIds.toString();
    quizGenerationVM.ChoosenNumberofQuestions = studentController.noOfQuestions;

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
        sendNotification(quizController.responseId);
        WidgetProperties.goToNextPage(
            buildContext,  QuestionScreen());
      }
    }
  }

  getStudentList() async {
    var studentListParameterModel = StudentListParameterModel();
    studentListParameterModel.SubjectIdsString =
        subjectController.getBufferedSubjectIds().toString();
    Result res =
        await studentController.loadStudentList(studentListParameterModel);
    if (res != null) studentController.studentList = res.body;
    studentController.updateUserBuilder();
  }

  sendNotification(int responseId) async {
    var notificationVM = NotificationVM();
    UserEntityCopy userEntityCopy = await UserCrud.getUserCopy();
    notificationVM.userEntity = userEntityCopy;
    String userName = userEntityCopy.UserName;
    String fbId = userEntityCopy.FbUserId;
    notificationVM.StudentIds = studentController.getBufferedStudentIds();
    notificationVM.NotificationTypeId = 2;
    notificationVM.NotificationQuizId = responseId;
    notificationVM.NotificationDesc = userName +
        " has invited you on quiz competition. It will be held on " +
        WidgetProperties.customUtcTimeToString();
    Result result = await studentController.sendNotification(notificationVM);
    if (result != null) {
      databaseReference1 = FirebaseDatabase.instance.reference();
      String newKey =
          databaseReference1.reference().child(Constants.CHAT_TABLE).push().key;
      databaseReference1.child(Constants.CHAT_TABLE).child(newKey).set({
        "Sender": userName,
        "Message": notificationVM.NotificationDesc,
        "SenderId": fbId,
        "ReceiverId": studentController
            .studentList[studentController.selectedStudentIndex].FbUserId,
        "ReceiverName": studentController
            .studentList[studentController.selectedStudentIndex].UserName,
        "Optional": "Notification",
        "NotificationType": "Quiz",
        "QuizId": responseId,
        "Date": ServerValue.timestamp,
        "IsRead": false
      });
    }
  }
}
