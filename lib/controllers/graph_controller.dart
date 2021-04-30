import 'package:e_quiz/controllers/api_controller.dart';
import 'package:e_quiz/models/bargraph/bar_graph_model.dart';
import 'package:e_quiz/models/common/result_model.dart';
import 'package:e_quiz/models/piechart/pie_chart_model.dart';
import 'package:e_quiz/models/user/user_model.dart';
import 'package:get/get.dart';

class GraphController extends GetxController {
  var resultUser;
  List<PieChartModel> pieGraphChartList;
  List<BarGraphModel> barGraphChartList;
  var apiController;
  Map<String, double> dataMap;

  ini() {
    pieGraphChartList = null;
    barGraphChartList = null;
    dataMap = {};
    apiController = ApiController();
    resultUser = new Result().obs;
  }


  updateGraphResult(Result result) {
    this.resultUser.value = result;
  }

  updateGraphBuilder() {
    update();
  }

  Future<Result> getQuizPercentageForGraph() async {
    Result pieChartDataResult =
    await apiController.getQuizPercentagesForGraphFromApi();
    updateGraphResult(pieChartDataResult);
    return pieChartDataResult;
  }

  Future<Result> getChaptersPercentageForPie(UserEntity userEntity) async {
    // WidgetProperties.showLoader();
    Result pieChartDataResult =
    await apiController.getChaptersPercentageForPieFromApi(userEntity);
    updateGraphResult(pieChartDataResult);
    // WidgetProperties.closeLoader();
    return pieChartDataResult;
  }
}
