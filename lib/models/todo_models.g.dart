// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoModels _$TodoModelsFromJson(Map<String, dynamic> json) => TodoModels(
      title: json['title'] as String,
      dates: DateTime.parse(json['dates'] as String),
      isDone: json['isDone'] as bool,
    );

Map<String, dynamic> _$TodoModelsToJson(TodoModels instance) =>
    <String, dynamic>{
      'title': instance.title,
      'dates': instance.dates.toIso8601String(),
      'isDone': instance.isDone,
    };
