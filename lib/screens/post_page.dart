import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class PostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('投稿')),
      body: TextBox(),
      floatingActionButton: FloatingActionButton(
          onPressed: () => {}, child: const Icon(Icons.play_arrow)),
    );
  }
}

Stream<dynamic> SgetName() {
  final userDocumentSnapshots = FirebaseFirestore.instance
      .collection('users')
      .doc('rUQnsedNv2n4WIVtj8tD')
      .snapshots();

  final userName =
      userDocumentSnapshots.map((snapshot) => snapshot.data()!["username"]);
  return userName;

  // final user = userDocumentSnapshot;
}

Future<dynamic> FgetName() {
  final userDocumentSnapshot = FirebaseFirestore.instance
      .collection('users')
      .doc('rUQnsedNv2n4WIVtj8tD')
      .get();

  final user = userDocumentSnapshot;
  return user;
}

class TextBox extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final function = useMemoized(SgetName);
    final snapshot = useStream(function);

    final function2 = useMemoized(FgetName);
    final name = useFuture(function2);

    if (!snapshot.hasData) {
      return Container();
    }

    if (!name.hasData) {
      return Container();
    }

    return Center(
      child: Column(children: [
        Text(snapshot.data + "kk"),
        Text(name.data["username"] + "kkk")
      ]),
    );
    // return FutureBuilder(
    //     future: getName(),
    //     builder: (BuildContext context, data) {
    //       final userName = data.data;
    //       print(userName);
    //       return Center(child: Text(userName!));
    //     });

    // return Container(
    //     padding: const EdgeInsets.all(40),
    //     child: Column(
    //       children: <Widget>[
    //         Text(
    //           username,
    //           style: TextStyle(
    //             color: Colors.blueAccent,
    //             fontSize: 20.0,
    //             fontWeight: FontWeight.bold,
    //           ),
    //         ),
    //         TextField(
    //           style: TextStyle(color: Colors.black),
    //           maxLines: 4,
    //           onChanged: ((value) => outputText.value = value),
    //         ),
    //       ],
    //     ));
  }
}
