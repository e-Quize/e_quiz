import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

enum LegendShape { Circle, Rectangle }

class PieChartWidget extends StatelessWidget {
  int Widgetkey = 0;
  Map<String, double> dataMap = {
    "Flutter": 10,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };
  List<Color> colorList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
  ];

  ChartType _chartType = ChartType.disc;
  bool _showCenterText = true;
  double _ringStrokeWidth = 32;
  double _chartLegendSpacing = 32;

  bool _showLegendsInRow = false;
  bool _showLegends = true;

  bool _showChartValueBackground = true;
  bool _showChartValues = true;
  bool _showChartValuesInPercentage = false;
  bool _showChartValuesOutside = false;

  LegendShape _legendShape = LegendShape.Circle;
  LegendPosition _legendPosition = LegendPosition.right;

  @override
  Widget build(BuildContext context) {
    final chart = PieChart(
      key: ValueKey(key),
      dataMap: dataMap,
      animationDuration: Duration(milliseconds: 800),
      chartLegendSpacing: _chartLegendSpacing,
      chartRadius: MediaQuery.of(context).size.width / 3.2 > 300
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

    return LayoutBuilder(
      builder: (_, constraints) {
        if (constraints.maxWidth >= 600) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: chart,
              ),
            ],
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: chart,
                  margin: EdgeInsets.symmetric(
                    vertical: 32,
                  ),
                ),
                // settings,
              ],
            ),
          );
        }
      },
    );
  }
}
