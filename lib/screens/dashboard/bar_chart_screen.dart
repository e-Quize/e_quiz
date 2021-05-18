import 'package:charts_flutter/flutter.dart' as charts;
import 'package:e_quiz/common/ui_widgets/common_card.dart';
import 'package:e_quiz/common/ui_widgets/text_view.dart';
import 'package:e_quiz/controllers/graph_controller.dart';
import 'package:e_quiz/models/bargraph/bar_graph_model.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/utils/colors.dart';
import 'package:e_quiz/utils/dialog/loadingcircle/lib/ball_scale_indicator.dart';
import 'package:e_quiz/utils/dialog/loadingcircle/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class BarChartScreen extends StatelessWidget {
  var graphController = Get.find<GraphController>();
  List<BarGraphModel> barChartList;

  List<charts.Series<BarGraphModel, String>> series = [];

  List<Color> colorList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GraphController>(
      initState: (child) async {
        graphController.ini();
        await getQuizPercentageForGraph();
      },
      init: graphController,
      builder: (_) {
        if (barChartList == null) {
          return Center(
            child: Container(
              child: Loading(
                  indicator: BallScaleIndicator(),
                  size: 100.0,
                  color: Colors.pink),
            ),
          );
        } else if (barChartList.isEmpty) {
          return CommonCard(
            child: Center(
              child: Textview2(
                color: AppColors.primaryBtnColor,
                title: "No Data Found",
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        } else {
          return Container(
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
    );
  }

  getQuizPercentageForGraph() async {
    Result res = await graphController.getQuizPercentageForGraph();
    if (res != null) {
      barChartList = [];
      graphController.barGraphChartList = res.body;
      graphController.barGraphChartList.forEach((element) {
        barChartList.add(BarGraphModel(
            AttemptedDate: element.AttemptedDate,
            Percentage: element.Percentage));
      });
      series = [
        charts.Series(
            id: "BarGraphModel",
            data: barChartList ?? [],
            domainFn: (BarGraphModel series, _) => series.AttemptedDate ?? "",
            measureFn: (BarGraphModel series, _) => series.Percentage ?? 40.0,
            fillColorFn: (BarGraphModel series, _) {
              return charts.MaterialPalette.green.shadeDefault;
            }),
      ];
    }
    graphController.update();
  }
}
