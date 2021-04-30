import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();


  Future<void> init() async {
    // For iOS request permission first.
    _firebaseMessaging.requestNotificationPermissions();
    _firebaseMessaging.configure();

    // For testing purposes print the Firebase Messaging token
    String token = await _firebaseMessaging.getToken();
    print("FirebaseMessaging token: $token");
  }

}
