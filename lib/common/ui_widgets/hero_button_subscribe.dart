import 'package:e_quiz/utils/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HeroButtonSubscription extends StatelessWidget {
  String title;
  Function onPressed;
  Color gradient;
  double height;
  double width;
  double radius;

  HeroButtonSubscription(
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
      child: AnimatedOpacity(
        opacity: 1.0,
        duration: Duration(milliseconds: 500),
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.w300),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      color: gradient,
    );
  }
}
