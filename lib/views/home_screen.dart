import 'package:flutter/material.dart';
import 'package:flutter_cattok/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (idx) {
          setState(() {
            pageIdx = idx;
          });
        },
        selectedItemColor: Colors.black,
        currentIndex: pageIdx,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.video_collection),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.comment),
            label: '',
          ),
        ],
      ),
      body: pages[pageIdx],
    );
  }
}
