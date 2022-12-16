import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final player_review = [
  {
    "catch_phrase": "若き守護神",
    "player_name": "小畑　裕馬",
    "player_from": "宮城県",
    "player_birth": "2001",
    "player_image":
        "https://prtimes.jp/i/35286/283/ogp/d35286-283-675093-0.jpg",
    "user_name": "イルカ太郎",
    "user_icon":
        "https://nagoyaaqua.jp/wp/wp-content/uploads/2022/07/220730-1eye.jpg",
    "text": "ベガルタの広報カメラで卓球を選手たちで行った際、末っ子の彼は得点係しかやらせてもらえなかった。2-2の時のダブルピースでかわいい"
  },
  {
    "catch_phrase": "絶対的ストライカー",
    "player_name": "ハリー・ケイン",
    "player_from": "ロンドン",
    "player_birth": "1993",
    "player_image":
        "https://www.football-zone.net/wp-content/uploads/2022/08/28181919/20210828_Harry-Kane-Getty.jpg",
    "user_name": "ぐんぴぃ",
    "user_icon":
        "https://pbs.twimg.com/profile_images/1344088035722362880/gwR31nka_400x400.jpg",
    "text": "誠に遺憾です"
  },
  {
    "catch_phrase": "屋台骨",
    "player_name": "蜂須賀孝治",
    "player_from": "栃木県",
    "player_birth": "1990",
    "player_image":
        "https://www.vegalta.co.jp/backnumber/img/2019/12/4c9fe5c8347b8df9c90acd6bc7edd9a4.jpg",
    "user_name": "hoge",
    "user_icon": "https://www.shin-tan.com/wp-content/uploads/2015/09/hoge.jpg",
    "text": "hogehhoghoghogehogehhohogegeogehogehogehogehogehogeeeoge"
  },
  {
    "catch_phrase": "ストライカー",
    "player_name": "中山仁斗",
    "player_from": "兵庫",
    "player_birth": "1992",
    "player_image":
        "https://soccerdigestweb.thedigestweb.com/v=1663881212/files/topics/117422_ext_04_0.jpg",
    "user_name": "CC lemon",
    "user_icon":
        "https://pbs.twimg.com/profile_images/1148092745384263680/dxx3JV_X_400x400.png",
    "text": "C.C.レモン（C.C. Lemon）は、サントリーフーズ（サントリー食品インターナショナル）が販売するソフトドリンクである。"
  },
  {
    "catch_phrase": "史上最高のアジア人",
    "player_name": "孫興民",
    "player_from": "韓国",
    "player_birth": "1992",
    "player_image":
        "http://www.soccerdigestweb.com/files/topics/96431_ext_04_0_L.jpg",
    "user_name": "エベレスト",
    "user_icon":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Everest_North_Face_toward_Base_Camp_Tibet_Luca_Galuzzi_2006.jpg/300px-Everest_North_Face_toward_Base_Camp_Tibet_Luca_Galuzzi_2006.jpg",
    "text": "エベレストエベレストエベレストエベレストエベレストエベレストエベレスト"
  },
];

class Favorite_carousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        options: CarouselOptions(
          height: 300.0,
        ),
        items: player_review.map((e) {
          return Builder(builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(30),
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  image: DecorationImage(
                    image: NetworkImage(e["player_image"]!),
                    fit: BoxFit.fitHeight,
                  )),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          e["catch_phrase"]!,
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 14.0, color: Colors.white),
                        ),
                        Text(
                          e["player_name"]!,
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 22.0, color: Colors.white),
                        ),
                        Text(
                          e["player_from"]! + "出身　" + e["player_birth"]! + "生",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 10.0, color: Colors.white),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 40),
                          color: Colors.white70,
                          child: Text(
                            e["text"]!,
                            textAlign: TextAlign.left,
                            style:
                                TextStyle(fontSize: 12.0, color: Colors.black),
                          ),
                        )
                      ],
                    )),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(e["user_icon"]!),
                        ),
                        Text(
                          e["user_name"]!,
                          style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.black,
                              backgroundColor: Colors.white54),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
        }).toList());
  }
}
