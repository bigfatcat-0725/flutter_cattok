import 'package:flutter/material.dart';
import 'package:flutter_cattok/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            authController.signOut();
          },
          child: Text('로그아웃'),
        ),
      ),
    );
  }
}
