import 'package:charts_flutter/flutter.dart' as charts;
import 'package:e_quiz/controllers/graph_controller.dart';
import 'package:e_quiz/models/bargraph/bar_graph_model.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class BarChartScreen extends StatelessWidget {
  var graphController = Get.find<GraphController>();
  List<BarGraphModel> barChartList = [];

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
      initState: (child) {
        graphController.ini();
        getQuizPercentageForGraph();
      },
      init: graphController,
      builder: (_) {
        if (barChartList == null || barChartList.isEmpty) {
          return SizedBox();
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
      graphController.updateGraphBuilder();
    }
  }
}
