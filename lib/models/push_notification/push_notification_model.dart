class PushNotificationModel {
  int NotificationType;
  String Description;
  int QuizId;

  PushNotificationModel.fromJson(Map<String, dynamic> json)
      : NotificationType = json['NotificationType'],
        Description = json['Description'],
        QuizId = json['QuizId'];

  toJson() {
    return {
      "NotificationType": NotificationType,
      "Description": Description,
      "QuizId": QuizId,
    };
  }
}
