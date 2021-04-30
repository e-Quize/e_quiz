import 'package:e_quiz/utils/colors.dart';
import 'package:e_quiz/utils/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BodyBackground extends StatelessWidget {
  double heightTop;
  double heightBottom;
  Widget body;

  BodyBackground({this.heightTop, this.heightBottom, this.body});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
         SingleChildScrollView(
           child: Column(
              children: [
                Container(
                  height: heightTop,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(AppValues.topBackgroundRadius),
                        bottomLeft: Radius.circular(AppValues.topBackgroundRadius),
                      ),
                      color: AppColors.primaryColor),
                ),
                Container(
                  height: heightBottom,
                  decoration: BoxDecoration(
                 /*     borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(AppValues.topBackgroundRadius),
                        bottomLeft: Radius.circular(AppValues.topBackgroundRadius),
                      ),*/
                      color: Colors.white),
                ),
              ],
            ),
         ),

      /* Positioned(
          left: 0.0,
          right: 0.0,
          bottom: 0.0,
          top: 140.0,
          child:body,
        )*/
      ],
    );
  }
}
