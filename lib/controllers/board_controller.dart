import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_cattok/constants.dart';
import 'package:flutter_cattok/models/post.dart';
import 'package:get/get.dart';

class BoardController extends GetxController {
  final Rx<List<Post>> _posts = Rx<List<Post>>([]);
  List<Post> get posts => _posts.value;

  @override
  void onInit() {
    super.onInit();
    _posts.bindStream(firestore
        .collection('posts')
        .orderBy('datePublished')
        .snapshots()
        .map((QuerySnapshot query) {
      List<Post> retVal = [];
      for (var element in query.docs) {
        retVal.add(
          Post.fromSnap(element),
        );
      }
      return retVal;
    }));
  }

  void uploadPost(String title, String description) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;
      if (title.isNotEmpty && description.isNotEmpty) {
        // DocumentSnapshot userDoc =
        //     await firestore.collection('users').doc(uid).get();

        var allDocs = await firestore.collection('posts').get();
        int len = allDocs.docs.length;

        Post post = Post(
          uid: uid,
          id: 'Post $len',
          title: title,
          description: description,
          datePublished: DateTime.now(),
        );

        await firestore.collection('posts').add(
              post.toJson(),
            );
        Get.back();
      }
    } catch (e) {
      Get.snackbar(
        'Error Uploading Post',
        e.toString(),
      );
    }
  }
}
