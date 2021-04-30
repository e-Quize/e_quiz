import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:e_quiz/models/attemptquiz/attempt_quiz_vm.dart';
import 'package:e_quiz/models/attemptquiz/quiz_question.dart';
import 'package:e_quiz/models/attemptquiz/student.dart';
import 'package:e_quiz/models/dashboard/competition_quiz_result_model.dart';
import 'package:e_quiz/models/quizdetail/competition_result.dart';
import 'package:e_quiz/models/attemptquiz/attempted_quiz_model.dart';
import 'package:e_quiz/models/attemptquiz/student_list_parameter_model.dart';
import 'package:e_quiz/models/bargraph/bar_graph_model.dart';
import 'package:e_quiz/models/changesubscription/change_subscription_model.dart';
import 'package:e_quiz/models/common/general_settings_vm.dart';
import 'package:e_quiz/models/dashboard/dashboard_vm_params.dart';
import 'package:e_quiz/models/dashboard/dashboard_vm_response.dart';
import 'package:e_quiz/models/notification/notification_model.dart';
import 'package:e_quiz/models/notification/notification_send_vm.dart';
import 'package:e_quiz/models/payment/payment_history_model.dart';
import 'package:e_quiz/models/piechart/pie_chart_model.dart';
import 'package:e_quiz/models/quiz/chapter_vm_model.dart';
import 'package:e_quiz/models/quiz/quiz_generation_vm.dart';
import 'package:e_quiz/models/quiz/save_subscription_model.dart';
import 'package:e_quiz/models/quiz/save_subscription_response.dart';
import 'package:e_quiz/models/quiz/slab_vm.dart';
import 'package:e_quiz/models/quiz/subject_model.dart';
import 'package:e_quiz/models/quiz/subject_model_params.dart';
import 'package:e_quiz/models/quizdetail/quiz_detail.dart';
import 'package:e_quiz/models/splash/mobile_connect.dart';
import 'package:e_quiz/models/subscription/subscription_detail_model.dart';
import 'package:e_quiz/models/subscription/update_delete_subscription.dart';
import 'package:e_quiz/models/user/common_result.dart';
import 'package:e_quiz/models/user/countries_vm_model.dart';
import 'package:e_quiz/models/user/timezone.dart';
import 'package:e_quiz/models/user/user_entity_copy.dart';
import 'package:e_quiz/models/user/user_model.dart';
import 'package:e_quiz/utils/constants.dart';
import 'package:retrofit/retrofit.dart';



part 'rest_client_api.g.dart';

@RestApi(baseUrl: Constants.BASE_URL)
abstract class RestClientApi {
  factory RestClientApi(Dio dio) = _RestClientApi;

  //Register Api
  @POST("user/RegisterUser")
  Future<UserEntity> RegisterUser(@Body() UserEntity userEntity);

  //Login Api
  @POST("user/ValidateUserCredentials")
  Future<UserEntity> ValidateUserCredentials(@Body() UserEntity userEntity);

  //Country List Api
  @POST("user/getCountrieslist")
  Future<List<CountryVm>> getCountriesList(@Body() UserEntity userEntity);

  //User Profile Api
  @POST("user/GetUserProfile")
  Future<UserEntity> GetUserProfile(@Body() UserEntityCopy userEntityCopy);

  //Student Dashboard Api
  @POST("Dashboard/StudentDashboard")
  Future<DashboardVMResponse> StudentDashboard(
      @Body() DashboardVMParams dashboardVMParams);

  //Student Dashboard Api
  @POST("Dashboard/GetQuizDetail")
  Future<List<CompetitionResult>> getQuizDetail(
      @Body() AttemptedQuizModel attemptedQuizModel);

  //Country Timezones Api
  @POST("user/GetCountryTimeZones")
  Future<List<TimeZone>> GetCountryTimeZones(@Body() CountryVm countryVm);

  //Load Subjects Api
  @POST("Subscription/LoadSubjects")
  Future<List<SubjectModel>> LoadSubjects(
      @Body() UserEntityCopy userEntityCopy);

  //Load Slabs Api
  @POST("Subscription/LoadSlabs")
  Future<List<SlabVm>> LoadSlabs(@Body() UserEntityCopy userEntityCopy);

  //Load Subjects For Quiz Api
  @POST("Quiz/LoadActiveSubjectsForQuiz")
  Future<List<SubjectModel>> LoadActiveSubjectsForQuiz(
      @Body() UserEntityCopy userEntityCopy);

  //Save Subscription Api
  @POST("Subscription/SaveSubscription")
  Future<SaveSubscriptionResponse> SaveSubscription(
      @Body() SaveSubscriptionModel saveSubscriptionModel);

  //Settings Api
  @POST("SiteSettings/GetSiteSettings")
  Future<MobileConnectResponse> GetSiteSettings(
      @Body() GeneralSettingsVM generalSettingsVM);

  //LoadActiveChaptersBySubjectIdForQuiz
  @POST("Quiz/LoadActiveChaptersBySubjectIdForQuiz")
  Future<List<ChapterVmModel>> LoadActiveChaptersBySubjectIdForQuiz(
      @Body() SubjectModelParams subjectModelParams);

  //Logout From Device Api
  @POST("user/LogOutLog")
  Future<UserEntity> LogOutLog(@Body() UserEntityCopy userEntityCopy);

  //Logout From Device Api
  @POST("User/LogOutFromAllDevices")
  Future<CommonResult> LogOutFromAllDevices(
      @Body() UserEntityCopy userEntityCopy);

  //GenerateQuiz Api
  @POST("Quiz/GenerateQuiz")
  Future<QuizGenerationVM> GenerateQuiz(
      @Body() QuizGenerationVM quizGenerationVM);

  //Get List of Questions From Api
  @POST("Quiz/GetQuetionsForAttempQuiz")
  Future<List<QuizQuestion>> GetQuetionsForAttempQuiz(
      @Body() AttemptQuizVm attemptQuizVM);

  //Post Question From APi
  @POST("Quiz/UpdateQuizAnswer")
  Future<AttemptQuizVm> UpdateQuizAnswer(@Body() AttemptQuizVm attemptQuizVM);

  //Update Dashboard Data From APi
  @POST("Quiz/UpdateDashboardData")
  Future<UserEntityCopy> UpdateDashboardData(
      @Body() UserEntityCopy userEntityCopy);

  //Update User Profile
  @POST("User/UpdateProfileMobile")
  Future<CommonResult> UpdateUserProfile(@Body() UserEntity userEntity);

  // Get student List
  @POST("Dashboard/LoadStudentsForQuiz")
  Future<List<Student>> LoadStudentsForQuiz(
      @Body() StudentListParameterModel studentListParameterModel);

  //Refresh Token APi
  @POST("User/RefreshToken")
  Future<UserEntity> RefreshToken(@Body() UserEntityCopy userEntityCopy);

  //Forgot Password Api
  @POST("User/ForgotPassword")
  Future<UserEntity> ForgotPassword(@Body() UserEntity userEntity);

  //Forgot Password Api
  @POST("User/SubjectsSubscription")
  Future<UserEntity> SubjectsSubscription(@Body() UserEntity userEntity);

  //Forgot Password Api
  @POST("Subscription/GetSubjectSubscriptionDetail")
  Future<List<SubscriptionDetailModel>> GetSubjectSubscriptionDetail(
      @Body() UserEntity userEntity);

  //New APIs

  //User Subscription Api
  @POST("User/Subscriptions")
  Future<CommonResult> Subscriptions(
      @Body() SaveSubscriptionModel saveSubscriptionModel);

  //Load All User Api
  @POST("User/LoadAllUser")
  Future<List<PaymentModel>> LoadAllUser(@Body() UserEntityCopy userEntityCopy);

  @POST("Dashboard/GetUserSubscriptions")
  Future<ChangeSubscriptionModel> GetUserSubscriptions(
      @Body() UserEntityCopy userEntityCopy);

  //Approve Revert User Subscription  Api
  @POST("User/ApproveRevertUserSubscription")
  Future<CommonResult> ApproveRevertUserSubscription(
      @Body() UpdateDeleteSubscription updateDeleteSubscription);

  //Get Notification List   Api
  @POST("Quiz/NotificationInit")
  Future<List<NotificationModel>> NotificationInit(
      @Body() UserEntityCopy userEntityCopy);

  //Get NotificationIsRead   Api
  @POST("Quiz/NotificationIsRead")
  Future<CommonResult> NotificationIsRead(@Body() UserEntity userEntity);

  //Save Subscription Api
  @POST("User/SaveSubscriptions")
  Future<CommonResult> SaveSubscriptions(
      @Body() SaveSubscriptionModel saveSubscriptionModel);

  //Send Notification Api
  @POST("Dashboard/SendNotification")
  Future<CommonResult> SendNotification(@Body() NotificationVM notificationVM);

  //Get Quiz Detail Api
  @POST("Dashboard/GetQuizDetail")
  Future<List<CompetitionResult>> GetQuizDetail(
      @Body() CompetitionQuizResultModel competitionQuizResultModel);

  //Get PieChart Data
  @POST("Quiz/GetChaptersPercentageForPie")
  Future<List<PieChartModel>> GetChaptersPercentageForPie(
      @Body() UserEntity userEntity);

  //Get BarGraph Data
  @POST("Quiz/GetQuizPercentagesForGraph")
  Future<List<BarGraphModel>> GetQuizPercentagesForGraph(
      @Body() UserEntity userEntity);

  //Get User Data for Chat
  @POST("User/GetAdminsForChat")
  Future<List<UserEntity>> GetAdminsForChat(@Body() UserEntity userEntity);

  //Get User Data for Chat Dashboard/GetQuizDetail'
  @POST("Quiz/GetAllAttemptedQuizes")
  Future<List<AttemptedQuizModel>> GetAllAttemptedQuizes(
      @Body() UserEntity userEntity);
}
