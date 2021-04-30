import 'package:flutter/material.dart';
import 'package:e_quiz/utils/checkInternetconnectivity.dart';

class CustomGestureDetector1 extends StatelessWidget {
  final Widget widget;
  final Function checkConnectivity;

  CustomGestureDetector1({this.widget, this.checkConnectivity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: checkConnectivity,
      // onTap: () {
      //   checkConnectivity;
      //   Connections.createSnackBar("No Internet Connected", context);
      // },
      child: widget,
    );
  }
}

class CustomGestureDetector extends StatelessWidget {
  final Widget widget;
  final Function onPress;

  CustomGestureDetector({this.widget, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: widget,
    );
  }
}
