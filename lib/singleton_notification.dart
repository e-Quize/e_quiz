import 'package:e_quiz/screens/notification/notification_plugin.dart';
import 'package:e_quiz/screens/quizscreens/question_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:workmanager/workmanager.dart';



class NotificationSingleton {

  NotificationSingleton._privateConstructor();

  static final NotificationSingleton instance = NotificationSingleton._privateConstructor();

  notify(){
    var initializationSettingsAndroid =
        AndroidInitializationSettings('flutter_devs');
    var initializationSettingsIOs = IOSInitializationSettings();
    var initSetttings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOs);

    flutterLocalNotificationsPlugin.initialize(initSetttings,
        onSelectNotification: onSelectNotification);
  }
  Future onSelectNotification(String payload) {
    Navigator.of(Get.context).push(MaterialPageRoute(builder: (_) {
      return QuestionScreen();
    }));
  }
  showNotification(String body) async {
    var android = AndroidNotificationDetails('id', 'channel ', 'description',
        priority: Priority.high, importance: Importance.max);
    var iOS = IOSNotificationDetails();
    var platform = NotificationDetails(android: android, iOS: iOS);
    await flutterLocalNotificationsPlugin.show(1, "Equiz", body, platform,
        payload: 'Welcome to the Local Notification demo ');
  }
   callbackDispatcher() {
    Workmanager.executeTask((task, inputData) {

      // initialise the plugin of flutterlocalnotifications.
      FlutterLocalNotificationsPlugin flip = new FlutterLocalNotificationsPlugin();

      // app_icon needs to be a added as a drawable
      // resource to the Android head project.
      var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
      var IOS = new IOSInitializationSettings();

      // initialise settings for both Android and iOS device.
      var settings = new InitializationSettings(android: android, iOS: IOS);
      flip.initialize(settings);
      _showNotificationWithDefaultSound(flip);
      return Future.value(true);
    });
  }

  Future _showNotificationWithDefaultSound(flip) async {

    // Show a notification after every 15 minute with the first
    // appearance happening a minute after invoking the method
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'your channel id',
        'your channel name',
        'your channel description',
        importance: Importance.max,
        priority: Priority.high
    );
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();

    // initialise channel platform for both Android and iOS device.
    var platformChannelSpecifics = new NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics
    );
    await flip.show(0, 'GeeksforGeeks',
        'Your are one step away to connect with GeeksforGeeks',
        platformChannelSpecifics, payload: 'Default_Sound'
    );
  }
}