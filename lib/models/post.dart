import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  String uid;
  String id;
  String title;
  String description;
  final datePublished;

  Post({
    required this.uid,
    required this.id,
    required this.title,
    required this.description,
    required this.datePublished,
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'id': id,
        'title': title,
        'description': description,
        'datePublished': datePublished,
      };

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
      uid: snapshot['uid'],
      id: snapshot['id'],
      title: snapshot['title'],
      description: snapshot['description'],
      datePublished: snapshot['datePublished'],
    );
  }
}
