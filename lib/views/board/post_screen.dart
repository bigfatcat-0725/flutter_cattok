import 'package:flutter/material.dart';
import 'package:flutter_cattok/controllers/board_controller.dart';
import 'package:get/get.dart';

class PostScreen extends StatelessWidget {
  PostScreen({Key? key}) : super(key: key);
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _desController = TextEditingController();
  final BoardController _boardController = Get.put(BoardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeData.dark().scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            32,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('- Title'),
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  hintText: 'Title',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('- Description'),
              TextField(
                controller: _desController,
                decoration: InputDecoration(
                  hintText: 'Description',
                ),
                maxLines: 999,
                minLines: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      _boardController.uploadPost(
                          _titleController.text, _desController.text);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text('글쓰기'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
