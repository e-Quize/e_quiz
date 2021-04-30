// import 'package:e_quiz/common/ui_widgets/custom_button.dart';
// import 'package:e_quiz/common/ui_widgets/text_view.dart';
// import 'package:e_quiz/controllers/UserController.dart';
// import 'package:e_quiz/screens/common/common_background.dart';
// import 'package:e_quiz/utils/colors.dart';
// import 'package:e_quiz/screens/dashboard/dashboard_screen.dart';
// import 'package:e_quiz/utils/constants.dart';
// import 'package:e_quiz/utils/values.dart';
// import 'package:e_quiz/utils/widgetproperties.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
//
// class FinishScreen extends StatelessWidget {
//
//   GlobalKey<FormState> _key = GlobalKey<FormState>();
//   var userController = UserController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Stack(
//         children: [
//           BodyBackground(
//             heightTop: WidgetProperties.screenHeight(context) * 0.5,
//             heightBottom: WidgetProperties.screenHeight(context) * 0.5,
//             body: Container(),
//           ),
//           Container(
//             margin: EdgeInsets.only(top: 40.0),
//             alignment: Alignment.topCenter,
//             child: SvgPicture.asset(
//               Constants.BASE_PATH_IMAGE + "award.svg",
//               height: 100.0,
//               width: 100.0,
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(top: 120.0),
//             child: Column(
//               children: [
//                 Container(
//                   margin: EdgeInsets.only(
//                       left: AppValues.horizontalMargin,
//                       right: AppValues.horizontalMargin,
//                       top: 15.0),
//                   child: Material(
//                     elevation: AppValues.cardElevation,
//                     color: Color(0xfff2f2f2),
//                     borderRadius: BorderRadius.all(
//                         Radius.circular(AppValues.commonBodyCardRadius)),
//                     child: Container(
//                       height: WidgetProperties.screenHeight(context) * 0.6,
//                       child: form(context),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget form(BuildContext context) {
//     return GetBuilder<UserController>(
//       init: userController,
//       builder: (_) {
//         return Form(
//           key: _key,
//           child: Container(
//             margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
//             child: Column(
//               children: [
//                 Container(
//                   margin: EdgeInsets.only(top: 7.0),
//                   child: Textview2(
//                     title: "Result Your Quiz Result Your Quiz",
//                     fontSize: 20.0,
//                     color: AppColors.accent3Color,
//                     fontWeight: FontWeight.bold,
//                     textAlign: TextAlign.left,
//                     fontFamily: AppValues.fontFamily,
//                   ),
//                 ),
//                 Container(
//                   child: Textview2(
//                     title: "This is the result of your test back BtnColor",
//                     fontSize: 15.0,
//                     color: AppColors.backBtnColor,
//                     fontWeight: FontWeight.bold,
//                     textAlign: TextAlign.left,
//                     fontFamily: AppValues.fontFamily,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 12.0,
//                 ),
//                 getRow("Total No of Question:", AppColors.textBlackColor,
//                     AppColors.textBlackColor, "25"),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 getRow("Correct No of Question:", AppColors.textBlackColor,
//                     AppColors.formContinueButtomColor, "20"),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 getRow("Wrong No of Question:", AppColors.textBlackColor,
//                     AppColors.startNowTextColor1, "0.6"),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 getRow("Percentage:", AppColors.textBlackColor,
//                     AppColors.accentColor, "85%"),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 getRow("Grade:", AppColors.textBlackColor,
//                     AppColors.commoneadingtextColor, "A"),
//                 Container(
//                   margin: EdgeInsets.only(top: 20.0),
//                   child: HeroButton(
//                     width: 380.0,
//                     height: 40.0,
//                     radius: AppValues.commonButtonCornerRadius,
//                     gradient: AppColors.primaryBtnColor,
//                     title: 'Finish',
//                     onPressed: () {
//                       WidgetProperties.goToNextPage(
//                         context,
//                         DashboardScreen(),
//                       );
//                     },
//                   ),
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Widget getRow(String textViewText1, Color textColor, Color containerColor,
//       String textViewText2) {
//     return Container(
//       margin: EdgeInsets.only(top: 10.0),
//       child: Row(
//         children: [
//           Container(
//             color: containerColor,
//             height: 30.0,
//             width: 10.0,
//           ),
//           Expanded(
//             child: Container(
//               margin: EdgeInsets.only(left: 10.0),
//               child: Textview2(
//                 title: textViewText1,
//                 fontSize: 20.0,
//                 color: textColor,
//                 fontWeight: FontWeight.bold,
//                 fontFamily: AppValues.fontFamily,
//               ),
//             ),
//           ),
//           Container(
//             child: Textview2(
//               title: textViewText2,
//               fontSize: 20.0,
//               color: containerColor,
//               fontWeight: FontWeight.bold,
//               fontFamily: AppValues.fontFamily,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
