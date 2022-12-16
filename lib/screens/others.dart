import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_screen.dart';

class Others extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('その他'),
          automaticallyImplyLeading: false),
      body: Center(
        child: TextButton(
          child: Text(
            "ログアウト",
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () async {
            await auth.signOut();
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ));
          },
        ),
      ),
    );
  }
}
