import 'package:json_annotation/json_annotation.dart';
part 'todo_models.g.dart';

@JsonSerializable()
class TodoModels {
  String title;
  DateTime dates;
  bool isDone;

  TodoModels({
    required this.title,
    required this.dates,
    this.isDone = false,
  });

  factory TodoModels.fromJson(Map<String, dynamic> json) {
    return _$TodoModelsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TodoModelsToJson(this);
  }
}
