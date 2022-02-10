import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/firebase.dart';
import '../../controllers/auth_controller.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Text('Yoga'),
        SizedBox(
          height: 10,
        ),
        Flexible(
          child: Container(
            height: Get.height / 2,
            width: Get.width,
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: Image.asset("assets/yoga_art_1.png"),
          ),
        ),
        Flexible(
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFF353491)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ))),
              onPressed: () {
                authController.signInWithGoogle();
              },
              child: Text('Sign in with Google')),
        )
      ],
    ));
  }
}
