import 'package:e_quiz/screens/quizscreens/competitor_result_screen.dart';
import 'package:e_quiz/utils/colors.dart';
import 'package:flutter/material.dart';

import 'self_result_screen.dart';

class TabbarViewResult extends StatefulWidget {
  @override
  _TabbarViewResultState createState() => _TabbarViewResultState();
}

class _TabbarViewResultState extends State<TabbarViewResult>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 1, vsync: this);
    super.initState();
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
          labelColor: Colors.white,
          tabs: [
            Tab(
              child: Text("Self Result"),
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
        ],
        controller: _tabController,
      ),
    );
  }
}
