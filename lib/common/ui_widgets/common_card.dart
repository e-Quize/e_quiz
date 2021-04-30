import 'package:e_quiz/utils/values.dart';
import 'package:flutter/material.dart';

class CommonCard extends StatelessWidget {
  Widget child;

  CommonCard({this.child});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: AppValues.cardElevation,
      color: Color(0xfff2f2f2),
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
      child: child,
    );
  }
}
