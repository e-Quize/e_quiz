import 'package:e_quiz/controllers/graph_controller.dart';
import 'package:e_quiz/controllers/user_controller.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/models/piechart/pie_chart_model.dart';
import 'package:e_quiz/models/user/user_model.dart';
import 'package:e_quiz/utils/pi_chart_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:e_quiz/common/ui_widgets/text_view.dart';

class PieChartScreen extends StatelessWidget {
  var graphController = Get.find<GraphController>();
  var userController = Get.put(UserController());

  List<Color> colorList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
  ];

  ChartType _chartType = ChartType.ring;

  double _ringStrokeWidth = 20;
  double _chartLegendSpacing = 32;
  bool _showLegendsInRow = false;
  bool _showLegends = true;

  bool _showChartValueBackground = true;
  bool _showChartValues = true;
  bool _showChartValuesInPercentage = true;
  bool _showChartValuesOutside = false;

  LegendShape _legendShape = LegendShape.Circle;
  LegendPosition _legendPosition = LegendPosition.right;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: GetBuilder<GraphController>(builder: (_) {
      return Container(
        child: LayoutBuilder(
          builder: (_, constraints) {
            if (graphController.dataMap.isNotEmpty) {
              return PieChart(
                key: ValueKey(key),
                dataMap: graphController.dataMap,
                animationDuration: Duration(milliseconds: 800),
                chartLegendSpacing: _chartLegendSpacing,
                chartRadius: MediaQuery.of(context).size.width / 3.2 > 200
                    ? 300
                    : MediaQuery.of(context).size.width / 3.2,
                colorList: colorList,
                initialAngleInDegree: 0,
                chartType: _chartType,
                // centerText: _showCenterText ? "HYBRID" : null,
                legendOptions: LegendOptions(
                  showLegendsInRow: _showLegendsInRow,
                  legendPosition: _legendPosition,
                  showLegends: _showLegends,
                  legendShape: _legendShape == LegendShape.Circle
                      ? BoxShape.circle
                      : BoxShape.rectangle,
                  legendTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                chartValuesOptions: ChartValuesOptions(
                  showChartValueBackground: _showChartValueBackground,
                  showChartValues: _showChartValues,
                  showChartValuesInPercentage: _showChartValuesInPercentage,
                  showChartValuesOutside: _showChartValuesOutside,
                ),
                ringStrokeWidth: _ringStrokeWidth,
              );
            } else {
              return Container(
                margin: EdgeInsets.only(left: 25.0),
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width / 1.5,
                child: Textview2(
                  textAlign: TextAlign.center,
                  title: "No Chapter's Data Found Against This Subject",
                  fontSize: 12.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              );
            }
          },
        ),
      );
    }), onWillPop: () async {
      graphController.dataMap = {};
      return true;
    });
  }
}
