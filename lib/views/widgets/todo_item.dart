import 'package:flutter/material.dart';
import 'package:may30/controllers/todo_controllers.dart';

class TodoItem extends StatefulWidget {
  final String title;
  final DateTime dates;
  final Function() onDelete;
  final Function() onEdit;

  TodoItem({
    super.key,
    required this.title,
    required this.dates,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  final todoController = TodoController();
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        onPressed: () {
          isCheck = !isCheck;
          setState(() {});
        },
        icon: Icon(
          isCheck ? Icons.check_circle : Icons.circle_outlined,
          color: Colors.blue,
        ),
      ),
      title: Text(widget.title),
      subtitle: Text(widget.dates.toString()),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: widget.onDelete,
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
          IconButton(
            onPressed: widget.onEdit,
            icon: const Icon(
              Icons.edit,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
