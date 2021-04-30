import 'package:e_quiz/models/user/user_model.dart';
import 'package:e_quiz/models/attemptquiz/quiz_question.dart';

abstract class UserRepository {


  Future<void> insertList(List<QuizQuestion> quizQuestionList);
  Future<List<QuizQuestion>> getAllQuestions();

// Future updateCake(Cake cake);
//
Future deleteQuiz();

}
