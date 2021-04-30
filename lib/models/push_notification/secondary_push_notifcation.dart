import 'package:e_quiz/models/push_notification/push_notification_model.dart';

class SecondaryPushNotification {
  String title;
  PushNotificationModel body;

  SecondaryPushNotification.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        body = json["body"];

  toJson() {
    return {"title": title, "body": body};
  }
}
