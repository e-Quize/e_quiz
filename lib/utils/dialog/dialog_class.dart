import 'package:e_quiz/common/ui_widgets/custom_button.dart';
import 'package:e_quiz/common/ui_widgets/text_view.dart';
import 'package:e_quiz/utils/colors.dart';
import 'package:e_quiz/utils/values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DialogClass {
  static showDialog(BuildContext buildContext, Function function, String title,
      String yes, String cancel) {
    showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: "",
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 400),
      context: buildContext,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.center,
          child: Container(
            width: MediaQuery.of(buildContext).size.width * 0.9,
            padding: EdgeInsets.only(top: 20.0),
            height: MediaQuery.of(buildContext).size.height / 6,
            child: Column(
              children: [
                Textview2(
                  textDecoration: TextDecoration.none,
                  title: title,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20.0),
                        child: HeroButton(
                          height: 30.0,
                          width: 120,
                          radius: AppValues.commonButtonCornerRadius,
                          gradient: AppColors.formContinueButtomColor,
                          title: yes,
                          onPressed: () {
                            function();
                          },
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 0.60,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20.0),
                        child: HeroButton(
                          height: 30.0,
                          width: 120,
                          radius: AppValues.commonButtonCornerRadius,
                          gradient: AppColors.formContinueButtomColor,
                          title: cancel,
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      },
    );
  }
}
