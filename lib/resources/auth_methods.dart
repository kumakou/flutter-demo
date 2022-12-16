import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import '../models/user.dart' as model;
import 'storage_methods.dart';

class Auth_Methods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // get uesr details
  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot documentSnapshot =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(documentSnapshot);
  }

  Future<String> signUpUser(
      {required String email,
      required String password,
      required String username,
      required String gender,
      required int age,
      required Uint8List file}) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          gender.isNotEmpty ||
          file != null) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);

        model.User _user = model.User(
            email: email,
            uid: cred.user!.uid,
            photoUrl: photoUrl,
            username: username,
            followers: [],
            following: [],
            created_at: DateTime.now(),
            updated_at: DateTime.now(),
            gender: gender,
            age: age,
            rate: 0,
            fanlevel: 2,
            favoritePlayer: [],
            favoriteTeam: [],
            badge: []);

        // adding user in our database
        await _firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(_user.toJson());

        res = "succses";
      } else {
        res = "Plese enter all fields";
      }
    } catch (e) {
      return e.toString();
    }
    return res;
  }

  // logging in user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        // logging in user with email and password
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
