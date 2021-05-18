import 'package:charts_flutter/flutter.dart' as charts;
import 'package:e_quiz/common/ui_widgets/text_view.dart';
import 'package:e_quiz/controllers/graph_controller.dart';
import 'package:e_quiz/controllers/user_controller.dart';
import 'package:e_quiz/models/bargraph/bar_graph_model.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/models/piechart/pie_chart_model.dart';
import 'package:e_quiz/models/user/user_model.dart';
import 'package:e_quiz/utils/colors.dart';
import 'package:e_quiz/utils/widgetproperties.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';
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
        title: Text('Correct percentage of each chapter',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
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
              height: WidgetProperties.screenHeight(context),
              width: WidgetProperties.screenWidth(context),
              margin: EdgeInsets.all(10),

              child: Stack(
                children: [
                  Center(
                    child:SvgPicture.asset(
                      'assets/icons/app_logo.svg',
                      width: 220,
                      height: 220,
                    ) ,
                  ),
                  Material(
                    color: Colors.white.withOpacity(.8),
                    elevation: 0.0,
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              itemCount: graphController.pieGraphChartList.length,
                              itemBuilder: (context,index){
                            return Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(width: 20,height: 20,color: Colors.blue,),
                                          SizedBox(width: 10,),
                                          Text(graphController.pieGraphChartList[index].chaptername,),
                                        ],
                                      ),

                                      Row(
                                        children: [
                                          Container(width: 50,height: 50,
                                            padding: EdgeInsets.all(5),
                                            alignment: Alignment.center,
                                            child: Text(graphController.pieGraphChartList[index].CQ_Percentage.toString(),),
                                            decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black)
                                          ),),
                                          SizedBox(width: 10,),
                                          Text('%'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                        Container(height: 1, width: WidgetProperties.screenWidth(context),color: Colors.blue,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                          margin: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            Text('Average',style: TextStyle(color: Colors.blue),),
                              getAverage(),
                          ],),
                        ),
                      ],
                    ),
                  ),
                ],
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

  Widget getAverage() {
    double average = 0.0;
    double count = 0.0;
    graphController.pieGraphChartList.forEach((element) {
      count += element.CQ_Percentage;
    });
    average = count / graphController.pieGraphChartList.length;

    return Text('${average.toStringAsFixed(2)} %');
  }


}
