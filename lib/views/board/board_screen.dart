import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cattok/controllers/board_controller.dart';
import 'package:flutter_cattok/views/board/post_detail_screen.dart';
import 'package:flutter_cattok/views/board/post_screen.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as tago;

class BoardScreen extends StatelessWidget {
  BoardScreen({Key? key}) : super(key: key);

  final BoardController _boardController = Get.put(BoardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Colors.black45,
        onPressed: () {
          Get.to(() => PostScreen());
        },
        child: Icon(
          CupertinoIcons.pen,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        backgroundColor: ThemeData.dark().scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          '게시판',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView.separated(
            reverse: true,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Get.to(
                    () => PostDetailScreen(
                      title: _boardController.posts[index].title,
                      description: _boardController.posts[index].description,
                      time: _boardController.posts[index].datePublished,
                    ),
                  );
                },
                child: Container(
                  height: 70,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _boardController.posts[index].title,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          tago.format(_boardController
                              .posts[index].datePublished
                              .toDate()),
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
              color: Colors.grey,
            ),
            itemCount: _boardController.posts.length,
          ),
        ),
      ),
    );
  }
}
