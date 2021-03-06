import 'package:e_quiz/controllers/dashboard_controller.dart';
import 'package:e_quiz/controllers/graph_controller.dart';
import 'package:e_quiz/controllers/subject_controller.dart';
import 'package:e_quiz/screens/chat/admin_screen.dart';
import 'package:e_quiz/screens/dashboard/home_screen.dart';
import 'package:e_quiz/screens/profile/profile_screen.dart';
import 'package:e_quiz/screens/quizscreens/start_test_screen.dart';
import 'package:e_quiz/screens/history/subject_history_screen.dart';
import 'package:e_quiz/utils/colors.dart';
import 'package:e_quiz/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

void main() {
  runApp(MaterialApp(home: DashboardScreen()));
}

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  var graphController = Get.put(GraphController());
  var dashboardController = Get.put(DashboardController());
  var subController = Get.put(SubjectController());
  GlobalKey _bottomNavigationKey = GlobalKey();

  Widget getCurrentScreens(int index) {
    Widget widget = Container();

    switch (index) {
      case 0:
        widget = HomeScreen();
        break;
      case 1:
        widget = StartTestScreen();
        break;
      case 2:
        widget = SubjectHistoryScreen();
        break;
      case 3:
        widget = ProfileScreen();
        break;
      case 4:
        widget = AdminScreen();
        break;
      // case 5:
      //   widget = NavigationDrawerScreen();
      //   break;
    }
    return widget;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: dashboardController,
      initState: (child) {
        subController.ini();
        Future.delayed(Duration.zero, () {
          getPendingQuiz();
        });
      },
      builder: (_) {
        return WillPopScope(
          onWillPop: () async {
            if (dashboardController.currentIndex == 5) {
              dashboardController.currentIndex = 4;
              onTabTapped;
              // dashboardController
              //     .updateScreenIndex(dashboardController.currentIndex);
              // setState(() {});
            } else if (dashboardController.currentIndex == 4) {
              dashboardController.currentIndex = 3;
              onTabTapped;
              // dashboardController
              //     .updateScreenIndex(dashboardController.currentIndex);
              // setState(() {});
            }
            if (dashboardController.currentIndex == 3) {
              dashboardController.currentIndex = 2;
              onTabTapped;
              // dashboardController
              //     .updateScreenIndex(dashboardController.currentIndex);
              // setState(() {});
            } else if (dashboardController.currentIndex == 2) {
              dashboardController.currentIndex = 1;
              onTabTapped;
              // dashboardController
              //     .updateScreenIndex(dashboardController.currentIndex);
              // setState(() {});
            } else {
              return true;
            }
            return false;
          },
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.white,
            bottomNavigationBar: BottomNavigationBar(
              key: _bottomNavigationKey,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              currentIndex: dashboardController.currentIndex,
              // this will be set when a new tab is tapped
              onTap: onTabTapped,
              backgroundColor: AppColors.primaryBtnColor,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    Constants.DASHBOARD_IMAGE_NAME,
                    height: 30.0,
                    width: 30.0,
                    color: dashboardController.isChecked &&
                            dashboardController.currentIndex == 0
                        ? Colors.white
                        : AppColors.unCheckedBottomNavigationIconColor,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    Constants.TIMECLOCK_IMAGE_NAME,
                    height: 30.0,
                    width: 30.0,
                    color: dashboardController.isChecked &&
                            dashboardController.currentIndex == 1
                        ? Colors.white
                        : AppColors.unCheckedBottomNavigationIconColor,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    Constants.START_TEST_IMAGE_NAME,
                    height: 30.0,
                    width: 30.0,
                    color: dashboardController.isChecked &&
                            dashboardController.currentIndex == 2
                        ? Colors.white
                        : AppColors.unCheckedBottomNavigationIconColor,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    Constants.PERSON_IMAGE_NAME,
                    height: 30.0,
                    width: 30.0,
                    color: dashboardController.isChecked &&
                            dashboardController.currentIndex == 3
                        ? Colors.white
                        : AppColors.unCheckedBottomNavigationIconColor,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    Constants.CHAT_ICON_NAME,
                    height: 30.0,
                    width: 30.0,
                    color: dashboardController.isChecked &&
                            dashboardController.currentIndex == 4
                        ? Colors.white
                        : AppColors.unCheckedBottomNavigationIconColor,
                  ),
                  label: "",
                ),
                // BottomNavigationBarItem(
                //   icon: SvgPicture.asset(
                //     Constants.MORE_ICON_NAME,
                //     height: 30.0,
                //     width: 30.0,
                //     color: dashboardController.checked &&
                //             dashboardController.currentIndex == 5
                //         ? Colors.white
                //         : AppColors.unCheckedBottomNavigationIconColor,
                //   ),
                //   label: "",
                // ),
              ],
            ),
            body: getCurrentScreens(dashboardController.currentIndex),
          ),
        );
      },
    );
  }

  onTabTapped(int index) async {
    await dashboardController.updateScreenIndex(index);
  }

  void getPendingQuiz() {
    // Get.find().;
    // Navigate
  }
}
