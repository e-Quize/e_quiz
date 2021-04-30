// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pie_chart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PieChartModel _$PieChartModelFromJson(Map<String, dynamic> json) {
  return PieChartModel(
    CQ_Percentage: (json['CQ_Percentage'] as num)?.toDouble(),
    chaptername: json['chaptername'] as String,
  );
}

Map<String, dynamic> _$PieChartModelToJson(PieChartModel instance) =>
    <String, dynamic>{
      'CQ_Percentage': instance.CQ_Percentage,
      'chaptername': instance.chaptername,
    };
