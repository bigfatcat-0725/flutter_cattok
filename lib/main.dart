import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cattok/controllers/auth_controller.dart';
import 'package:flutter_cattok/views/board/board_screen.dart';
import 'package:flutter_cattok/views/home_screen.dart';
import 'package:flutter_cattok/views/auth/login_screen.dart';
import 'package:flutter_cattok/views/auth/sign_screen.dart';
import 'package:flutter_cattok/views/video_screen.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => {Get.put(AuthController())});
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CATTOK',
      // theme: ThemeData(
      //   primarySwatch: Colors.grey,
      // ),
      theme: ThemeData.dark(),
      home: LoginScreen(),
    );
  }
}
