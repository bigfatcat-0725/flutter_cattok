import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cattok/controllers/video_controller.dart';
import 'package:flutter_cattok/views/auth/video_player_item.dart';
import 'package:flutter_cattok/views/confirm_screen.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class VideoScreen extends StatelessWidget {
  VideoScreen({Key? key}) : super(key: key);

  pickVideo(ImageSource src, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      Get.to(() => ConfirmScreen(
            videoFile: File(video.path),
            videoPath: video.path,
          ));
    }
  }

  showOptionDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        children: [
          SimpleDialogOption(
            onPressed: () => pickVideo(ImageSource.gallery, context),
            child: Row(
              children: const [
                Icon(Icons.image),
                Padding(
                  padding: EdgeInsets.all(7.0),
                  child: Text(
                    'Gallery',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed: () => pickVideo(ImageSource.camera, context),
            child: Row(
              children: const [
                Icon(Icons.camera),
                Padding(
                  padding: EdgeInsets.all(7.0),
                  child: Text(
                    'Camera',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed: () => Navigator.of(context).pop(),
            child: Row(
              children: const [
                Icon(Icons.cancel),
                Padding(
                  padding: EdgeInsets.all(7.0),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  final VideoController videoController = Get.put(VideoController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black45,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          elevation: 0,
          onPressed: () {
            showOptionDialog(context);
          },
        ),
        body: PageView.builder(
          itemCount: videoController.videoList.length,
          controller: PageController(initialPage: 0, viewportFraction: 1),
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            final size = MediaQuery.of(context).size;
            final data = videoController.videoList[index];
            return Stack(
              children: [
                VideoPlayerItem(
                  videoUrl: data.videoUrl,
                ),
                Positioned(
                  left: 20,
                  bottom: 20,
                  child: Text(
                    data.title,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black45,
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.5,
                  right: size.height * 0.02,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Image.asset(
                          'assets/cat-foot.png',
                          width: 40,
                          height: 40,
                          color: Colors.black45,
                          //  평소 회색 누르면 기본 핑크색
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '0',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.comment_outlined,
                          color: Colors.black45,
                          size: 40,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '0',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
