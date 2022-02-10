import 'package:flutter_application_1/constants/firebase.dart';

import '../models/todo.dart';
import 'package:get/get.dart';
import '../services/database.dart';
import 'auth_controller.dart';

class TodoController extends GetxController {
  Rx<List<TodoModel>> todoList = Rx<List<TodoModel>>([]);

  List<TodoModel> get todos => todoList.value;

  @override
  void onInit() {
    //print("uiddd le------------${authController.user!.uid}");
    try{
      todoList
          .bindStream(Database().todoStream(authController.user!.uid));
    }catch(e){
      print(e);
    }
  }
}
