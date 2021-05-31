import 'dart:io';
import 'package:e_quiz/models/offlinequiz/offline_quiz_model.dart';
import 'package:path_provider/path_provider.dart';

import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database _offlineQuizDb;
  static DatabaseHelper _productDatabaseHelper;

  String table = 'offlineQuizTable';
  String colId = 'id';
  String coldata = 'data';
  String colQuizId = 'quizId';
  String colIsSynced = 'isSynced';
  DatabaseHelper._createInstance();

  static final DatabaseHelper db = DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_productDatabaseHelper == null) {
      _productDatabaseHelper = DatabaseHelper._createInstance();
    }
    return _productDatabaseHelper;
  }

  Future<Database> get database async {
    if (_offlineQuizDb == null) {
      _offlineQuizDb = await initializeDatabase();
    }
    return _offlineQuizDb;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'offlineQuiz.db';
    var myDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return myDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute("CREATE TABLE $table"
        "($colId INTEGER PRIMARY KEY AUTOINCREMENT,"
        "$coldata TEXT,$colQuizId INTEGER, $colIsSynced INTEGER)");
  }

  Future<List<Map<String, dynamic>>> getOfflineQuizMapList() async {
    Database db = await this.database;
    var result = await db.query(table, orderBy: "$colId ASC");
    return result;
  }

  Future<int> insertOfflineQuiz(OfflineQuiz offlineQuiz) async {
    Database db = await this.database;
    var result = await db.insert(table, offlineQuiz.toJson());
    print(result);
    return result;
  }

  Future<int> deleteQuiz() async {
    var db = await this.database;
    int result = await db.delete(table);
    return result;
  }

  Future<int> getCount(tableName) async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $tableName');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  Future<List<OfflineQuiz>> getOfflineQuizList() async {
    var productMapList = await getOfflineQuizMapList();
    int count = await getCount(table);

    List<OfflineQuiz> offlineQuizList = [];
    for (int i = 0; i < count; i++) {
      offlineQuizList.add(OfflineQuiz.fromMap(productMapList[i]));
    }
    return offlineQuizList;
  }

  close() async {
    var db = await this.database;
    var result = db.close();
    return result;
  }
}
