import 'package:e_quiz/controllers/api_controller.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/models/quiz/chapter_vm_model.dart';
import 'package:e_quiz/models/attemptquiz/student_list_parameter_model.dart';
import 'package:e_quiz/models/quiz/subject_model.dart';
import 'package:e_quiz/models/quiz/subject_model_params.dart';
import 'package:e_quiz/models/attemptquiz/student.dart';
import 'package:get/get.dart';

class SubjectController extends GetxController {
  List<ChapterVmModel> quizChapterList;
  List<SubjectModel> quizSubjectList;


  var result;
  var resultUser;
  var apiController;
  int selectedSubjectId;

  var selectedChapterIds;

  var selectedSubjectIds;
  var selectedStudentIds;

  bool isCheckedCorrectAnswer;
  bool isCheckedDiffcultQuestion;
  bool isCheckedWrongQuestion;

  bool isCheckedSkippedQuestion;

  bool isQuizType;
  int isQuizTypeId;
  int selectedIndex;

  int selectedStudentIndex;

  List<Student> studentList;

  ini() {
    quizChapterList = List<ChapterVmModel>();
    quizSubjectList = List<SubjectModel>();
    result = Result().obs;
    resultUser = new Result().obs;
    apiController = ApiController();
    selectedChapterIds = StringBuffer();
    selectedSubjectIds = StringBuffer();
    selectedStudentIds = StringBuffer();

    isCheckedCorrectAnswer = false;
    isCheckedDiffcultQuestion = false;
    isCheckedWrongQuestion = false;
    isCheckedSkippedQuestion = false;

    isQuizType = null;
    isQuizTypeId = 0;
    selectedIndex = 0;
    selectedStudentIndex = 0;

    studentList = List<Student>();
  }

  updateResult(Result result) {
    this.result.value = result;
  }

  updateBuilder() {
    update();
  }

  bool updateSelectedChapterIds(selectedChapterIds) {
    if (this.selectedChapterIds != null) {
      this.selectedChapterIds = selectedChapterIds;
      updateBuilder();
      return true;
    }
    return false;
  }

  Future<Result> loadActiveChaptersBySubjectIdForQuiz(
      SubjectModelParams subjectModelParams) async {
    Result listChapters = await apiController
        .loadActiveChapterListBySubjectIdForQuizFromApi(subjectModelParams);
    //updateUser(listChapters);
    return listChapters;
  }

  Future<Result> loadActiveSubjectsForQuiz() async {
    Result listQuizSubjests =
        await apiController.loadActiveSubjectListForQuizFromApi();
    updateUser(listQuizSubjests);
    return listQuizSubjests;
  }

  updateUserBuilder() {
    update();
  }

  updateUser(Result result) {
    this.resultUser.value = result;
  }

  updateIsQuizType(bool isQuizType) {
    this.isQuizType = isQuizType;
    update();
  }

  Future<Result> loadUserList() async {
    Result userListResult = await apiController.getAllUserFromApi();
    updateUser(userListResult);
    return userListResult;
  }

  String getBufferedSubjectIds() {
    selectedSubjectIds.clear();
    var list = quizSubjectList.where((element) => element.checked).toList();
    list.forEach((element) {
      if (list.indexOf(element) == 0) {
        if (selectedSubjectIds.isNotEmpty) {
          selectedSubjectIds.write("," + element.Id.toString());
        } else {
          selectedSubjectIds.write(element.Id.toString());
        }
      } else {
        selectedSubjectIds.write("," + element.Id.toString());
      }

      if (!element.chapterList
          .where((element) => element.checked)
          .isNullOrBlank) {
        element.chapterList.where((element) => element.checked).forEach((item) {
          if (element.chapterList
                  .where((element) => element.checked)
                  .toList()
                  .indexOf(item) ==
              0) {
            if (selectedChapterIds.isNotEmpty) {
              selectedChapterIds.write("," + item.Id.toString());
            } else {
              selectedChapterIds.write(item.Id.toString());
            }
          } else {
            selectedChapterIds.write("," + item.Id.toString());
          }
        });
      }
    });

    return selectedSubjectIds.toString();
  }

  // String getBufferedSubjectIdsForStudentList() {
  //   selectedSubjectIds.clear();
  //   var list = quizSubjectList.where((element) => element.checked).toList();
  //   list.forEach((element) {
  //     if (list.indexOf(element) == 0) {
  //       if (selectedSubjectIds.isNotEmpty) {
  //         selectedSubjectIds.write("," + element.Id.toString());
  //       } else {
  //         selectedSubjectIds.write(element.Id.toString());
  //       }
  //     } else {
  //       selectedSubjectIds.write("," + element.Id.toString());
  //     }
  //   });
  //
  //   return selectedSubjectIds.toString();
  // }

  String getBufferedStudentIds() {
    selectedStudentIds.clear();
    var list = studentList.where((element) => element.checked).toList();
    list.forEach((element) {
      if (list.indexOf(element) == 0) {
        if (selectedStudentIds.isNotEmpty) {
          selectedStudentIds.write("," + element.UserId.toString());
        } else {
          selectedStudentIds.write(element.UserId.toString());
        }
      } else {
        selectedStudentIds.write("," + element.UserId.toString());
      }
    });
    return selectedStudentIds.toString();
  }


  updateIsCheckedSkippedQuestion(bool isCheckedSkippedQuestion) {
    this.isCheckedSkippedQuestion = isCheckedSkippedQuestion;
    // updateUserBuilder();
  }

  updateIsCheckedCorrectAnswer(bool isCheckedCorrectAnswer) {
    this.isCheckedCorrectAnswer = isCheckedCorrectAnswer;
    // updateUserBuilder();
  }

  updateIsCheckedWrongAnswer(bool isCheckedWrongQuestion) {
    this.isCheckedWrongQuestion = isCheckedWrongQuestion;
    // updateUserBuilder();
  }

  updateIsCheckedDiffcultQuestion(bool isCheckedDiffcultQuestion) {
    this.isCheckedDiffcultQuestion = isCheckedDiffcultQuestion;
    // updateUserBuilder();
  }
}
