import 'package:charts_flutter/flutter.dart' as charts;
import 'package:e_quiz/common/ui_widgets/text_view.dart';
import 'package:e_quiz/controllers/graph_controller.dart';
import 'package:e_quiz/controllers/user_controller.dart';
import 'package:e_quiz/models/bargraph/bar_graph_model.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/models/piechart/pie_chart_model.dart';
import 'package:e_quiz/models/user/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../utils/dialog/loadingcircle/lib/ball_scale_indicator.dart';
import '../../utils/dialog/loadingcircle/loading.dart';

class BarChartScreenReplacement extends StatelessWidget {
  var graphController = Get.find<GraphController>();
  var userController = Get.find<UserController>();
  List<PieChartModel> pieGraphList;
  Map<String, double> dataMap;

  List<charts.Series<PieChartModel, String>> series = [];

  List<Color> colorList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Last ten Quizes percentage'),
      ), //AppBar
      body: GetBuilder<GraphController>(
        initState: (child) async {
          await getChapterPercentage();
        },
        init: graphController,
        builder: (_) {
          if (pieGraphList == null) {
            return Center(
              child: Container(
                child: Loading(
                    indicator: BallScaleIndicator(),
                    size: 100.0,
                    color: Colors.pink),
              ),
            );
          } else if (pieGraphList.isEmpty) {
            return Center(
              child: Textview2(
                title: "No Data Found",
              ),
            );
          } else {
            return Container(
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.all(20.0),
              child: charts.BarChart(
                series,
                domainAxis: charts.OrdinalAxisSpec(
                  renderSpec: charts.SmallTickRendererSpec(labelRotation: 70),
                ),
                animate: true,
                vertical: true,
              ),
            );
          }
        },
      ),
    );
  }

  getChapterPercentage() async {
    var userEntity = UserEntity();
    userEntity.SubjectIdsString = userController.selectedSubjectId.toString();
    Result res = await Get.find<GraphController>()
        .getChaptersPercentageForPie(userEntity);
    if (res != null) {
      pieGraphList = res.body;
      if (pieGraphList != null &&
          pieGraphList.isNotEmpty) {
     dataMap = Map.fromIterable(
            pieGraphList,
            key: (e) => e.chaptername,
            value: (e) => e.CQ_Percentage);
      } else {
        print("there is no data");
      }
      Get.find<GraphController>().updateGraphBuilder();
    }
  }
}
