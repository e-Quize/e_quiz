import 'package:e_quiz/db/connection.dart';
import 'package:e_quiz/db/queries/structure.dart';
import 'package:e_quiz/models/splash/mobile_connect_copy.dart';
import 'package:e_quiz/models/user/fcm_token_model.dart';
import 'package:e_quiz/models/user/refresh_token.dart';
import 'package:e_quiz/models/user/common_result_copy.dart';
import 'package:e_quiz/models/user/user_entity_copy.dart';
import 'package:e_quiz/models/user/user_model.dart';
import 'package:sqflite/sqflite.dart';



class UserCrud {

  static Future<int> insertUser(UserEntityCopy userEntityCopy) async {
    final Database db = await DBConnection.openAppDatabase();
    int id = await db.insert(
      Structure.USER_TABLE,
      userEntityCopy.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    db.close();
    return id;
  }

  static Future<int> insertCommonResultCopy(
      CommonResultCopy commonResultCopy) async {
    final Database db = await DBConnection.openAppDatabase();
    int id = await db.insert(
      Structure.USER_COMMON_RESULT_COPY,
      commonResultCopy.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    db.close();
    return id;
  }

  static Future<int> insertFcmQuizId(FcmTokenModel fcmTokenModel) async {
    final Database db = await DBConnection.openAppDatabase();
    int id = await db.insert(
      Structure.USER_FCM_QUIZ_ID,
      fcmTokenModel.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    db.close();
    return id;
  }

  static Future<FcmTokenModel> getFcmQuizId() async {
    final Database db = await DBConnection.openAppDatabase();
    final List<Map<String, dynamic>> maps =
        await db.query(Structure.USER_FCM_QUIZ_ID);
    FcmTokenModel fcmTokenModel =
        (maps.isNotEmpty) ? FcmTokenModel.fromJson(maps[0]) : FcmTokenModel();
    db.close();
    return fcmTokenModel;
  }

  static Future<CommonResultCopy> getCommonResultCopy() async {
    final Database db = await DBConnection.openAppDatabase();
    final List<Map<String, dynamic>> maps =
        await db.query(Structure.USER_COMMON_RESULT_COPY);
    CommonResultCopy commonResultCopy = (maps.isNotEmpty)
        ? CommonResultCopy.fromJson(maps[0])
        : CommonResultCopy();
    db.close();
    return commonResultCopy;
  }

  static Future<int> updateUser(UserEntity userEntity) async {
    final Database database = await DBConnection.openAppDatabase();
    int id = await database.update('UserEntity', userEntity.toJson(),
        where: "Id = ?", whereArgs: [userEntity.Id]);
    database.close();
    return id;
  }

  static Future<UserEntityCopy> getUserCopy() async {
    final Database db = await DBConnection.openAppDatabase();
    final List<Map<String, dynamic>> maps =
        await db.query(Structure.USER_TABLE);
    UserEntityCopy userEntityCopy =
        (maps.isNotEmpty) ? UserEntityCopy.fromJson(maps[0]) : UserEntityCopy();
    db.close();
    return userEntityCopy;
  }

  static Future<int> insertRefreshToken(RefreshToken refreshToken) async {
    final Database db = await DBConnection.openAppDatabase();
    int id = await db.insert(
      Structure.USER_REFRESH_TOKEN_CONNECT,
      refreshToken.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    db.close();
    return id;
  }

  static Future<RefreshToken> getUserRefreshToken() async {
    final Database db = await DBConnection.openAppDatabase();
    final List<Map<String, dynamic>> maps =
        await db.query(Structure.USER_REFRESH_TOKEN_CONNECT);
    RefreshToken refreshToken =
        (maps.isNotEmpty) ? RefreshToken.fromJson(maps[0]) : RefreshToken();
    db.close();
    return refreshToken;
  }

  static Future<MobileConnectResponseCopy> getBankInfoData() async {
    final Database db = await DBConnection.openAppDatabase();
    final List<Map<String, dynamic>> maps =
        await db.query(Structure.USER_MOBILE_CONNECT);
    MobileConnectResponseCopy mobileConnectResponseCopy = (maps.isNotEmpty)
        ? MobileConnectResponseCopy.fromJson(maps[0])
        : MobileConnectResponseCopy();
    db.close();
    return mobileConnectResponseCopy;
  }

  static Future<bool> logoutUser() async {
    final db = await DBConnection.openAppDatabase();
    int result = await db.delete(
      Structure.USER_TABLE,
    );
    db.close();
    return result > 0 ? true : false;
  }

  static Future<int> insertSettings(
      MobileConnectResponseCopy mobileConnectResponseCopy) async {
    final Database db = await DBConnection.openAppDatabase();
    int id = await db.insert(
      Structure.USER_MOBILE_CONNECT,
      mobileConnectResponseCopy.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    db.close();
    return id;
  }
}
