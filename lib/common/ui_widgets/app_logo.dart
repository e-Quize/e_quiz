import 'package:e_quiz/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SvgPicture.asset(
        Constants.SM_IMAGE_NAME,
        height: 65.0,
        width: 65.0,
      ),
    );
  }
}
