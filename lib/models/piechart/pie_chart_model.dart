
import 'package:json_annotation/json_annotation.dart';

part 'pie_chart_model.g.dart';

@JsonSerializable()
class PieChartModel{

  @JsonKey()
  double CQ_Percentage;
  @JsonKey()
  String chaptername;

  PieChartModel({this.CQ_Percentage, this.chaptername});

  factory PieChartModel.fromJson(Map<String, dynamic> json) =>
      _$PieChartModelFromJson(json);

  Map<String, dynamic> toJson() => _$PieChartModelToJson(this);
}