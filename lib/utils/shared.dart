import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static String quizId = "quizId";

//set data into shared preferences like this
  static Future<void> setQuizId(int auth_token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(quizId, auth_token);
  }

//get value from shared preferences
  static  Future<int> getQuizId() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    int auth_token;
    auth_token = pref.getInt(quizId) ?? null;
    return auth_token;
  }
}