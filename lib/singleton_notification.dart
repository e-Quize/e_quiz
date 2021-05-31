import 'package:e_quiz/screens/splash_screen.dart';

import 'main.dart';
import 'screens/quizscreens/competition_question_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:workmanager/workmanager.dart';

class NotificationSingleton {
  NotificationSingleton._privateConstructor();

  int quizId;
  static final NotificationSingleton instance =
      NotificationSingleton._privateConstructor();

  notify() async {
    var initializationSettingsAndroid =
        AndroidInitializationSettings('flutter_devs');
    var initializationSettingsIOs = IOSInitializationSettings();
    var initSetttings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOs);
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        new FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initSetttings,
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) {
    if (payload == '2') {
      Navigator.of(Get.context).push(MaterialPageRoute(builder: (_) {
        return CompetitionQuestionScreen();
      }));
    }
  }

  showNotification(int type, String body) async {
    var android = AndroidNotificationDetails('id', 'channel ', 'description',
        priority: Priority.high, importance: Importance.max);
    var iOS = IOSNotificationDetails();
    var platform = NotificationDetails(android: android, iOS: iOS);
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        new FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin.show(1, "Equiz", body, platform,
        payload: type.toString());

  }
}
