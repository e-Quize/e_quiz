import 'package:e_quiz/controllers/history_controller.dart';
import 'package:e_quiz/controllers/notification_controller.dart';
import 'package:e_quiz/controllers/quiz_controller.dart';
import 'package:e_quiz/screens/quizscreens/competitor_result_screen.dart';
import 'package:e_quiz/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'self_result_screen.dart';

class CompetitionQuizResult extends StatefulWidget {
  @override
  _CompetitionQuizResultState createState() => _CompetitionQuizResultState();
}

class _CompetitionQuizResultState extends State<CompetitionQuizResult>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  var _historyController = Get.find<HistoryController>();
  var _notificationController = Get.find<NotificationController>();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _historyController.selectedReAtemptedQuestionId = null;
    _notificationController.notificationQuizId = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Center(
            child: Text(
          'Result Screen',
          style: TextStyle(color: AppColors.textWhiteColor),
        )),
        backgroundColor: AppColors.primaryBtnColor,
        bottom: TabBar(
          unselectedLabelColor: Colors.white,
          labelColor: Colors.green,
          tabs: [
            Tab(
              child: Text("Self Result"),
            ),
            Tab(
              child: Text("Competition Result"),
            ),
          ],
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        bottomOpacity: 1,
      ),
      body: TabBarView(
        children: [
          SelfResultScreen(),
          CompetitionResultScreen(),
        ],
        controller: _tabController,
      ),
    );
  }
}
