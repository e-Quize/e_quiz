import 'package:e_quiz/screens/quizscreens/competitor_result_screen.dart';
import 'package:e_quiz/utils/colors.dart';
import 'package:flutter/material.dart';

import 'self_result_screen.dart';

class TabbarView extends StatefulWidget {
  @override
  _TabbarViewState createState() => _TabbarViewState();
}

class _TabbarViewState extends State<TabbarView>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
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
