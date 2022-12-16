import 'package:flutter/material.dart';
import '../../widgets/card-swipe/cardstackwidget.dart';
import '../../widgets/card-swipe/parts/backgroundcurvewidget.dart';

class Page_Favorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: const [
        BackgroudCurveWidget(),
        CardsStackWidget(),
      ],
    ));
  }
}
