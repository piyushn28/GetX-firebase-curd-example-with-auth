import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/user_controller.dart';
import '../../constants/firebase.dart';
import '../../constants/todo_card.dart';
import '../../controllers/auth_controller.dart';
import 'package:get/get.dart';

import '../../controllers/todo_controller.dart';
import '../../models/todo.dart';
import '../../services/database.dart';

class HomePage extends GetWidget<AuthController> {
  final TextEditingController _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text('${controller.user?.displayName}')),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              controller.signOut();
            },
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              if (Get.isDarkMode) {
                Get.changeTheme(ThemeData.light());
              } else {
                Get.changeTheme(ThemeData.dark());
              }
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text(
            "Add Todo Here:",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Card(
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _todoController,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      if (_todoController.text != "" ) {
                        Database().addTodo(_todoController.text,
                            controller.user!.uid);
                        Get.snackbar('SUCCES', 'Task Added',
                            backgroundColor: Colors.blue,
                            icon: Icon(Icons.check),
                            duration: (Duration(seconds: 2)));
                        _todoController.clear();
                      } else {
                        Get.snackbar('ALERT !', 'Enter Your task',
                            barBlur: 20,
                            icon: Icon(Icons.add_alert),
                            backgroundColor: Colors.red,
                            duration: (Duration(seconds: 2)));
                      }
                    },
                  )
                ],
              ),
            ),
          ),
          Text(
            "Your Todos",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          GetX<TodoController>(
            init: Get.put<TodoController>(TodoController()),
            builder: (TodoController todoController) {
              if (todoController != null && todoController.todos != null) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: todoController.todos.length,
                    itemBuilder: (_, index) {
                      return TodoCard(
                          uid: controller.user?.uid,
                          todo: todoController.todos[index]);
                    },
                  ),
                );
              } else {
                return Text("loading...");
              }
            },
          )
        ],
      ),
    );
  }
}
