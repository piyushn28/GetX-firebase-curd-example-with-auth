import 'package:flutter_application_1/models/user.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController instance = Get.find();
  Rx<UserModel?> _userModel = UserModel().obs;

  UserModel get user => _userModel.value!;

  set user(UserModel value) => this._userModel.value = value;

  void clear() {
    _userModel.value = UserModel();
  }
}
