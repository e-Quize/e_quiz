class Structure {
  static const USER_TABLE = "UserEntityCopy";
  static const USER_MOBILE_CONNECT = "MobileConnectResponseCopy";
  static const USER_REFRESH_TOKEN_CONNECT = "RefreshToken";
  static const USER_COMMON_RESULT_COPY = "CommonResultCopy";
  static const USER_FCM_QUIZ_ID = "FcmTokenModel";

  static const CREATE_USER_TABLE = "CREATE TABLE UserEntityCopy(Token TEXT,PrivilegesString TEXT,SlabId INTEGER,UserName TEXT,DeviceFCMToken TEXT, Password TEXT,ComRes CommonResult,SubjectIdsString TEXT,FbUserId TEXT)";
  static const CREATE_MOBILE_CONNECT_TABLE =
      "CREATE TABLE MobileConnectResponseCopy(SupportEmailAddress TEXT,ApplicationName TEXT,BankAccountInfo TEXT,FacebookURL TEXT,TwitterURL TEXT,LinkedInURL TEXT)";
  static const CREATE_REFRESH_TOKEN_CONNECT =
      "CREATE TABLE RefreshToken(RefreshOldToken TEXT)";
  static const CREATE_FCM_QUIZ_ID_CONNECT =
      "CREATE TABLE FcmTokenModel(FCMQuizId INTEGER,Notificationtype INTEGER)";
  static const CREATE_USER_COMMON_RESULT_COPY =
      "CREATE TABLE CommonResultCopy(ResponseId INTEGER)";
}
