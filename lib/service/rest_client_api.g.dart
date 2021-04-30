// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClientApi implements RestClientApi {
  _RestClientApi(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://erp1.cyberisol.com/api/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<UserEntity> RegisterUser(userEntity) async {
    ArgumentError.checkNotNull(userEntity, 'userEntity');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(userEntity?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        'user/RegisterUser',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UserEntity.fromJson(_result.data);
    return value;
  }

  @override
  Future<UserEntity> ValidateUserCredentials(userEntity) async {
    ArgumentError.checkNotNull(userEntity, 'userEntity');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(userEntity?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        'user/ValidateUserCredentials',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UserEntity.fromJson(_result.data);
    return value;
  }

  @override
  Future<List<CountryVm>> getCountriesList(userEntity) async {
    ArgumentError.checkNotNull(userEntity, 'userEntity');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(userEntity?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<List<dynamic>>('user/getCountrieslist',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => CountryVm.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<UserEntity> GetUserProfile(userEntityCopy) async {
    ArgumentError.checkNotNull(userEntityCopy, 'userEntityCopy');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(userEntityCopy?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        'user/GetUserProfile',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UserEntity.fromJson(_result.data);
    return value;
  }

  @override
  Future<DashboardVMResponse> StudentDashboard(dashboardVMParams) async {
    ArgumentError.checkNotNull(dashboardVMParams, 'dashboardVMParams');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(dashboardVMParams?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        'Dashboard/StudentDashboard',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = DashboardVMResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<List<CompetitionResult>> getQuizDetail(attemptedQuizModel) async {
    ArgumentError.checkNotNull(attemptedQuizModel, 'attemptedQuizModel');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(attemptedQuizModel?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<List<dynamic>>('Dashboard/GetQuizDetail',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) =>
            CompetitionResult.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<TimeZone>> GetCountryTimeZones(countryVm) async {
    ArgumentError.checkNotNull(countryVm, 'countryVm');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(countryVm?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<List<dynamic>>(
        'user/GetCountryTimeZones',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => TimeZone.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<SubjectModel>> LoadSubjects(userEntityCopy) async {
    ArgumentError.checkNotNull(userEntityCopy, 'userEntityCopy');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(userEntityCopy?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<List<dynamic>>(
        'Subscription/LoadSubjects',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => SubjectModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<SlabVm>> LoadSlabs(userEntityCopy) async {
    ArgumentError.checkNotNull(userEntityCopy, 'userEntityCopy');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(userEntityCopy?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<List<dynamic>>('Subscription/LoadSlabs',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => SlabVm.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<SubjectModel>> LoadActiveSubjectsForQuiz(userEntityCopy) async {
    ArgumentError.checkNotNull(userEntityCopy, 'userEntityCopy');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(userEntityCopy?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<List<dynamic>>(
        'Quiz/LoadActiveSubjectsForQuiz',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => SubjectModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<SaveSubscriptionResponse> SaveSubscription(
      saveSubscriptionModel) async {
    ArgumentError.checkNotNull(saveSubscriptionModel, 'saveSubscriptionModel');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(saveSubscriptionModel?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        'Subscription/SaveSubscription',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = SaveSubscriptionResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<MobileConnectResponse> GetSiteSettings(generalSettingsVM) async {
    ArgumentError.checkNotNull(generalSettingsVM, 'generalSettingsVM');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(generalSettingsVM?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        'SiteSettings/GetSiteSettings',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = MobileConnectResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<List<ChapterVmModel>> LoadActiveChaptersBySubjectIdForQuiz(
      subjectModelParams) async {
    ArgumentError.checkNotNull(subjectModelParams, 'subjectModelParams');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(subjectModelParams?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<List<dynamic>>(
        'Quiz/LoadActiveChaptersBySubjectIdForQuiz',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => ChapterVmModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<UserEntity> LogOutLog(userEntityCopy) async {
    ArgumentError.checkNotNull(userEntityCopy, 'userEntityCopy');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(userEntityCopy?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('user/LogOutLog',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UserEntity.fromJson(_result.data);
    return value;
  }

  @override
  Future<CommonResult> LogOutFromAllDevices(userEntityCopy) async {
    ArgumentError.checkNotNull(userEntityCopy, 'userEntityCopy');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(userEntityCopy?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        'User/LogOutFromAllDevices',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = CommonResult.fromJson(_result.data);
    return value;
  }

  @override
  Future<QuizGenerationVM> GenerateQuiz(quizGenerationVM) async {
    ArgumentError.checkNotNull(quizGenerationVM, 'quizGenerationVM');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(quizGenerationVM?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        'Quiz/GenerateQuiz',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = QuizGenerationVM.fromJson(_result.data);
    return value;
  }

  @override
  Future<List<QuizQuestion>> GetQuetionsForAttempQuiz(attemptQuizVM) async {
    ArgumentError.checkNotNull(attemptQuizVM, 'attemptQuizVM');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(attemptQuizVM?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<List<dynamic>>(
        'Quiz/GetQuetionsForAttempQuiz',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => QuizQuestion.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<AttemptQuizVm> UpdateQuizAnswer(attemptQuizVM) async {
    ArgumentError.checkNotNull(attemptQuizVM, 'attemptQuizVM');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(attemptQuizVM?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        'Quiz/UpdateQuizAnswer',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = AttemptQuizVm.fromJson(_result.data);
    return value;
  }

  @override
  Future<UserEntityCopy> UpdateDashboardData(userEntityCopy) async {
    ArgumentError.checkNotNull(userEntityCopy, 'userEntityCopy');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(userEntityCopy?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        'Quiz/UpdateDashboardData',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UserEntityCopy.fromJson(_result.data);
    return value;
  }

  @override
  Future<CommonResult> UpdateUserProfile(userEntity) async {
    ArgumentError.checkNotNull(userEntity, 'userEntity');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(userEntity?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        'User/UpdateProfileMobile',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = CommonResult.fromJson(_result.data);
    return value;
  }

  @override
  Future<List<Student>> LoadStudentsForQuiz(studentListParameterModel) async {
    ArgumentError.checkNotNull(
        studentListParameterModel, 'studentListParameterModel');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(studentListParameterModel?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<List<dynamic>>(
        'Dashboard/LoadStudentsForQuiz',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Student.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<UserEntity> RefreshToken(userEntityCopy) async {
    ArgumentError.checkNotNull(userEntityCopy, 'userEntityCopy');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(userEntityCopy?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        'User/RefreshToken',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UserEntity.fromJson(_result.data);
    return value;
  }

  @override
  Future<UserEntity> ForgotPassword(userEntity) async {
    ArgumentError.checkNotNull(userEntity, 'userEntity');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(userEntity?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        'User/ForgotPassword',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UserEntity.fromJson(_result.data);
    return value;
  }

  @override
  Future<UserEntity> SubjectsSubscription(userEntity) async {
    ArgumentError.checkNotNull(userEntity, 'userEntity');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(userEntity?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        'User/SubjectsSubscription',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UserEntity.fromJson(_result.data);
    return value;
  }

  @override
  Future<List<SubscriptionDetailModel>> GetSubjectSubscriptionDetail(
      userEntity) async {
    ArgumentError.checkNotNull(userEntity, 'userEntity');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(userEntity?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<List<dynamic>>(
        'Subscription/GetSubjectSubscriptionDetail',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) =>
            SubscriptionDetailModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<CommonResult> Subscriptions(saveSubscriptionModel) async {
    ArgumentError.checkNotNull(saveSubscriptionModel, 'saveSubscriptionModel');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(saveSubscriptionModel?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        'User/Subscriptions',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = CommonResult.fromJson(_result.data);
    return value;
  }

  @override
  Future<List<PaymentModel>> LoadAllUser(userEntityCopy) async {
    ArgumentError.checkNotNull(userEntityCopy, 'userEntityCopy');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(userEntityCopy?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<List<dynamic>>('User/LoadAllUser',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => PaymentModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<ChangeSubscriptionModel> GetUserSubscriptions(userEntityCopy) async {
    ArgumentError.checkNotNull(userEntityCopy, 'userEntityCopy');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(userEntityCopy?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        'Dashboard/GetUserSubscriptions',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ChangeSubscriptionModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<CommonResult> ApproveRevertUserSubscription(
      updateDeleteSubscription) async {
    ArgumentError.checkNotNull(
        updateDeleteSubscription, 'updateDeleteSubscription');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(updateDeleteSubscription?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        'User/ApproveRevertUserSubscription',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = CommonResult.fromJson(_result.data);
    return value;
  }

  @override
  Future<List<NotificationModel>> NotificationInit(userEntityCopy) async {
    ArgumentError.checkNotNull(userEntityCopy, 'userEntityCopy');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(userEntityCopy?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<List<dynamic>>('Quiz/NotificationInit',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) =>
            NotificationModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<CommonResult> NotificationIsRead(userEntity) async {
    ArgumentError.checkNotNull(userEntity, 'userEntity');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(userEntity?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        'Quiz/NotificationIsRead',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = CommonResult.fromJson(_result.data);
    return value;
  }

  @override
  Future<CommonResult> SaveSubscriptions(saveSubscriptionModel) async {
    ArgumentError.checkNotNull(saveSubscriptionModel, 'saveSubscriptionModel');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(saveSubscriptionModel?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        'User/SaveSubscriptions',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = CommonResult.fromJson(_result.data);
    return value;
  }

  @override
  Future<CommonResult> SendNotification(notificationVM) async {
    ArgumentError.checkNotNull(notificationVM, 'notificationVM');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(notificationVM?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        'Dashboard/SendNotification',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = CommonResult.fromJson(_result.data);
    return value;
  }

  @override
  Future<List<CompetitionResult>> GetQuizDetail(
      competitionQuizResultModel) async {
    ArgumentError.checkNotNull(
        competitionQuizResultModel, 'competitionQuizResultModel');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(competitionQuizResultModel?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<List<dynamic>>('Dashboard/GetQuizDetail',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) =>
            CompetitionResult.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<PieChartModel>> GetChaptersPercentageForPie(userEntity) async {
    ArgumentError.checkNotNull(userEntity, 'userEntity');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(userEntity?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<List<dynamic>>(
        'Quiz/GetChaptersPercentageForPie',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => PieChartModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<BarGraphModel>> GetQuizPercentagesForGraph(userEntity) async {
    ArgumentError.checkNotNull(userEntity, 'userEntity');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(userEntity?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<List<dynamic>>(
        'Quiz/GetQuizPercentagesForGraph',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => BarGraphModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<UserEntity>> GetAdminsForChat(userEntity) async {
    ArgumentError.checkNotNull(userEntity, 'userEntity');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(userEntity?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<List<dynamic>>('User/GetAdminsForChat',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => UserEntity.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<AttemptedQuizModel>> GetAllAttemptedQuizes(userEntity) async {
    ArgumentError.checkNotNull(userEntity, 'userEntity');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(userEntity?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<List<dynamic>>(
        'Quiz/GetAllAttemptedQuizes',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) =>
            AttemptedQuizModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }
}
