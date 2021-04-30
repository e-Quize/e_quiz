import 'dart:convert';
import 'dart:convert' show json;

import 'package:e_quiz/db/repositiories/user_repository.dart';
import 'package:e_quiz/models/attemptquiz/quiz_question.dart';
import 'package:e_quiz/models/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:sembast/sembast.dart';

class SembastUserRepository extends UserRepository {
  Database _database = GetIt.I.get();

  final StoreRef _quiz_store = intMapStoreFactory.store("quiz_store");

  @override
  Future<void> insertList(List<QuizQuestion> quizQuestionList) async {
    var toAdd = jsonDecode(jsonEncode(quizQuestionList));
    await _quiz_store.addAll(_database, asMapList(toAdd));
  }

  List<Map<String, dynamic>> asMapList(dynamic list) {
    return (list as List)?.cast<Map<String, dynamic>>();
  }

  @override
  Future<List<QuizQuestion>> getAllQuestions() async {
    final snapshots = await _quiz_store.find(_database);
    return snapshots
        .map((snapshot) => QuizQuestion.fromJson(snapshot.value))
        .toList(growable: false);
  }

  @override
  Future deleteQuiz() async {
    await _quiz_store.drop(_database);
    _database = null;
  }
}
