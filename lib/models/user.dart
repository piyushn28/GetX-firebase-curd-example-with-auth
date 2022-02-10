import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? email;
  String? name;
  String? uid;

  UserModel({this.email, this.name, this.uid});

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    email = snapshot['email'];
    name = snapshot['name'];
    uid = snapshot['uid'];
  }
}
