import 'package:may30/models/todo_models.dart';

class TodoController {
  final List<TodoModels> _list = [
    TodoModels(title: "GYM", dates: DateTime.parse("2024-05-06")),
    TodoModels(
        title: "Reading", dates: DateTime.parse("2024-06-09"), isDone: true),
  ];

  List<TodoModels> get list {
    return [..._list];
  }

  void todoAdd(String title, DateTime date) {
    _list.add(TodoModels(title: title, dates: date, isDone: false));
    
  }

  void todoEdit(int index, String newTitle, DateTime newDates) {
    _list[index].title = newTitle;
    _list[index].dates = newDates;
    _list[index].isDone = false;
  }

  void todoRemove(int index) {
    _list.removeAt(index);
  }
}
