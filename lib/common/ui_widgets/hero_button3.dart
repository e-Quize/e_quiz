import 'package:e_quiz/utils/colors.dart';
import 'package:flutter/material.dart';

class HeroButton3 extends StatelessWidget {
  String title;
  Function onPressed;
  Color gradient;
  double height;
  double width;
  double radius;

  HeroButton3(
      {this.title,
      this.onPressed,
      this.gradient,
      this.height,
      this.width,
      this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: gradient,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  color: AppColors.startNowTextColor,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
