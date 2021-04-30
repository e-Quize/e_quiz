import 'package:e_quiz/utils/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomHeroButtonSubscription extends StatelessWidget {
  String title;
  Function onPressed;
  Color gradient;
  double height;
  double width;
  Color textColor;
  double radius;

  CustomHeroButtonSubscription(
      {this.title,
      this.onPressed,
      this.gradient,
      this.height,
      this.textColor,
      this.width,
      this.radius});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      height: height,
      minWidth: width,
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
            color: textColor, fontSize: 12.0, fontWeight: FontWeight.w600),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      color: gradient,
    );
  }
}

class CustomButton extends StatelessWidget {
  String title;
  Function onPressed;
  Color gradient;
  double height;
  double width;
  double radius;

  CustomButton(
      {this.title,
      this.onPressed,
      this.gradient,
      this.height,
      this.width,
      this.radius});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      height: height,
      minWidth: width,
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
            color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.w600),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          side: BorderSide(color: Colors.red)),
      color: gradient,
    );
  }
}
