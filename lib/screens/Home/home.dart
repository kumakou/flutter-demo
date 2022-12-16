import 'package:flutter/material.dart';
import 'page_vegalta.dart';
import 'page_favorite.dart';
import 'page_jleague.dart';
import '../add_post_screen.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const TabBar(tabs: <Widget>[
              Tab(text: 'ベガルタ'),
              Tab(text: '推し選手'),
              Tab(text: 'Jリーグ'),
            ]),
          ),
          body: TabBarView(
            children: <Widget>[
              Page_Vegalta(),
              Page_Favorite(),
              Page_Jleague(),
            ],
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: () => {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return AddPostScreen();
                    }))
                  },
              child: const Icon(Icons.add)),
        ),
      ),
    );
  }
}
