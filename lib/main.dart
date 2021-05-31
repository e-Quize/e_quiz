import 'dart:async';
import 'dart:convert';

import 'package:e_quiz/screens/splash_screen.dart';
import 'package:e_quiz/utils/widgetproperties.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controllers/notification_controller.dart';
import 'db/user_crud.dart';
import 'models/push_notification/push_notification_model.dart';
import 'models/user/fcm_token_model.dart';
import 'screens/quizscreens/competition_question_screen.dart';
import 'singleton_notification.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
// If you're going to use other Firebase services in the background, such as Firestore,
// make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  print('From Background');
  RemoteNotification notification = message.notification;
  String aa = notification.body;
  var _notificationController = Get.put(NotificationController());
  Map model = jsonDecode(aa);
  var pushNotificationModel = PushNotificationModel.fromJson(model);
  FcmTokenModel fcmTokenModel = FcmTokenModel();
  fcmTokenModel.FCMQuizId = pushNotificationModel.QuizId;
  fcmTokenModel.Notificationtype = pushNotificationModel.NotificationType;
  await UserCrud.insertFcmQuizId(fcmTokenModel);
  print(pushNotificationModel.QuizId.toString());
  _notificationController.notificationQuizId = pushNotificationModel.QuizId;
  prefs.setInt('quizId', pushNotificationModel.QuizId);
  NotificationSingleton.instance.quizId = pushNotificationModel.QuizId;
  if (pushNotificationModel.NotificationType == 2) {
    WidgetProperties.goToNextPage(Get.context, CompetitionQuestionScreen());
  }
}

/// Create a [AndroidNotificationChannel] for heads up notifications
const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  'This channel is used for important notifications.', // description
  importance: Importance.high,
);

/// Initialize the [FlutterLocalNotificationsPlugin] package.
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

fcmData() {
  FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage message) {
    if (message != null) {}
  });

  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    RemoteNotification notification = message.notification;
    AndroidNotification android = message.notification?.android;
    String aa = notification.body;
    Map model = jsonDecode(aa);
    var pushNotificationModel = PushNotificationModel.fromJson(model);
    FcmTokenModel fcmTokenModel = FcmTokenModel();
    fcmTokenModel.FCMQuizId = pushNotificationModel.QuizId;
    fcmTokenModel.Notificationtype = pushNotificationModel.NotificationType;
    await UserCrud.insertFcmQuizId(fcmTokenModel);
    print(pushNotificationModel.QuizId.toString());
    var _notificationController = Get.put(NotificationController());
    _notificationController.notificationQuizId = pushNotificationModel.QuizId;
    await NotificationSingleton.instance.notify();
    NotificationSingleton.instance.showNotification(
        pushNotificationModel.NotificationType,
        pushNotificationModel.Description);
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
    print("neewwwwww");
    RemoteNotification notification = message.notification;
    AndroidNotification android = message.notification?.android;

    var _notificationController = Get.put(NotificationController());
    String aa = notification.body;
    Map model = jsonDecode(aa);
    var pushNotificationModel = PushNotificationModel.fromJson(model);
    FcmTokenModel fcmTokenModel = FcmTokenModel();
    fcmTokenModel.FCMQuizId = pushNotificationModel.QuizId;
    fcmTokenModel.Notificationtype = pushNotificationModel.NotificationType;
//await UserCrud.insertFcmQuizId(fcmTokenModel);
    print(pushNotificationModel.QuizId.toString());
    _notificationController.notificationQuizId = pushNotificationModel.QuizId;
    //
    if (pushNotificationModel.NotificationType == 2) {
      WidgetProperties.goToNextPage(Get.context, CompetitionQuestionScreen());
    }

/*if (notification != null && android != null) {
flutterLocalNotificationsPlugin.show(
notification.hashCode,
notification.title,
notification.body,
NotificationDetails(
android: AndroidNotificationDetails(
channel.id,
channel.name,
channel.description,
// TODO add a proper drawable resource to android, for now using
// one that already exists in example app.
icon: '@mipmap/ic_launcher',
),
));
}*/
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetProperties.enablePlatformOverrideForDesktop();
  await Firebase.initializeApp();

// Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  /// Create an Android Notification Channel.
  ///
  /// We use this channel in the `AndroidManifest.xml` file to override the
  /// default FCM channel to enable heads up notifications.
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  fcmData();
  runApp(MainScreen());
  //Init.initialize();
// openDb();
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Sans',
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
