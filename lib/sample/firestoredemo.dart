import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Animals {}

class Firestoredemo extends StatelessWidget {
  const Firestoredemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
          // ボタンを押した時のイベント
          onPressed: () async {
            /* ここにプログラムを記載 */
            FirebaseFirestore.instance
                .doc('autoCollection1/autoDocument1')
                .update({'update': "kujira"});
          },
          child: const Text(
            '実行',
            style: TextStyle(fontSize: 50),
          )),
    );
  }
}
