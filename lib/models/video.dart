import 'package:cloud_firestore/cloud_firestore.dart';

class Video {
  String uid;
  String id;
  String title;
  List likes;
  int commentCount;
  String videoUrl;
  String thumbnail;

  Video({
    required this.uid,
    required this.id,
    required this.likes,
    required this.commentCount,
    required this.title,
    required this.videoUrl,
    required this.thumbnail,
  });

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "id": id,
        "likes": likes,
        "commentCount": commentCount,
        "title": title,
        "videoUrl": videoUrl,
        "thumbnail": thumbnail,
      };

  static Video fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Video(
      uid: snapshot['uid'],
      id: snapshot['id'],
      likes: snapshot['likes'],
      commentCount: snapshot['commentCount'],
      title: snapshot['title'],
      videoUrl: snapshot['videoUrl'],
      thumbnail: snapshot['thumbnail'],
    );
  }
}
