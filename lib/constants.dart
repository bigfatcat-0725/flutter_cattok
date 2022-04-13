import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_cattok/controllers/auth_controller.dart';
import 'package:flutter_cattok/views/board/board_screen.dart';
import 'package:flutter_cattok/views/profile_screen.dart';
import 'package:flutter_cattok/views/video_screen.dart';

List pages = [
  VideoScreen(),
  BoardScreen(),
  ProfileScreen(),
];

var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

var authController = AuthController.instance;
