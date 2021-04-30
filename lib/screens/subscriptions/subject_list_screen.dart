import 'package:e_quiz/common/ui_widgets/text_view.dart';
import 'package:e_quiz/controllers/quiz_controller.dart';
import 'package:e_quiz/utils/colors.dart';
import 'package:e_quiz/utils/dialog/loadingcircle/lib/ball_scale_indicator.dart';
import 'package:e_quiz/utils/dialog/loadingcircle/loading.dart';
import 'package:e_quiz/utils/widgetproperties.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';


class SubjectListScreen extends StatelessWidget {

  var quizController = Get.find<QuizController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(builder: (_) {
      if (quizController.subjectTempList == null) {
        return Center(
          child: Container(
            child: Loading(
                indicator: BallScaleIndicator(),
                size: 100.0,
                color: Colors.pink),
          ),
        );
      } else {
        return Container(
          child: ListView.builder(
            itemCount: quizController.subjectTempList.length,
            shrinkWrap: false,
            itemBuilder: (context, index) {
              return listItem(index, context);
            },
          ),
        );
      }
    });
  }


  Widget listItem(int index, BuildContext context) {
    return GestureDetector(
      onTap: () {
        quizController.subjectTempList[index].checked =
            !quizController.subjectTempList[index].checked;
        quizController.updateBuilder();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 2.0),
                        child: Textview2(
                          title: quizController.subjectTempList[index].SubjectName,
                          color: quizController.subjectTempList[index].checked
                              ? AppColors.primaryColor
                              : AppColors.commoneadingtextColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 13.0,
                        ),
                      ),
                    ],
                  ),
                  Textview2(
                    title: r'$ ' +
                        quizController.subjectTempList[index].PerMonthAmount
                            .toString(),
                    color: AppColors.accentColor1,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                  )
                ],
              ),
            ),
            WidgetProperties.getDivider(
                color: AppColors.commoneadingtextColor.withOpacity(0.7))
          ],
        ),
      ),
    );
  }

}
