import 'package:e_quiz/models/push_notification/secondary_push_notifcation.dart';

class MainPushNotification {
  SecondaryPushNotification notification;

  MainPushNotification();

  MainPushNotification.fromJson(Map<String, dynamic> json)
      : notification = json['notification'];

  toJson() {
    return {"notification": notification};
  }
}
