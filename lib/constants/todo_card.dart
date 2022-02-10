import 'package:flutter/material.dart';

import '../models/todo.dart';
import '../services/database.dart';

class TodoCard extends StatelessWidget {
  String? uid;
  TodoModel? todo;

  TodoCard({Key? key, this.uid, this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                todo!.content.toString(),
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Checkbox(
            //   value: todo?.done,
            //   onChanged: (newValue) {
            //     Database().updateTodo(newValue, uid, todo.todoId);
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
