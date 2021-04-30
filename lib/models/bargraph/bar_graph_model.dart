import 'package:json_annotation/json_annotation.dart';

part 'bar_graph_model.g.dart';

@JsonSerializable()
class BarGraphModel {
  @JsonKey()
  final String AttemptedDate;

  @JsonKey()
 final  double Percentage;

  // charts.Color color;

  BarGraphModel({this.Percentage, this.AttemptedDate});

  factory BarGraphModel.fromJson(Map<String, dynamic> json) =>
      _$BarGraphModelFromJson(json);

  Map<String, dynamic> toJson() => _$BarGraphModelToJson(this);
}
