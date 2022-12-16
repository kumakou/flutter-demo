import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/sample/utl/swiper_card.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Swiper extends StatelessWidget {
  const Swiper({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 200,
      child: Stack(children: [
        //tinderのカードが集められる部分
        SwiperCard(color: Colors.deepPurple)
      ]),
    );
  }
}
