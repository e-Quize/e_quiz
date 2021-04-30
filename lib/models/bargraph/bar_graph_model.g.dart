// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bar_graph_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BarGraphModel _$BarGraphModelFromJson(Map<String, dynamic> json) {
  return BarGraphModel(
    Percentage: (json['Percentage'] as num)?.toDouble(),
    AttemptedDate: json['AttemptedDate'] as String,
  );
}

Map<String, dynamic> _$BarGraphModelToJson(BarGraphModel instance) =>
    <String, dynamic>{
      'AttemptedDate': instance.AttemptedDate,
      'Percentage': instance.Percentage,
    };
