import 'package:flutter/material.dart';

import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotification extends StatefulWidget {
  String messageTitle = "Empty";
  String notificationAlert = "alert";
  String token;

  @override
  _FirebaseNotificationState createState() => _FirebaseNotificationState();
}

class _FirebaseNotificationState extends State<FirebaseNotification> {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.messageTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.notificationAlert,
            ),
            Text(
              widget.messageTitle,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    init();
    _firebaseMessaging.configure(
      onMessage: (message) async {
        setState(() {
          widget.messageTitle = message["notification"]["title"];
          widget.notificationAlert = "New Notification Alert";
        });
      },
      onResume: (message) async {
        setState(() {
          widget.messageTitle = message["data"]["title"];
          widget..notificationAlert = "Application opened from Notification";
        });
      },
    );
  }

  Future<void> init() async {
    // For iOS request permission first.
    _firebaseMessaging.requestNotificationPermissions();
    _firebaseMessaging.configure();

    // For testing purposes print the Firebase Messaging token
    String token = await _firebaseMessaging.getToken();
    print("FirebaseMessaging token: $token");
  }
}
