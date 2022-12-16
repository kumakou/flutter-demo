import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final List<String> followers;
  final List<String> following;
  final DateTime created_at;
  final DateTime updated_at;
  final String gender;
  final int age;
  final int rate;
  final int fanlevel;
  final List<String> favoritePlayer;
  final List<String> favoriteTeam;
  final List<String> badge;

  const User(
      {required this.username,
      required this.uid,
      required this.photoUrl,
      required this.email,
      required this.followers,
      required this.following,
      required this.created_at,
      required this.updated_at,
      required this.gender,
      required this.age,
      required this.rate,
      required this.fanlevel,
      required this.favoritePlayer,
      required this.favoriteTeam,
      required this.badge});

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
        username: snapshot["username"],
        uid: snapshot["uid"],
        email: snapshot["email"],
        photoUrl: snapshot["photoUrl"],
        followers: snapshot["followers"].cast<String>() as List<String>,
        following: snapshot["following"].cast<String>() as List<String>,
        created_at: snapshot["created_at"].toDate(),
        updated_at: snapshot["updated_at"].toDate(),
        gender: snapshot["gender"],
        age: snapshot["age"],
        rate: snapshot["rate"],
        fanlevel: snapshot["fanlevel"],
        favoritePlayer:
            snapshot["favoritePlayer"].cast<String>() as List<String>,
        favoriteTeam: snapshot["favoriteTeam"].cast<String>() as List<String>,
        badge: snapshot["badge"].cast<String>() as List<String>);
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "email": email,
        "photoUrl": photoUrl,
        "followers": followers,
        "following": following,
        "created_at": created_at,
        "updated_at": updated_at,
        "gender": gender,
        "age": age,
        "rate": rate,
        "fanlevel": fanlevel,
        "favoritePlayer": favoritePlayer,
        "favoriteTeam": favoriteTeam,
        "badge": badge
      };
}
