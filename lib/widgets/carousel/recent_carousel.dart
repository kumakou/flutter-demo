import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';

final review = [
  {
    "user_name": "イルカ太郎",
    "user_icon":
        "https://nagoyaaqua.jp/wp/wp-content/uploads/2022/07/220730-1eye.jpg",
    "text": "ベガルタの広報カメラで卓球を選手たちで行った際、末っ子の彼は得点係しかやらせてもらえなかった。2-2の時のダブルピースでかわいい"
  },
  {
    "user_name": "ぐんぴぃ",
    "user_icon":
        "https://pbs.twimg.com/profile_images/1344088035722362880/gwR31nka_400x400.jpg",
    "text": "誠に遺憾です"
  },
  {
    "user_name": "hoge",
    "user_icon": "https://www.shin-tan.com/wp-content/uploads/2015/09/hoge.jpg",
    "text": "hogehhoghoghogehogehhohogegeogehogehogehogehogehogeeeoge"
  },
  {
    "user_name": "CC lemon",
    "user_icon":
        "https://pbs.twimg.com/profile_images/1148092745384263680/dxx3JV_X_400x400.png",
    "text": "C.C.レモン（C.C. Lemon）は、サントリーフーズ（サントリー食品インターナショナル）が販売するソフトドリンクである。"
  },
  {
    "user_name": "エベレスト",
    "user_icon":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Everest_North_Face_toward_Base_Camp_Tibet_Luca_Galuzzi_2006.jpg/300px-Everest_North_Face_toward_Base_Camp_Tibet_Luca_Galuzzi_2006.jpg",
    "text": "エベレストエベレストエベレストエベレストエベレストエベレストエベレスト"
  },
];

class Recent_Carousel extends StatelessWidget {
  CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: buttonCarouselController,
      options: CarouselOptions(
        height: 100.0,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 5),
      ),
      items: review.map((r) {
        return Builder(builder: (BuildContext context) {
          return Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      child: Text(
                        r['text']!,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(r["user_icon"]!),
                      ),
                      Text(r["user_name"]!)
                    ],
                  )
                ],
              ));
        });
      }).toList(),
    );
  }
}
