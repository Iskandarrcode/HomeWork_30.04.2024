import 'package:flutter/material.dart';
import 'package:may30/controllers/todo_controllers.dart';
import 'package:may30/views/widgets/add_todo_show_dialog.dart';
import 'package:may30/views/widgets/edit_todo_show_dialog.dart';
import 'package:may30/views/widgets/todo_item.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final todoController = TodoController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(
          child: Text("ToDo App"),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (ctx) {
                    return const AddTodo();
                  });
            },
            icon: const Icon(Icons.add),
            iconSize: 25,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: todoController.list.length,
                itemBuilder: (context, index) {
                  return TodoItem(
                    title: todoController.list[index].title,
                    dates: todoController.list[index].dates,
                    onDelete: () {
                      todoController.todoRemove(index);
                      setState(() {});
                    },
                    // onEdit: () {
                    //   showDialog(
                    //       context: context,
                    //       builder: (ctx) {
                    //         return EditTodo(
                    //           index: index,
                    //         );
                    //       });
                    //   setState(() {});
                    // },
                    onEdit: () async {
                      Map<String, dynamic>? data = await showDialog(
                          context: context,
                          builder: (ctx) {
                            return EditTodo(
                              index: index,
                            );
                          });

                      if (data != null) {
                        todoController.todoEdit(
                          index,
                          data["id"],
                          data["title"],
                        );
                        setState(() {}); // Ensure the screen updates
                      }
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
