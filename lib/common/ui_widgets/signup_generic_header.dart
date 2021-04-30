import 'package:e_quiz/utils/colors.dart';
import 'package:e_quiz/utils/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'text_view.dart';

class SignupGenericHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Textview2(
            title: 'Create an Account',
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.w800,
            textAlign: TextAlign.left,
            fontFamily: AppValues.fontFamily,
          ),
          Textview2(
            title: 'Are you New User',
            fontSize: 10.0,
            color: AppColors.subTitleColor,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.left,
            fontFamily: AppValues.fontFamily,
          ),
        ],
      ),
    );
  }
}
