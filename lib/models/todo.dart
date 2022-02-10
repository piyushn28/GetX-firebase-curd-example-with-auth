import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  late String content;
  late String todoId;
  // String title;
  late Timestamp dateCreated;
  late bool done;

  TodoModel({
    required this.content,
    required this.todoId,
    // this.title,
    required this.dateCreated,
    required this.done,
  });

  TodoModel.fromDocumentSnapshot(
      DocumentSnapshot documentSnapshot,
      ) {
    // ignore: deprecated_member_use
    todoId = documentSnapshot.id;
    content = documentSnapshot["content"];
    // title = documentSnapshot.data()["title"];
    dateCreated = documentSnapshot["dateCreated"];
    done = documentSnapshot["done"];
  }

  toJson() {
    return {"content": content, "done": done};
  }
}
