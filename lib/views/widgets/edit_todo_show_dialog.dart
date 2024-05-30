import 'package:flutter/material.dart';
import 'package:may30/controllers/todo_controllers.dart';

class EditTodo extends StatefulWidget {
  final int index;
  const EditTodo({
    super.key,
    required this.index,
  });

  @override
  State<EditTodo> createState() => _EditTodoState();
}

class _EditTodoState extends State<EditTodo> {
  final todoController = TodoController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController indexController = TextEditingController();

  String title = "";
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 27, 42, 107),
      title: Text(
        "Edit todo",
        style: TextStyle(
          color: Colors.grey.shade400,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: titleController,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              label: Text(
                "Title",
                style: TextStyle(
                  color: Colors.grey.shade400,
                ),
              ),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Input Title";
              }
              return null;
            },
            onSaved: (newTodo) {
              if (newTodo != null) {
                title = newTodo;
              }
            },
          ),
          TextFormField(
            controller: dateController,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              label: Text(
                "Date",
                style: TextStyle(
                  color: Colors.grey.shade400,
                ),
              ),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Input Date";
              }
              return null;
            },
            onSaved: (newTodo) {
              if (newTodo != null) {
                title = newTodo;
              }
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "Exit",
            style: TextStyle(
              color: Colors.grey.shade400,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            todoController.todoEdit(
              widget.index,
              titleController.text,
              DateTime.parse(dateController.text),
            );
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          child: const Text("Edit"),
        )
      ],
    );
  }
}
