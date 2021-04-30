import 'package:e_quiz/controllers/animate_view_controller.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class AnimationControllerIds {
  AnimationControllerIds._privateConstructor();

  static final AnimationControllerIds instance =
      AnimationControllerIds._privateConstructor();

  final String splashId = "sp1";
  final String signUp1 = "s1";
  final String signUp2 = "s2";

  final Duration splashLogoOpacityTimer = Duration(milliseconds: 600);
  final Curve splashLogoOpacityCurve = Curves.easeIn;
  final double commonOpacity = 1.0;
}
