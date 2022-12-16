import 'package:flutter/material.dart';
import '../../widgets/carousel/favorite_carousel.dart';
import '../../widgets/carousel/recent_carousel.dart';

class Page_Vegalta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Color.fromRGBO(25, 85, 166, 1.0),
            padding: const EdgeInsets.fromLTRB(30, 5, 10, 5),
            height: 80,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  backgroundImage:
                      AssetImage("assets/image/player2022_01_index.jpg"),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(30, 10, 10, 10),
                  child: Column(
                    children: [
                      Text(
                        "Yuma Obata",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 5, 5, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(34, 75, 143, 1.0),
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(3),
                              width: 15,
                              child: Image.asset("assets/image/profile_icon.png"),
                            ),
                            Text(
                              "Vegada Sendai   ",
                              style: TextStyle(
                                  fontSize: 10, color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(70, 5, 5, 0),
                  child: Column(
                    children: [
                      Text(
                        "活躍度",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        width: 45,
                        height: 45,
                        child: Text(
                          'A+',
                          style: TextStyle(
                            color: Colors.redAccent,
                          ),
                        ),
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue[100],
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(18, 10, 0, 10),
            child: Text(
              "最近の投稿",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 14.0,
                  color: Color.fromRGBO(25, 85, 166, 1.0),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Recent_Carousel(),
          Container(
            margin: EdgeInsets.fromLTRB(18, 10, 0, 10),
            child: Text(
              "人気の投稿",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 14.0,
                  color: Color.fromRGBO(25, 85, 166, 1.0),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Favorite_carousel(),
        ],
      ),
    );
  }
}
