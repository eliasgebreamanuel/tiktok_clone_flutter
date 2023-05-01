import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants.dart';
import 'package:flutter_application_2/controllers/auth_controllers.dart';
import 'package:flutter_application_2/views/screens/auth/login_screen.dart';
import 'package:flutter_application_2/views/screens/auth/signup_screen.dart';
import 'package:get/get.dart';

void main() async {
  // this is usd to enure our widgets are inintialized
  WidgetsFlutterBinding.ensureInitialized();
  // this is used to inintlized the app
  await Firebase.initializeApp().then((value) {
    Get.put(AuthController());
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // this is used to hide the debugshowchecked mode banner
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      //this is used to set the theme  of the app
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
      home: LoginScreen(),
    );
  }
}
