import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String playerName;
  final String team;
  final int age;
  final String phrase;
  final String description;
  final String position;
  final String uid;
  final String username;
  final int likes;
  final List<String> likeslist;
  final String postId;
  final DateTime created_at;
  final String postImageUrl;
  final String profImageUrl;

  const Post({
    required this.playerName,
    required this.team,
    required this.age,
    required this.phrase,
    required this.description,
    required this.position,
    required this.uid,
    required this.username,
    required this.likes,
    required this.likeslist,
    required this.postId,
    required this.created_at,
    required this.postImageUrl,
    required this.profImageUrl,
  });

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
        playerName: snapshot["playerName"],
        team: snapshot["team"],
        age: snapshot["age"],
        phrase: snapshot["phrase"],
        description: snapshot["description"],
        position: snapshot["position"],
        uid: snapshot["uid"],
        username: snapshot["username"],
        likes: snapshot["likes"],
        likeslist: snapshot["likeslist"].cast<String>() as List<String>,
        postId: snapshot["postId"],
        created_at: snapshot["created_at"].toDate(),
        postImageUrl: snapshot['postImageUrl'],
        profImageUrl: snapshot['profImageUrl']);
  }

  Map<String, dynamic> toJson() => {
        "playerName": playerName,
        "team": team,
        "age": age,
        "phrase": phrase,
        "description": description,
        "position": position,
        "uid": uid,
        "username": username,
        "likes": likes,
        "likeslist": likeslist,
        "postId": postId,
        "created_at": created_at,
        'postImageUrl': postImageUrl,
        'profImageUrl': profImageUrl
      };
}
