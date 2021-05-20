import 'package:e_quiz/common/exception_manager/generic_result.dart';
import 'package:e_quiz/controllers/api_controller.dart';
import 'package:e_quiz/db/user_crud.dart';
import 'package:e_quiz/models/attemptquiz/attempt_quiz_vm.dart';
import 'package:e_quiz/models/attemptquiz/quiz_question.dart';
import 'package:e_quiz/models/dashboard/competition_quiz_result_model.dart';
import 'package:e_quiz/models/attemptquiz/quiz_question_answer.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/models/common/validity_model.dart';
import 'package:e_quiz/models/offlinequiz/offline_quiz_model.dart';
import 'package:e_quiz/models/quiz/quiz_generation_vm.dart';
import 'package:e_quiz/models/quiz/save_subscription_model.dart';
import 'package:e_quiz/models/quiz/slab_vm.dart';
import 'package:e_quiz/models/quiz/subject_model.dart';
import 'package:e_quiz/models/subscription/subscription_detail_model.dart';
import 'package:e_quiz/models/subscription/user_subscription.dart';
import 'package:e_quiz/models/user/user_model.dart';
import 'package:e_quiz/models/user/user_validation.dart';
import 'package:get/get.dart';

class QuizController extends GetxController {
  List<SubjectModel> subjectList;
  List<SlabVm> subscribeList;
  List<SubjectModel> subjectTempList;

  var result;
  int fcmQuizId;
  int notificationType;

  int responseId;
  var resultUser;
  ApiController apiController;

  List<SubjectModel> quizSubjectList;
  List<QuizQuestion> quizQuestionList;
  List<QuizQuestion> localDbQuestionList;
  List<QuizQuestion> skippedQuestionObjectList;

  var isChecked = false;

  // String Buffer
  var selectedSubjectIds;
  var listUserSubscription;

  int selectedSubjectId;

  var selectedSubscriptionModel;
  var subscriptionDetailList;

  var userSubscriptionModel;

  int questionIndex;
  int currentQuestionIndex;

  //Question Answer List
  List<QuizQuestionAnswer> questionAnswerList;

  int mcqOption;
  bool flaggedAsDifficult;
  bool hasSeenExplanation;
  bool isSkippedSelected;

  List<SubjectModel> userSubscriptionSubjectList;

  int answerId;
  OfflineQuiz offlineQuiz ;

  ValidityModel validityQuestion;

  ini() {
    subjectList = List<SubjectModel>();
    skippedQuestionObjectList = List<QuizQuestion>();
    subscribeList = List<SlabVm>();
    subjectTempList = List<SubjectModel>();
    result = Result().obs;
    resultUser = new Result().obs;
    apiController = ApiController();
    quizSubjectList = List<SubjectModel>();
    quizQuestionList = List<QuizQuestion>();

    isChecked = false;

    // String Buffer
    selectedSubjectIds = StringBuffer();
    // ignore: deprecated_member_use
    listUserSubscription = List<UserSubscriptionModel>();

    selectedSubjectId;

    selectedSubscriptionModel;
    subscriptionDetailList = List<SubscriptionDetailModel>();
    userSubscriptionModel = UserSubscriptionModel();

    questionIndex = 0;
    currentQuestionIndex = 0;
    //Question Answer List
    questionAnswerList = List<QuizQuestionAnswer>();

    mcqOption = 0;
    flaggedAsDifficult = false;
    hasSeenExplanation = false;
    isSkippedSelected = false;

    userSubscriptionSubjectList = List<SubjectModel>();

    validityQuestion = ValidityModel();
    offlineQuiz = OfflineQuiz();
  }

  updateResult(Result result) {
    this.result.value = result;
  }

  setTempList(int start, int end) {
    try {
      subjectTempList = subjectList.getRange(start, end).toList(growable: true);
    } catch (o) {
      if (o is RangeError) {
        subjectTempList = subjectList.sublist(start).toList(growable: true);
      }
    }
    updateBuilder();
  }

  updateBuilder() {
    update();
  }

  Future<Result> getQuizDetailList(
      CompetitionQuizResultModel competitionQuizResultModel) async {
    updateUser(Generic.waitResult());
    Result quizDetailListResult = await apiController
        .getQuizDetailForPieFromApi(competitionQuizResultModel);
    updateUser(quizDetailListResult);
    return quizDetailListResult;
  }

  Future<Result> loadSubjectList() async {
    updateUser(Generic.waitResult());
    Result sbjectListResult = await apiController.loadSubjectListFromApi();
    updateUser(sbjectListResult);
    return sbjectListResult;
  }

  Future<Result> loadSlabList() async {
    updateUser(Generic.waitResult());
    Result slabListResult = await apiController.loadSlabListFromApi();
    updateUser(slabListResult);
    return slabListResult;
  }

  Future<Result> saveSubscription(
      SaveSubscriptionModel saveSubscriptionModel) async {
    updateUser(Generic.waitResult());
    Result slabListResult =
        await apiController.saveSubscriptionsFromApi(saveSubscriptionModel);
    updateUser(slabListResult);
    return slabListResult;
  }

  Future<Result> subjectSubscription(UserEntity userEntity) async {
    updateUser(Generic.waitResult());
    Result slabListResult =
        await apiController.subjectSubscriptionFromApi(userEntity);
    updateUser(slabListResult);
    return slabListResult;
  }

  Future<Result> generateQuiz(QuizGenerationVM quizGenerationVM) async {
    //updateUser(Generic.waitResult());
    Result generateQuizResult =
        await apiController.generateQuizFromApi(quizGenerationVM);
    // updateUser(generateQuizResult);
    return generateQuizResult;
  }

  Future<Result> getQuetionsForAttempQuiz(AttemptQuizVm attemptQuizVM) async {
    Result getQuestionForAttempt =
        await apiController.getQuetionListForAttempQuizFromApi(attemptQuizVM);
    updateUser(getQuestionForAttempt);
    return getQuestionForAttempt;
  }

  void addOfflineQuiz(OfflineQuiz offlineQuiz)async {
    await UserCrud.insertOfflineQuiz(offlineQuiz).then((value) => print('Successfully added')).catchError((error){
      print("Error in inserting ${error.message}");
    });
  }

  Future<Result> updateDashboardData() async {
    updateUser(Generic.waitResult());
    Result quizResponeResult = await apiController.updateDashboardDataFromApi();
    updateUser(quizResponeResult);
    return quizResponeResult;
  }

  Future<Result> updateQuizAnswer(AttemptQuizVm attemptQuizVM) async {
    updateUser(Generic.waitResult());
    Result updateQuizAnswerResult =
        await apiController.updateQuizAnswerFromApi(attemptQuizVM);
    updateUser(updateQuizAnswerResult);
    return updateQuizAnswerResult;
  }

  updateUserBuilder() {
    update();
  }

  updateUser(Result result) {
    this.resultUser.value = result;
  }

  checkValidQuestion(String value) {
    validityQuestion = UserValidation.validateNoOfQuestion(value);
    // updateUserBuilder();
  }

  updateMcqOption(int answerId) {
    this.answerId = answerId;
    updateUserBuilder();
  }

  void nextQuestion() {
    if (questionIndex <= quizQuestionList.length - 1) {
      questionIndex++;
    }
  }

  void nextQuestionSkipped(int index) {
    // if (questionIndex <= lastIndex) {
    //   questionIndex++;
    // }
    currentQuestionIndex = questionIndex;
    questionIndex = index;
  }

  Future<Result> loadActiveSubjectsForQuiz() async {
    Result quizSubjectListResult =
        await apiController.loadActiveSubjectListForQuizFromApi();
    updateUser(quizSubjectListResult);
    return quizSubjectListResult;
  }

  Future<Result> getSubjectSubscriptionDetail(UserEntity userEntity) async {
    Result listSubjectSubscriptionDetail =
        await apiController.getSubjectSubscriptionDetailFromApi(userEntity);
    updateUser(listSubjectSubscriptionDetail);
    return listSubjectSubscriptionDetail;
  }

  String getBufferedSubjectIds() {
    selectedSubjectIds.clear();
    var list;
    if (userSubscriptionSubjectList != null)
      list = userSubscriptionSubjectList
          .where((element) => element.checked)
          .toList();
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
    });

    return selectedSubjectIds.toString();
  }

  bool changeColor(int answerId, int index) {
    QuizQuestionAnswer ddfd = quizQuestionList[index]
        .QuestionAnswerList
        .where((element) => element.Id == answerId)
        .first;
    if (ddfd.isCorrect) {
      isChecked = true;
    } else {
      isChecked = false;
    }

    updateUserBuilder();
    return isChecked;
  }
}
