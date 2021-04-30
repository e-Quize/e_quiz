import 'package:e_quiz/utils/colors.dart';
import 'package:e_quiz/utils/widgetproperties.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';

class GenericPercentagebar extends StatelessWidget {
  double percentage;


  GenericPercentagebar(this.percentage);

  @override
  Widget build(BuildContext context) {
    return Container(child: LinearPercentIndicator(
      alignment: MainAxisAlignment.start,
      width: WidgetProperties.screenWidth(context) / 1.23,
      lineHeight: 8.0,
      backgroundColor: Colors.white,
      percent: percentage,
      padding: EdgeInsets.only(left: 5.0, top: 10.0),
      progressColor: AppColors.progressbarColor,
    ),);
  }
}
