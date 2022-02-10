import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/todo_controller.dart';
import 'package:flutter_application_1/controllers/user_controller.dart';
import 'package:flutter_application_1/services/theme_service.dart';
import 'package:flutter_application_1/shared/loading_widget.dart';
import 'package:get/get.dart';
import 'constants/firebase.dart';
import 'constants/theme.dart';
import 'controllers/auth_controller.dart';
import 'package:async/async.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await initialization.then((value) {
    Get.put(AuthController());
    Get.put<UserController>(UserController());
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return GetMaterialApp(
      home: Splash(),
      debugShowCheckedModeBanner: false,
     theme: Themes.light,
     darkTheme: Themes.dark,
     themeMode: ThemeService().theme,
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
