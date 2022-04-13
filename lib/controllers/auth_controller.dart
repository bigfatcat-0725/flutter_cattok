import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_cattok/models/user.dart' as model;
import 'package:flutter_cattok/views/home_screen.dart';
import 'package:flutter_cattok/views/auth/login_screen.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late Rx<User?> _user;
  User get user => _user.value!;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(FirebaseAuth.instance.currentUser);
    _user.bindStream(FirebaseAuth.instance.authStateChanges());
    ever(_user, _setInitialScreen);
  }

  _setInitialScreen(User? user) async {
    if (user == null) {
      Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(() => HomeScreen());
    }
  }

  void registerUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        UserCredential cred =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        model.User user = model.User(
          email: email,
          uid: cred.user!.uid,
        );

        await FirebaseFirestore.instance
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
      } else {
        Get.snackbar(
          'Error Creating Account',
          'Please enter all the fields',
          duration: Duration(
            seconds: 1,
          ),
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error Creating Account',
        e.toString(),
        duration: Duration(
          seconds: 1,
        ),
      );
    }
  }

  void loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
      } else {
        Get.snackbar(
          'Error Login',
          'Please enter all the fields',
          duration: Duration(
            seconds: 1,
          ),
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error Login',
        e.toString(),
        duration: Duration(
          seconds: 1,
        ),
      );
    }
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
