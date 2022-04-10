import 'package:flutter/material.dart';
import 'package:flutter_cattok/views/board_screen.dart';
import 'package:flutter_cattok/views/home_screen.dart';
import 'package:flutter_cattok/views/login_screen.dart';
import 'package:flutter_cattok/views/sign_screen.dart';
import 'package:flutter_cattok/views/video_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CATTOK',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: BoardScreen(),
    );
  }
}
