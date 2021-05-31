import 'package:e_quiz/models/offlinequiz/offline_quiz_model.dart';
import 'package:e_quiz/utils/database_helper.dart';
import 'package:get/get.dart';

class OfflineQuizController extends GetxController {
  List<OfflineQuiz> offlineQuizList = [];
  @override
  void onInit() {
    // fetchOfflineQuiz();
    super.onInit();
  }

  fetchOfflineQuiz() async {
    List<OfflineQuiz> list = [];
    list = await DatabaseHelper.db.getOfflineQuizList();
    list.forEach((element) {
      print("This is list comming from sqflite ${element.quizId}");
    });
  }

  void addOfflineQuiz(OfflineQuiz offlineQuiz) {
    DatabaseHelper.db.insertOfflineQuiz(offlineQuiz);
  }

  void deleteQuiz() {
    DatabaseHelper.db
        .deleteQuiz()
        .then((_) => print('Database deleted successfully!'));
  }

  @override
  void onClose() {
    DatabaseHelper.db.close();
    super.onClose();
  }
}
