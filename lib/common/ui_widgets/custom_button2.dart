import 'package:e_quiz/common/ui_widgets/text_view.dart';
import 'package:e_quiz/utils/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HeroButton2 extends StatelessWidget {
  String title;
  Function onPressed;
  Color gradient;
  Color textColor;
  double height;
  double width;
  double radius;

  HeroButton2(
      {this.title,
      this.onPressed,
      this.gradient,
      this.textColor,
      this.height,
      this.width,
      this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: textColor == null
          ? BoxDecoration(
              color: gradient,
              borderRadius: BorderRadius.all(Radius.circular(radius)),
            )
          : BoxDecoration(
              border: Border.all(color: gradient),
              borderRadius: BorderRadius.all(Radius.circular(radius)),
            ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Center(
              child: Textview2(
            title: title,
            fontSize: 11.0,
            color: textColor ?? Colors.white,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.left,
            fontFamily: AppValues.fontFamily,
          )),
        ),
      ),
    );
  }
}
