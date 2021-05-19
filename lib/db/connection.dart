import 'package:e_quiz/db/queries/structure.dart';
import 'package:e_quiz/utils/constants.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBConnection {
  static Future<Database> openAppDatabase() async {
    final Future<Database> database = openDatabase(
      join(await getDatabasesPath(), Constants.DATABASE_NAME),
      onCreate: (db, version) {
        db.execute(Structure.CREATE_USER_TABLE);
        db.execute(Structure.CREATE_MOBILE_CONNECT_TABLE);
        db.execute(Structure.CREATE_OFFLINE_QUIZ_TABLE);
        db.execute(Structure.CREATE_REFRESH_TOKEN_CONNECT);
        db.execute(Structure.CREATE_USER_COMMON_RESULT_COPY);
        db.execute(Structure.CREATE_FCM_QUIZ_ID_CONNECT);
        // db.execute(Structure.CREATE_WISHLIST_TABLE);
      },
      version: Constants.DATABASE_VERSION,
    );
    return database;
  }
}
