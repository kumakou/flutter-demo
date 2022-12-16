import 'package:flutter/material.dart';
import 'add_post_screen.dart';

class PlayerDirectory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('選手名鑑'),
          automaticallyImplyLeading: false),
      body: Center(
        child: Text(
          "選手名鑑",
          style: TextStyle(fontSize: 20),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return AddPostScreen();
                }))
              },
          child: const Icon(Icons.add)),
    );
  }
}
