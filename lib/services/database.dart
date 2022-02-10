import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_application_1/constants/firebase.dart';
import 'package:flutter_application_1/controllers/todo_controller.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:get/get.dart';
import '../models/todo.dart';

class Database {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<bool?> createNewUser(UserModel user) async {
    try {
      await _firebaseFirestore
          .collection("users")
          .doc(user.uid)
          .set({"name": user.name, "email": user.email});
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot _doc =
      await _firebaseFirestore.collection("users").doc(uid).get();

      return UserModel.fromSnapshot(_doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }


  Future<void> addTodo(String content, String uid) async {
    try {
      await _firebaseFirestore.collection("users").doc(uid).collection("todos").add({
        'dateCreated': Timestamp.now(),
        'content': content,
        'done': false,
        // 'title' : title,
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Stream<List<TodoModel>> todoStream(String uid) {
    return _firebaseFirestore
        .collection("users")
        .doc(uid)
        .collection("todos")
        .orderBy("dateCreated")
        .snapshots()
        .map((QuerySnapshot query) {
      List<TodoModel> retVal = [];
      query.docs.forEach((element) {
        retVal.add(TodoModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }


  Future<void> updateTodo(bool newValue, String uid, String todoId) async {
    try {
      _firebaseFirestore
          .collection("users")
          .doc(uid)
          .collection("todos")
          .doc(todoId)
          .update({"done": newValue});
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> updateOne(
      String newcontentValue, String uid, String todoId) async {
    try {
      _firebaseFirestore
          .collection("users")
          .doc(uid)
          .collection("todos")
          .doc(todoId)
          .update({"content": newcontentValue});
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  deleteOne(String uid, String todoId) async {
    try{
      _firebaseFirestore.collection("users").doc(uid).collection("todos").doc(todoId).delete();
    }
    catch(e){print(e);
    rethrow;
    }

  }


}
