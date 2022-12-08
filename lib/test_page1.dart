import 'package:flutter/material.dart';
import 'test_page2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class TestPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Test1"),
        ),
        body: Center(
          child: Column(children: [
            TextButton(
              onPressed: () => {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return TestPage2();
                  },
                ))
              },
              child: const Text(
                "進む",
                style: TextStyle(fontSize: 80),
              ),
            ),
            Icon(FontAwesomeIcons.gift, color: Colors.teal),
          ]),
        ));
  }
}
