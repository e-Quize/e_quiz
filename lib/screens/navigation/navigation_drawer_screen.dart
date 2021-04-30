import 'package:flutter/material.dart';
import 'package:e_quiz/screens/more/change_subscription_screen.dart';
import 'package:e_quiz/utils/widgetproperties.dart';
import 'package:e_quiz/screens/notification/notification_screen.dart';
import 'package:e_quiz/screens/history/payment_history_screen.dart';
import 'package:e_quiz/utils/colors.dart';

class NavigationDrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryBtnColor,
          title: Text("Drawer app"),
        ),
        endDrawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                onTap: () {
                  openScreen(context, ChangeSubscriptionScreen());
                },
                title: Text(
                  "Change Subscription",
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
                // leading: Icon(Icons.arrow_forward),
              ),
              Divider(
                height: 3.0,
                color: Colors.green,
              ),
              ListTile(
                onTap: () {
                  openScreen(context, NotificationScreen());
                },
                title: Text("Notifications",
                    style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold)),
                // trailing: Icon(Icons.arrow_forward),
              ),
              Divider(
                height: 3.0,
                color: Colors.green,
              ),
              ListTile(
                onTap: () {
                  openScreen(context, PaymentHistoryScreen());
                },
                title: Text("Payment History",
                    style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold)),
                // trailing: Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ), //this will just add the Navigation Drawer Icon
      ),
    );
  }

  openScreen(BuildContext buildContext, Widget widget) {
    Navigator.of(buildContext).pop();
    WidgetProperties.goToNextPage(buildContext, widget);
  }
}
